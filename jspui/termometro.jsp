<%--
  Created by IntelliJ IDEA.
  User: Divino Ignacio Ribeiro Jr
  Date: 03/08/2020
  Time: 20:42
  Version: 3.0

  Utiliza biblioteca javascript gauge.js para produzir o painel de medida da qualidade dos metadados do item.
  a medida de qualidade é calculada segundo um critério pré-definido para cada metadado apresentado na collection
  herdada nos formulários de submissão e visualização o item.
--%>

<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.commons.validator.routines.UrlValidator" %>
<%@ page import="org.dspace.app.util.SubmissionInfo" %>
<%@ page import="org.dspace.app.webui.servlet.SubmissionController" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Item" %>
<%@ page import="org.dspace.content.MetadataValue" %>
<%@ page import="org.dspace.content.factory.ContentServiceFactory" %>
<%@ page import="org.dspace.core.Context" %>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.DateTimeParseException" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.collections4.SortedBidiMap" %>
<%@ page import="org.apache.commons.collections4.bidimap.DualTreeBidiMap" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.eperson.EPerson" %>

<%
    // buffer de mensagens
    StringBuffer debugBuffer = new StringBuffer();
    StringBuffer reportBuffer = new StringBuffer();

    /* DualHashBidiMaps: para permitir a recuperação de chaves através dos seus valores com menos código ;)
       Obs.: BidiMaps não suportam chaves duplicadas nem valores duplicados (implementa somente mapas 1:1)! */
    SortedBidiMap<String, String> metadataLabels = new DualTreeBidiMap<>();

    /* filtra para um mapa ordenado */
    SortedMap<String, String> termometroProperties = new TreeMap<>();
    SortedMap<String, String> collectionHandles = new TreeMap<>();
    SortedMap<String, String> metadataSet = new TreeMap<>();
    SortedMap<String, Integer> metadataEvaluatedPoints = new TreeMap<>();
    SortedMap<String, Integer> metadataMaxPoints = new TreeMap<>();
    SortedMap<String, String> report = new TreeMap<>();

    SortedMap<String, String> countResponses = new TreeMap<>();
    SortedMap<String, String> countResponsesPoints = new TreeMap<>();
    SortedMap<String, Integer> countResponsesLimitMax = new TreeMap<>();
    SortedMap<String, Integer> countResponsesPointsMax = new TreeMap<>();

    SortedMap<String, String> metadataScaleValues = new TreeMap<>();
    SortedMap<String, String> metadataScalePoints = new TreeMap<>();
    SortedMap<String, Integer> metadataScalePointsMax = new TreeMap<>();

    SortedMap<String, String> metadataPoints = new TreeMap<>();
    SortedMap<String, String> metadataRules = new TreeMap<>();

    /* maps de apoio para SEGUNDO TERMOMETRO */
    SortedMap<String, String> metadataSegundoTermometroScaleValues = new TreeMap<>();
    SortedMap<String, String> metadataSegundoTermometroScalePoints = new TreeMap<>();
    SortedMap<String, Integer> metadataSegundoTermometroEvaluatedPoints = new TreeMap<>();

    /* TODO: TESTAR EM ITENS VICULADOS EM MAIS DE UMA COLEÇÃO */

    /* para obter o handle da coleção dependendo do script que incluiu 'termometro.jsp'
       a instancia 'item' está declarada nos scripts 'display-item.jsp' e em 'review-metadata.jsp'. */
    List<Collection> colecoes = new ArrayList<>();

    /* obtem a(s) colecoe(s) a(os) qual(is) o item exibido
       em display-item.jsp esta(ao) vinculado(s)  */
    if (request.getAttribute("collections") != null) {
        List<Collection> collectionsDisplay = (List<Collection>) request.getAttribute("collections");
        if (collectionsDisplay != null) {
            colecoes = collectionsDisplay;
        }
    }

    /* obtem a colecao na qual a submissao esta
       em andamento em review-metadata.jsp */
    Context contexto = UIUtil.obtainContext(request);
    SubmissionInfo subInfoInContext = SubmissionController.getSubmissionInfo(contexto, request);
    if (subInfoInContext != null) {
        if (subInfoInContext.getSubmissionItem() != null) {
            Collection tmpColecao = subInfoInContext.getSubmissionItem().getCollection();
            colecoes.add(tmpColecao);
        }
    }

    /* informacoes de usuario, idioma e autorizacoes */
    EPerson ep = null;
    if (contexto.getCurrentUser() != null) {
        ep = contexto.getCurrentUser();
    }

    if (subInfoInContext != null) {
        if (subInfoInContext.getSubmissionItem() != null) {
            ep = subInfoInContext.getSubmissionItem().getSubmitter();
        }
    }

    /* USAR CONTEXTO DO USUARIO OU DO AMBIENTE? */
    Locale supportedLocale = contexto.getCurrentLocale();
    if (ep != null) {
        //supportedLocale = I18nUtil.getEPersonLocale(ep);
    }

    /* totalizador de pontos validados */
    int sumValidPoints = 0;

    /* registra o máximo de pontos que podem ser obtidos */
    int maxPoints = 0;

    /* resultado em percentual para o display do medidor */
    float resultIndicador;
    String indicadorTermometro = "0";

    /* flag de exibição do display: mostra somente se houver sido processado */
    boolean showDisplay = false;

    /* pontos do SEGUNDO TERMOMETRO */
    String indicadorSegundoTermometro = "0";

    /* flag de exibição do display do SEGUNDO TERMOMETRO: mostra somente se houver sido processado */
    boolean showSegundoTermometro = false;

    /* carrega a coleção de propriedades do ambiente do repositorio */
    Properties propertiesDspaceEnv = DSpaceServicesFactory.getInstance().getConfigurationService().getProperties();
    Set<String> propertiesNamesDspaceEnv = propertiesDspaceEnv.stringPropertyNames();

    /* separa as propriedades do termometro para uso posterior e otimizar o tempo de leitura às configurações
       processa como propriedades array pois os textos tem virgulas e devem ser restaurados para forma original*/
    for (String proprertyName : propertiesNamesDspaceEnv) {
        String[] valores;
        if (proprertyName.startsWith("termometro.")) {
            valores = DSpaceServicesFactory.getInstance().getConfigurationService().getArrayProperty(proprertyName);
            String valor = Arrays.toString(valores);
            valor = valor.substring(1, valor.length() - 1);
            termometroProperties.put(proprertyName, valor);
        }
    }

    /* separa as colecoes onde o termometro aparece na lista de parametros e inclui
       somente se a colecao que chamou o script, se estiver presente nessa lista.
       requisito para ativar ou desativar a exibição do display do termometro */
    for (Map.Entry<String, String> termometroProperty : termometroProperties.entrySet()) {
        if (termometroProperty.getKey().endsWith(".handle")) {
            for (Collection colecao : colecoes) {
                if (colecao.getHandle().equals(termometroProperty.getValue())) {
                    collectionHandles.put(termometroProperty.getKey(), termometroProperty.getValue());
                    showDisplay = true;
                }
            }
        }
    }

    /* prepara os maps com parametros (nomes dos metadados, regras, pontuação, escala e valores de escala)
       para as etapas posteriores (carga dos valores dos metadados e avaliação dos metadados) */
    for (Map.Entry<String, String> collection : collectionHandles.entrySet()) {
        /* propertyNameParts:
           0          1          2 3
           |          |          | |
           termometro.collection.x.handle */
        String[] propertyNameParts = collection.getKey().split("\\.");
        String propCollectionPrefix = propertyNameParts[0] + "." + propertyNameParts[1] + "." + propertyNameParts[2];
        for (Map.Entry<String, String> termometroProperty : termometroProperties.entrySet()) {
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9]$")) {
                metadataLabels.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            /* Avaliacao Fase 1 */
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].countResponses.\\d*[0-9]$")) {
                countResponses.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].countResponsesPoints.\\d*[0-9]$")) {
                countResponsesPoints.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            /* Avaliacao Fase 2 */
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].scaleValue.\\d*[0-9]$")) {
                metadataScaleValues.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].scalePoints.\\d*[0-9]$")) {
                metadataScalePoints.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            /* Avaliacao Fase 3 */
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].rule$")) {
                metadataRules.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].points$")) {
                metadataPoints.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            /* Avaliacao Fase 4 */
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].segundo-termometro.scaleValue.\\d*[0-9]$")) {
                metadataSegundoTermometroScaleValues.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
            if (termometroProperty.getKey().matches("^" + propCollectionPrefix + ".metadata.\\d*[0-9].segundo-termometro.scalePoints.\\d*[0-9]$")) {
                metadataSegundoTermometroScalePoints.put(termometroProperty.getKey(), termometroProperty.getValue());
            }
        }

        /* se houver parametros na Fase 1, remove repetições nas Fases 2 e 3 */
        /* usa HashSet 'paralelo' para exluir itens no loop sem erros ConcurrentModificationException */
        HashSet<String> listaValues = new HashSet<>(metadataScaleValues.keySet());
        HashSet<String> listaPoints = new HashSet<>(metadataScalePoints.keySet());
        for (Map.Entry<String, String> parametro : countResponses.entrySet()) {
            String keyParam = StringUtils.substringBefore(parametro.getKey(), ".countResponses");
            for (String chave : listaValues) {
                if (chave.startsWith(keyParam)) {
                    metadataScaleValues.remove(chave);
                }
            }
            for (String chave : listaPoints) {
                if (chave.startsWith(keyParam)) {
                    metadataScalePoints.remove(chave);
                }
            }
            metadataRules.remove(keyParam + ".rule");
            metadataPoints.remove(keyParam + ".points");
        }

        /* se houver parametros na Fase 2, remove repetições na Fase 3 */
        for (Map.Entry<String, String> escala : metadataScaleValues.entrySet()) {
            String keyParam = StringUtils.substringBefore(escala.getKey(), ".scaleValue");
            metadataRules.remove(keyParam + ".rule");
            metadataPoints.remove(keyParam + ".points");
        }

        /* remove declaracoes incompletas da Fase 1 (que tem somente 'countResponses' ou somente 'countResponsesPoints' */
        HashSet<String> keysCountResponses = new HashSet<>(countResponses.keySet());
        for (String chave : keysCountResponses) {
            String keyCountResponsePoints = chave.replace("countResponses", "countResponsesPoints");
            if (countResponsesPoints.get(keyCountResponsePoints) == null) {
                countResponses.remove(chave);
            }
        }

        HashSet<String> keysCountResponsesPoints = new HashSet<>(countResponsesPoints.keySet());
        for (String chave : keysCountResponsesPoints) {
            String keyCountResponse = chave.replace("countResponsesPoints", "countResponses");
            if (countResponses.get(keyCountResponse) == null) {
                countResponsesPoints.remove(chave);
            }
        }

        /* remove declaracoes incompletas da Fase 2 (que tem somente 'scaleValue' ou somente 'scalePoints' */
        HashSet<String> keysMetadataScaleValues = new HashSet<>(metadataScaleValues.keySet());
        for (String chave : keysMetadataScaleValues) {
            String keyScalePoints = chave.replace("scaleValue", "scalePoints");
            if (metadataScalePoints.get(keyScalePoints) == null) {
                metadataScaleValues.remove(chave);
            }
        }

        HashSet<String> keysMetadataScalePoints = new HashSet<>(metadataScalePoints.keySet());
        for (String chave : keysMetadataScalePoints) {
            String keyScaleValue = chave.replace("scalePoints", "scaleValue");
            if (metadataScaleValues.get(keyScaleValue) == null) {
                metadataScalePoints.remove(chave);
            }
        }

        /* remove declaracoes incompletas da Fase 4 (que tem somente 'segundo-termometro.scaleValue' ou
           somente 'segundo-termometro.scalePoints' */
        HashSet<String> keysMetadataSTScaleValues = new HashSet<>(metadataSegundoTermometroScaleValues.keySet());
        for (String chave : keysMetadataSTScaleValues) {
            String keyScalePoints = chave.replace("scaleValue", "scalePoints");
            if (metadataScalePoints.get(keyScalePoints) == null) {
                metadataScaleValues.remove(chave);
            }
        }

        HashSet<String> keysMetadataSTScalePoints = new HashSet<>(metadataSegundoTermometroScalePoints.keySet());
        for (String chave : keysMetadataSTScalePoints) {
            String keyScaleValue = chave.replace("scalePoints", "scaleValue");
            if (metadataScaleValues.get(keyScaleValue) == null) {
                metadataScalePoints.remove(chave);
            }
        }
    }

    /* para cada nome de metadado (metadataLabel) é usado com objeto Item para obter
       o(s) valor(es) correspondente(s). Busca apenas o(s) valor(es) para os
       nomes de metadado declarados no arquivo termometro.cfg ! */
    for (Map.Entry<String, String> metadataLabel : metadataLabels.entrySet()) {
        String[] metadataLabelSplited = metadataLabel.getValue().split("\\.");
        String[] metadataParts = new String[3];
        metadataParts[0] = metadataLabelSplited[0]; // esquema
        metadataParts[1] = metadataLabelSplited[1]; // elemento
        if (metadataLabelSplited.length == 3) {
            metadataParts[2] = metadataLabelSplited[2]; // qualificador (se houver)
        }

        /* obtem um ou mais valores correspondentes ao nome do metadado informado
           nos parametros. só retornará algo se o metadado houver sido preenchido na submissao! */
        List<MetadataValue> metadataValues = ContentServiceFactory.getInstance().getItemService().getMetadata(item,
                metadataParts[0],
                metadataParts[1],
                metadataParts[2],
                Item.ANY);

        /* Armazena em metadataSet os metadados recuperados  */
        /* Obs.: armazena uma entrada vazia quando nao houver retorno de metadado preenchido
           o calculo do maximo (100%) do indicador considera a totalidade dos metadados
           declarados na configuracao (metadataLabels) */
        /* 'id': artífício para garantir armazenamento de metadados duplicados
           sem duplicar a chave do map: formato "esquema.elemento[.qualificador].id" */
        if (metadataValues.size() > 0) {
            for (MetadataValue metadataValue : metadataValues) {
                Integer id = metadataValue.getID();
                metadataSet.put(metadataLabel.getValue() + "." + id, metadataValue.getValue());
            }
        } else {
            metadataSet.put(metadataLabel.getValue() + ".0", "");
        }
    }

    /* FASE 1 nova */
    /* determina a qtde maxima de respostas por metadado do Bloco 1 */
    for (Map.Entry<String, String> numberOfValues : countResponses.entrySet()) {
        String keyMetadataLabel = StringUtils.substringBefore(numberOfValues.getKey(), ".countResponses");
        if (countResponsesLimitMax.getOrDefault(keyMetadataLabel, -1) < Integer.parseInt(numberOfValues.getValue())) {
            countResponsesLimitMax.put(keyMetadataLabel, Integer.parseInt(numberOfValues.getValue()));
        }
    }
    /* determina o maior valor de pontuação por metadado do Bloco 1 */
    for (Map.Entry<String, String> points : countResponsesPoints.entrySet()) {
        String keyMetadataLabel = StringUtils.substringBefore(points.getKey(), ".countResponsesPoints");
        if (countResponsesPointsMax.getOrDefault(keyMetadataLabel, -1) < Integer.parseInt(points.getValue())) {
            countResponsesPointsMax.put(keyMetadataLabel, Integer.parseInt(points.getValue()));
        }
    }
    /* processas as regras do Bloco 1 e armazena a pontuação de cada metadado em metadataEvaluatedPoints */
    for (Map.Entry<String, Integer> qtdeMaxResponses : countResponsesLimitMax.entrySet()) {
        /* se o metadataLabel correspondente à regra nao existir ou está comentado, ignora a avaliacao */
        String metadataLabel = metadataLabels.get(qtdeMaxResponses.getKey());
        if (metadataLabel == null) {
            continue;
        }

        String[] metadataLabelSplited = metadataLabels.get(qtdeMaxResponses.getKey()).split("\\.");
        String[] metadataParts = new String[3];
        metadataParts[0] = metadataLabelSplited[0]; // esquema
        metadataParts[1] = metadataLabelSplited[1]; // elemento
        if (metadataLabelSplited.length == 3) {
            metadataParts[2] = metadataLabelSplited[2]; // qualificador (se houver)
        }

        /* obtem um ou mais valores correspondentes ao nome do metadado informado
           nos parametros. só retornará algo se o metadado houver sido preenchido na submissao! */
        List<MetadataValue> metadataValues = ContentServiceFactory.getInstance().getItemService().getMetadata(item,
                metadataParts[0],
                metadataParts[1],
                metadataParts[2],
                Item.ANY);

        metadataMaxPoints.put("BLOCO 1:" + qtdeMaxResponses.getKey() + "|", countResponsesPointsMax.get(qtdeMaxResponses.getKey()));
        metadataEvaluatedPoints.put("BLOCO 1:" + qtdeMaxResponses.getKey() + "|", 0);

        SortedMap<String, String> subCountResponses = countResponses.subMap(qtdeMaxResponses.getKey(), qtdeMaxResponses.getKey() + ".z");

        if (metadataValues.size() >= qtdeMaxResponses.getValue()) {
            metadataEvaluatedPoints.put("BLOCO 1:" + qtdeMaxResponses.getKey() + "|", countResponsesPointsMax.get(qtdeMaxResponses.getKey()));
        } else {
            for (Map.Entry<String, String> regra : subCountResponses.entrySet()) {
                if (metadataValues.size() == Integer.parseInt(regra.getValue())) {
                    metadataEvaluatedPoints.put("BLOCO 1:" + qtdeMaxResponses.getKey() + "|",
                            Integer.parseInt(countResponsesPoints.get(regra.getKey().replace("countResponses", "countResponsesPoints"))));
                }
            }
        }
    }

    /* FASE 2 nova */
    /* determina o maior valor de pontuação por metadado do Bloco 2 */
    for (Map.Entry<String, String> points : metadataScalePoints.entrySet()) {
        String keyMetadataLabel = StringUtils.substringBefore(points.getKey(), ".scalePoints");
        if (metadataScalePointsMax.getOrDefault(keyMetadataLabel, -1) < Integer.parseInt(points.getValue())) {
            metadataScalePointsMax.put(keyMetadataLabel, Integer.parseInt(points.getValue()));
        }
    }
    /* processas as regras do Bloco 2 e armazena a pontuação de cada metadado em metadataEvaluatedPoints */
    for (Map.Entry<String, Integer> scalePointsMax : metadataScalePointsMax.entrySet()) {
        /* se o metadataLabel correspondente à regra nao existir ou está comentado, ignora a avaliacao */
        String metadataLabel = metadataLabels.get(scalePointsMax.getKey());
        if (metadataLabel == null) {
            continue;
        }

        /* armazena o maior valor da escala para calcular o limite maximo do somatório de pontos
           o limite é igual ao somatório de pontos definidos no termometro.cfg para todos os Blocos */
        metadataMaxPoints.put("BLOCO 2:" + scalePointsMax.getKey() + "|", metadataScalePointsMax.get(scalePointsMax.getKey()));

        SortedMap<String, String> subMetadataSet = metadataSet.subMap(metadataLabel + ".0", metadataLabel + ".z");
        SortedMap<String, String> subMetadataScaleValues = metadataScaleValues.subMap(scalePointsMax.getKey(), scalePointsMax.getKey() + ".z");

        String metadadoID = "";
        boolean evaluated = false;
        for (Map.Entry<String, String> metadado : subMetadataSet.entrySet()) {
            //metadadoID = StringUtils.substringAfterLast(metadado.getKey(), ".");
            metadataEvaluatedPoints.put("BLOCO 2:" + scalePointsMax.getKey() + "|" + metadadoID, 0);

            /* testa os valores normais da escala do bloco 2*/
            for (Map.Entry<String, String> escala : subMetadataScaleValues.entrySet()) {
                if ((metadado.getValue().equalsIgnoreCase(escala.getValue())) &&
                        !(escala.getValue().equals("other") ||
                                escala.getValue().equals("'other'") ||
                                escala.getValue().equals("'*'"))) {
                    String keyScalePoints = escala.getKey().replace("scaleValue", "scalePoints");
                    int pontos = Integer.parseInt(metadataScalePoints.get(keyScalePoints));
                    /* no caso de campos repetidos, armazena apenas o campo que obteve maior pontuação */
                    if (metadataEvaluatedPoints.get("BLOCO 2:" + scalePointsMax.getKey() + "|" + metadadoID) < pontos) {
                        metadataEvaluatedPoints.put("BLOCO 2:" + scalePointsMax.getKey() + "|" + metadadoID, pontos);
                        evaluated = true;
                        //break;
                    }
                }
            }
        }

        /* no caso de não haver valor previsto na escala, e houver opção 'other', atribui pontuação */
        if (!evaluated) {
            for (Map.Entry<String, String> escala : subMetadataScaleValues.entrySet()) {
                if (escala.getValue().equals("other") ||
                        escala.getValue().equals("'other'") ||
                        escala.getValue().equals("'*'")) {
                    String keyScalePoints = escala.getKey().replace("scaleValue", "scalePoints");
                    int pontos = Integer.parseInt(metadataScalePoints.get(keyScalePoints));
                    metadataEvaluatedPoints.put("BLOCO 2:" + scalePointsMax.getKey() + "|" + metadadoID, pontos);
                    break;
                }
            }
        }
    }

    /* FASE 3 nova */
    /* processa as regras do Bloco 3 e armazena os resultados em metadataEvaluatedPoints */
    for (Map.Entry<String, String> rule : metadataRules.entrySet()) {
        /* se o metadataLabel correspondente à regra nao existir ou está comentado, ignora a avaliacao */
        String paramName = StringUtils.substringBefore(rule.getKey(), ".rule");
        String metadataLabel = metadataLabels.get(paramName);
        if (metadataLabel == null) {
            continue;
        }

        SortedMap<String, String> subMetadataSet = metadataSet.subMap(metadataLabel + ".0", metadataLabel + ".z");

        for (Map.Entry<String, String> metadado : subMetadataSet.entrySet()) {

            String metadadoID = StringUtils.substringAfterLast(metadado.getKey(), ".");
            metadataMaxPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
            metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, 0);

            String regra = rule.getValue() + ";";
            String[] rulesSplitted = regra.split(";");
            for (String command : rulesSplitted) {
                if (command.contains("isDateFormat")) {
                    // separa o padrão da data de data do comando
                    String dateFormat = "dd/MM/yyyy"; // usa como padrao se não for informado
                    String[] tmpCommand = command.split("\\.");
                    if (tmpCommand.length == 2) {
                        dateFormat = tmpCommand[1];
                    }
                    try {
                        /* tenta validar a data. */
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
                        LocalDate.parse(metadado.getValue(), formatter);
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    } catch (DateTimeParseException e) {
                    /* continua sem interromper o script. não há necessidade de
                       outra providencia */
                        continue;
                    }
                }

                if (command.equalsIgnoreCase("isCEP")) {
                    // aceita "00000-000" ou "00000000"
                    String padraoCep1 = "^\\d{5}[-]\\d{3}$";
                    String padraoCep2 = "^\\d{8}$";
                    if (metadado.getValue().matches(padraoCep1) ||
                            metadado.getValue().matches(padraoCep2)) {
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    }
                }

                if (command.equalsIgnoreCase("isEmail")) {
                    String padraoEmail = "^([0-9a-zA-Z]+([_.-]?[0-9a-zA-Z]+)*@[0-9a-zA-Z]+[0-9,a-z,A-Z,.,-]*(.){1}[a-zA-Z]{2,4})+$";
                    if (metadado.getValue().matches(padraoEmail)) {
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    }
                }

                if (command.equalsIgnoreCase("isNumeric")) {
                    if (StringUtils.isNumeric(metadado.getValue()) &&
                            !metadado.getValue().isEmpty()) {
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    }
                }

                if (command.equalsIgnoreCase("isURL")) {
                    UrlValidator urlValidator = new UrlValidator();
                    if (urlValidator.isValid(metadado.getValue())) {
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    }
                }

                if (command.contains("hasMinChar")) {
                    //separa o tamanho N do comando hasMinChar.N
                    int lenMinChar = 0;
                    String[] tmpCommand = command.split("\\.");
                    if (tmpCommand.length == 2) {
                        lenMinChar = Integer.parseInt(tmpCommand[1]);
                    }
                    // testa o tamanho minimo
                    if ((metadado.getValue().length() >= lenMinChar) &&
                            (lenMinChar > 0)) {
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    }
                }

                if (command.equalsIgnoreCase("isNotEmpty")) {
                    if (metadado.getValue() != null &&
                            !metadado.getValue().isEmpty()) {
                        metadataEvaluatedPoints.put("BLOCO 3:" + paramName + "|" + metadadoID, Integer.valueOf(metadataPoints.getOrDefault(paramName + ".points", "1")));
                    }
                }
            }
        }
    }

    /* FASE 4 */
    /* processas as regras do Bloco 4 */
    debugBuffer.append("--------- Inicio Fase 4 --------- <br/>");
    for (Map.Entry<String, String> scaleValues : metadataSegundoTermometroScaleValues.entrySet()) {
        /* se o metadataLabel correspondente à regra nao existir ou está comentado, ignora a avaliacao */
        String keyMetadataLabel = StringUtils.substringBefore(scaleValues.getKey(), ".segundo-termometro.scaleValue");
        debugBuffer.append("keyMetadataLabel da regra: " + keyMetadataLabel + " <br/>");
        debugBuffer.append("Regra neste ciclo: " + scaleValues.getKey()  + " = "  + scaleValues.getValue() + "<br/>");
        String metadataLabel = metadataLabels.get(keyMetadataLabel);

        if (metadataLabel == null) {
            debugBuffer.append("Metadado desabilitado ou inexistente no termometro.cfg: " + keyMetadataLabel + " <br/>");
            continue;
        }
        debugBuffer.append("Metadado a ser procurado no item: " + metadataLabel + " <br/>");

        /* recorta somente o metadado a ser avaliado para evitar loops desnecessários */
        SortedMap<String, String> subMetadataSet = metadataSet.subMap(metadataLabel + ".0", metadataLabel + ".z");

        /* percorre as regras até encontrar um 'match' válido entre o valor do metadado e o valor da regra
           quando encontra, ignora a avaliação das demais regras. as regras são verificadas em ordem
           crescente de chave */
        boolean evaluatedRule = false;
        for (Map.Entry<String, String> metadado : subMetadataSet.entrySet()) {
            debugBuffer.append("<strong>Comparando metadado:</strong> '" + metadado.getValue() + "' com '" + scaleValues.getValue() + "' <br/>");
            if (metadado.getValue().equalsIgnoreCase(scaleValues.getValue())) {
                debugBuffer.append("Valor do metadado IGUAL ao da regra<br/>");
                String keyScalePoints = scaleValues.getKey().replace("scaleValue", "scalePoints");
                int pontos = Integer.parseInt(metadataSegundoTermometroScalePoints.get(keyScalePoints));
                debugBuffer.append("<strong>PONTOS ATRIBUIDOS:</strong>" + pontos + " pontos <br/>");
                indicadorSegundoTermometro = String.valueOf(pontos);
                metadataSegundoTermometroEvaluatedPoints.put("BLOCO 4:" + keyMetadataLabel + "|" + metadado.getKey(), pontos);
                evaluatedRule = true;
            } else {
                debugBuffer.append("Valor do metadado DIFERENTE ao da regra<br/>");
            }
        }
        showSegundoTermometro = evaluatedRule;
        debugBuffer.append("------------------------------------------ <br/>");
        if (evaluatedRule) {
            break;
        }
    }
    debugBuffer.append("--------- Fim Fase 4 --------- <br/>");
    debugBuffer.append("Estado showSegundoTermometro: " + showSegundoTermometro + "<br/>");

    /* realiza totalizacoes e o calculo */
    for (Map.Entry<String, Integer> totalEvaluated : metadataEvaluatedPoints.entrySet()) {
        sumValidPoints += totalEvaluated.getValue();
    }

    for (Map.Entry<String, Integer> totalMaximo : metadataMaxPoints.entrySet()) {
        maxPoints += totalMaximo.getValue();
    }

    resultIndicador = (float) sumValidPoints / (float) maxPoints * 100.0f;
    indicadorTermometro = String.valueOf((int) resultIndicador);

    //out.write(debugBuffer.toString());
%>

<%
    /* exibe o display somente se a coleção exibida está no arquivo termometro.cfg */
    if (showDisplay) {
%>

<!--Accordion wrapper-->
<div class="container">
    <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
        <!-- Accordion card -->
        <div class="card">

            <!-- Card header -->
            <div class="card-header" role="tab" id="headingOne1">
                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
                   aria-controls="collapseOne1">
                    <h5 class="mb-0">
                        <p class="text-center"><fmt:message key="termometro.display.header"/><i
                                class="fas fa-angle-down rotate-icon"></i></p>
                    </h5>
                </a>
            </div>

            <!-- Card body -->
            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1"
                 data-parent="#accordionEx">
                <div class="card-body">
                    <p class="text-justify font-weight-bold"><fmt:message key="jsp.statistics.termometro.subtitle"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text1"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text2"/></p>
                </div>
            </div>
        </div>

        <div class="card">

            <!-- Card header -->
            <div class="card-header" role="tab" id="headingTwo2">
                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2"
                   aria-expanded="false" aria-controls="collapseTwo2">
                    <h5 class="mb-0">
                        <p class="text-center"><fmt:message key="termometro.display.description"/><i
                                class="fas fa-angle-down rotate-icon"></i></p>
                    </h5>
                </a>
            </div>

            <!-- Card body -->
            <div id="collapseTwo2" class="collapse" role="tabpanel" aria-labelledby="headingTwo2"
                 data-parent="#accordionEx">
                <div class="card-body">
                    <p class="text-justify font-weight-bold"><fmt:message
                            key="jsp.statistics.termometro.subtitle2"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text3"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text4"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text5"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text6"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text7"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text8"/></p>
                    <p class="text-justify"><fmt:message key="jsp.statistics.termometro.text9"/></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- area de exibição do termometro --%>
<div class="container header-termometro">
    <p><fmt:message key="termometro.display.title"/></p>
</div>
<div class="container" id="div-termometro">
    <canvas height=180 id="canvas-termometro" width=340></canvas>
    <p>
    <div id="preview-textfield"></div>
    </p>
</div>

<%-- javascripts do termometro. Atenção para o local do include src! --%>
<script src="/jspui/gauge.js"></script>
<script type="text/javascript">
    initGauge();
    function initGauge() {
        termometro = new Gauge(document.getElementById("canvas-termometro"));
        var opts = {
            angle: 0,
            lineWidth: 0.2,
            radiusScale: 1,
            pointer: {
                length: 0.4,
                strokeWidth: 0.1,
                color: '#000000'
            },
            staticLabels: {
                font: "14px sans-serif",
                labels: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                fractionDigits: 0
            },
            staticZones: [
                {strokeStyle: "#FFDD00", min: 0, max: 80},
                {strokeStyle: "#30B32D", min: 80, max: 100}
            ],
            pointer: {
                length: 0.45,
                strokeWidth: 0.029,
                color: '#000000'
            },
            renderTicks: {
                divisions: 100,
                divWidth: 0.5,
                divLength: 0.1,
                divColor: '#333333',
                subDivisions: 1,
                subLength: 0.5,
                subWidth: 0.6,
                subColor: '#666666'
            },
            limitMax: true,
            limitMin: false,
            highDpiSupport: true
        };
        termometro.setOptions(opts);
        termometro.minValue = 0;
        termometro.maxValue = 100;
        termometro.animationSpeed = 50;
        termometro.set(<%= indicadorTermometro%>);
        termometro.setTextField(document.getElementById("preview-textfield"));
    }
</script>

<!--[if lt IE 9]>
<script type="text/javascript" src="/jspui/excanvas.compiled.js"></script><![endif]-->
<%
    }

    if(showSegundoTermometro) {
%>
<%-- area de exibição do SEGUNDO TERMOMETRO --%>
<div class="container header-termometro">
    <p><fmt:message key="termometro.display.title2"/></p>
</div>
<div class="container" id="div-termometro2">
    <canvas height=180 id="canvas-termometro2" width=340></canvas>
    <p>
    <div id="preview-textfield2"></div>
    </p>
</div>
<script src="/jspui/gauge.js"></script>
<script type="text/javascript">
    initGauge2()
    function initGauge2() {
        termometro = new Gauge(document.getElementById("canvas-termometro2"));
        var opts = {
            angle: 0,
            lineWidth: 0.2,
            radiusScale: 1,
            pointer: {
                length: 0.4,
                strokeWidth: 0.1,
                color: '#000000'
            },
            staticLabels: {
                font: "14px sans-serif",
                labels: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                fractionDigits: 0
            },
            staticZones: [
                {strokeStyle: "#30B32D", min: 0, max: 80},
                {strokeStyle: "#30B32D", min: 80, max: 100}
            ],
            pointer: {
                length: 0.45,
                strokeWidth: 0.029,
                color: '#000000'
            },
            renderTicks: {
                divisions: 100,
                divWidth: 0.5,
                divLength: 0.1,
                divColor: '#333333',
                subDivisions: 1,
                subLength: 0.5,
                subWidth: 0.6,
                subColor: '#666666'
            },
            limitMax: true,
            limitMin: false,
            highDpiSupport: true
        };
        termometro.setOptions(opts);
        termometro.minValue = 0;
        termometro.maxValue = 100;
        termometro.animationSpeed = 50;
        termometro.set(<%= indicadorSegundoTermometro%>);
        termometro.setTextField(document.getElementById("preview-textfield2"));
    }
</script>

<%
    }

    /* relatorio para depuracao. exibe somente se o parametro estiver ativado e se o
       flag de display for true */
    if (termometroProperties.getOrDefault("termometro.debug", "off").equals("on") && showDisplay) {
        StringBuilder escalaReport = new StringBuilder();
        String labelReport = "";
        String coluna1;
        String coluna2;
        String coluna3;
        String coluna4;
        String coluna5;
        String colunaSpan5;
        String colunaSpan2;
        String rowOpen = "<tr>";
        String rowClose = "</tr>";
        /* cabeçalho para visao de Admin: cinco colunas */
        String rowAdminHeader = "<th class=\"oddRowEvenCol\">" + I18nUtil.getMessage("termometro.debugreport.seq", supportedLocale) + "</th>" +
                "<th class=\"oddRowEvenCol\">" + I18nUtil.getMessage("termometro.debugreport.id", supportedLocale) +
                "<th class=\"oddRowEvenCol\"><b>" + I18nUtil.getMessage("termometro.debugreport.metadata", supportedLocale) + "</b></th>" +
                "<th class=\"oddRowEvenCol\"><b>" + I18nUtil.getMessage("termometro.debugreport.evaluatedpoints", supportedLocale) + "</b></th>" +
                "<th class=\"oddRowEvenCol\">" + I18nUtil.getMessage("termometro.debugreport.maxpoints", supportedLocale) + "</th>";

        /* cabeçalho para visão de usuario normal: duas colunas */
        String rowOtherUserHeader = "<th class=\"oddRowEvenCol\"><b>" + I18nUtil.getMessage("termometro.debugreport.metadata", supportedLocale) + "</b></th>" +
                "<th class=\"oddRowEvenCol\"><b>" + I18nUtil.getMessage("termometro.debugreport.evaluatedpoints", supportedLocale) + "</b></th>";

        String rowFooter = "</table>";
        int i = 0;
        String classe = "oddRowOddCol";
        String metadataLabelBloco1 = "";
        String metadataLabelBloco2 = "";
        String metadataLabelBloco3 = "";
        String userName = "";
        if (ep != null) {
            userName = ep.getFullName();
        } else {
            userName = "Sem usuario";
        }

        // Is the logged in user an admin or community admin or collection admin
        Boolean admin = (Boolean) request.getAttribute("is.admin");
        boolean isAdmin = (admin == null ? false : admin.booleanValue());

        Boolean communityAdmin = (Boolean) request.getAttribute("is.communityAdmin");
        boolean isCommunityAdmin = (communityAdmin == null ? false : communityAdmin.booleanValue());

        Boolean collectionAdmin = (Boolean) request.getAttribute("is.collectionAdmin");
        boolean isCollectionAdmin = (collectionAdmin == null ? false : collectionAdmin.booleanValue());

        /* ser for Admin em qualquer nivel habilita visao de Administrador para o relatorio*/
        boolean adminView = false;
        adminView = isAdmin || isCommunityAdmin || isCollectionAdmin;

%>

<div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

    <div class="card">
        <div class="card-header" role="tab" id="headingOne3">
            <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseThree" aria-expanded="true"
               aria-controls="collapseThree">
                <h5 class="mb-0">
                    <p class="text-center"><fmt:message key="termometro.debugreport.header"/><i
                            class="fas fa-angle-down rotate-icon"></i></p>
                </h5>
            </a>
        </div>

        <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingOne3"
             data-parent="#accordionEx">
            <div class="card-body">
                <%
                        reportBuffer.append("<table class=\"table panel-body\">");
                        if (adminView) {
                            reportBuffer.append(rowAdminHeader);
                        } else {
                            reportBuffer.append(rowOtherUserHeader);
                        }
                        int npoints = 0;
                        String npointsLabel = "";
                        for (Map.Entry<String, Integer> linha : metadataMaxPoints.entrySet()) {
                            if (linha.getKey().startsWith("BLOCO 1:")) {
                                metadataLabelBloco1 = StringUtils.substringBeforeLast(StringUtils.substringAfter(linha.getKey(), "BLOCO 1:"), "|");
                                SortedMap<String, String> subMetadataScaleValues = countResponses.subMap(metadataLabelBloco1, metadataLabelBloco1 + ".z");

                                for (Map.Entry<String, String> escala : subMetadataScaleValues.entrySet()) {
                                    String keyScalePoints = escala.getKey().replace("countResponses", "countResponsesPoints");
                                    npoints = Integer.parseInt(countResponsesPoints.get(keyScalePoints));
                                    if (npoints == 1) {
                                        npointsLabel = I18nUtil.getMessage("termometro.debugreport.npoints-singular", supportedLocale);
                                    } else {
                                        npointsLabel = I18nUtil.getMessage("termometro.debugreport.npoints-plural", supportedLocale);
                                    }
                                    escalaReport.append(I18nUtil.getMessage("termometro.debugreport.qtderesponses", supportedLocale) + ": ").append(escala.getValue()).append(" = ").append(countResponsesPoints.get(keyScalePoints)).append(" " + npointsLabel + "<br/>");
                                }
                                labelReport = I18nUtil.getMessage("termometro.debugreport.responsescale", supportedLocale);
                            }
                            if (linha.getKey().startsWith("BLOCO 2:")) {
                                metadataLabelBloco2 = StringUtils.substringBeforeLast(StringUtils.substringAfter(linha.getKey(), "BLOCO 2:"), "|");
                                SortedMap<String, String> subMetadataScaleValues = metadataScaleValues.subMap(metadataLabelBloco2, metadataLabelBloco2 + ".z");

                                for (Map.Entry<String, String> escala : subMetadataScaleValues.entrySet()) {
                                    String keyScalePoints = escala.getKey().replace("scaleValue", "scalePoints");
                                    npoints = Integer.parseInt(metadataScalePoints.get(keyScalePoints));
                                    if (npoints == 1) {
                                        npointsLabel = I18nUtil.getMessage("termometro.debugreport.npoints-singular", supportedLocale);
                                    } else {
                                        npointsLabel = I18nUtil.getMessage("termometro.debugreport.npoints-plural", supportedLocale);
                                    }
                                    escalaReport.append(escala.getValue()).append(" = ").append(metadataScalePoints.get(keyScalePoints)).append(" " + npointsLabel + "<br/>");
                                }
                                labelReport = I18nUtil.getMessage("termometro.debugreport.responsescale", supportedLocale);
                            }
                            if (linha.getKey().startsWith("BLOCO 3:")) {
                                metadataLabelBloco3 = StringUtils.substringBeforeLast(StringUtils.substringAfter(linha.getKey(), "BLOCO 3:"), "|");
                                reportBuffer.append("metadataLabelBloco3: -" + metadataLabelBloco3 + "-<br/>");
                                SortedMap<String, String> subMetadataScaleValues = metadataRules.subMap(metadataLabelBloco3, metadataLabelBloco3 + ".z");

                                for (Map.Entry<String, String> escala : subMetadataScaleValues.entrySet()) {
                                    String keyScalePoints = escala.getKey().replace("rule", "points");
                                    npoints = Integer.parseInt(metadataPoints.get(keyScalePoints));
                                    if (npoints == 1) {
                                        npointsLabel = I18nUtil.getMessage("termometro.debugreport.npoints-singular", supportedLocale);
                                    } else {
                                        npointsLabel = I18nUtil.getMessage("termometro.debugreport.npoints-plural", supportedLocale);
                                    }
                                    escalaReport.append(escala.getValue()).append(" = ").append(metadataPoints.get(keyScalePoints)).append(" " + npointsLabel + "<br/>");
                                }
                                labelReport = I18nUtil.getMessage("termometro.debugreport.evaluationrule", supportedLocale);
                            }

                            classe = (classe == "oddRowOddCol") ? "oddRowEvenCol" : "oddRowOddCol";
                            i++;
                            String blocoMetadado = StringUtils.substringBeforeLast(linha.getKey(), "|");
                            String paramName = StringUtils.substringAfter(blocoMetadado, ":");

                            if (adminView) {
                                coluna1 = "<td class=\"" + classe + "\">" + String.format("%03d", i) + "</td>";
                                coluna2 = "<td class=\"" + classe + "\">" + blocoMetadado + "</td>";
                                coluna3 = "<td class=\"" + classe + "\"><b>" + I18nUtil.getMessage("metadata." + metadataLabels.get(paramName), supportedLocale) + "</b></td>";
                                coluna4 = "<td class=\"" + classe + "\">" + metadataEvaluatedPoints.get(linha.getKey()) + "</td>";
                                coluna5 = "<td class=\"" + classe + "\">" + linha.getValue() + "</td>";
                                reportBuffer.append(rowOpen + coluna1 + coluna2 + coluna3 + coluna4 + coluna5 + rowClose);
                                colunaSpan5 = "<td class=\"" + classe + "\" colspan=\"5\">" + labelReport + "<br/>" + escalaReport + "</td>";
                                reportBuffer.append(rowOpen + colunaSpan5 + rowClose);
                            } else {
                                coluna3 = "<td class=\"" + classe + "\"><b>" + I18nUtil.getMessage("metadata." + metadataLabels.get(paramName), supportedLocale) + "</b></td>";
                                coluna4 = "<td class=\"" + classe + "\">" + metadataEvaluatedPoints.get(linha.getKey()) + "</td>";
                                reportBuffer.append(rowOpen + coluna3 + coluna4 + rowClose);
                                colunaSpan2 = "<td class=\"" + classe + "\" colspan=\"2\">" + labelReport + "<br/>" + escalaReport + "</td>";
                                reportBuffer.append(rowOpen + colunaSpan2 + rowClose);
                            }
                            escalaReport = new StringBuilder();
                        }

                        if (adminView) {
                            classe = (classe == "oddRowOddCol") ? "oddRowEvenCol" : "oddRowOddCol";
                            coluna1 = "<td class=\"" + classe + "\" colspan=\"3\"><b>Soma dos pontos da revista:</b></td>";
                            coluna4 = "<td class=\"" + classe + "\"><b>" + sumValidPoints + " (" + indicadorTermometro + "%)" + "</b></td>";
                            coluna5 = "<td class=\"" + classe + "\"><b>" + maxPoints + "</b></td>";
                            reportBuffer.append("<tr>" + coluna1 + coluna4 + coluna5 + "</tr>");
                        } else {
                            classe = (classe == "oddRowOddCol") ? "oddRowEvenCol" : "oddRowOddCol";
                            coluna1 = "<td class=\"" + classe + "\"><b>Soma dos pontos da revista:</b></td>";
                            coluna4 = "<td class=\"" + classe + "\"><b>" + sumValidPoints + " (" + indicadorTermometro + "%)" + "</b></td>";
                            reportBuffer.append("<tr>" + coluna1 + coluna4 + "</tr>");
                        }
                        reportBuffer.append(rowFooter);
                    }
                    out.write(reportBuffer.toString());
                %>
            </div>
        </div>
    </div>
</div>
