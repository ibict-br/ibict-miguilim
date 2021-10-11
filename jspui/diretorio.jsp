<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@page import="org.dspace.core.factory.CoreServiceFactory"%>
<%@page import="org.dspace.core.service.NewsService"%>
<%@page import="org.dspace.content.service.CommunityService"%>
<%@page import="org.dspace.content.factory.ContentServiceFactory"%>
<%@page import="org.dspace.content.service.ItemService"%>
<%@page import="org.dspace.core.Utils"%>
<%@page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Item" %>
<%@ page import="org.dspace.services.ConfigurationService" %>
<%@ page import="org.dspace.services.factory.DSpaceServicesFactory" %>

<%
    List<Community> communities = (List<Community>) request.getAttribute("communities");

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
	
    NewsService newsService = CoreServiceFactory.getInstance().getNewsService();
 /* String topNews = newsService.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-top.html")); */
 /* String sideNews = newsService.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html")); */

    ConfigurationService configurationService = DSpaceServicesFactory.getInstance().getConfigurationService();
    
    boolean feedEnabled = configurationService.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled)
    {
        // FeedData is expected to be a comma separated list
        String[] formats = configurationService.getArrayProperty("webui.feed.formats");
        String allFormats = StringUtils.join(formats, ",");
        feedData = "ALL:" + allFormats;
    }
    
    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
    ItemService itemService = ContentServiceFactory.getInstance().getItemService();
    CommunityService communityService = ContentServiceFactory.getInstance().getCommunityService();
%>

<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">

<div>
	<h1><p><strong><font color='#af0714'>Miguilim</font></strong></p></h1>
	
	<p align='center'><h2><strong><font color='RoyalBlue '></font></strong></h2></p>
	
		<p align='justify'><br>
        O Diretório das revistas científicas eletrônicas brasileiras - Miguilim é uma iniciativa do <a href="http://www.ibict.br/">Instituto Brasileiro de Informação em Ciência e Tecnologia (IBICT)</a> pensada com o intuito de agregar informações essenciais das revistas científicas editadas e 
		publicadas no Brasil que se encontravam dispersas em diferentes motores de busca. 
		</p>
		
		<p align='justify'>
		O Miguilim foi desenvolvido com o software Dspace e conta com uma robusta ferramenta de busca avançada, possibilitando aos usuários a recuperação das revistas de modo completamente personalizado, uma vez que é possível recuperá-las por título, número 
		de ISSN, tipo de acesso permitido, área do conhecimento em que publica, instituição editora, periodicidade, cobrança ou não de taxas de publicação etc., melhorando de forma significativa a experiência do usuário em relação a busca e recuperação da 
		informação.
		</p>
		
		<h2><p><strong><font color='#af0714'>Como participar?</font></strong></p></h2>
		
		<p align='justify'>
		Para registrar uma revista, o editor responsável deve acessar a página principal do Diretório, clicar no menu “Meu espaço” e fazer seu cadastro pessoal. Confirmado o cadastro, o editor deverá voltar ao “Meu espaço” e ir até “Iniciar um novo depósito”, 
		onde será apresentado o formulário de cadastro. Após o preenchimento dos dados, o cadastro ficará pendente de aceite por parte da equipe do Diretório, cabendo a ela a verificação dos dados e posterior aprovação. 
		</p>
		
		<h2><p><strong><font color='#af0714'>Critérios básicos para registro</font></strong></p></h2>
		
		<p align='justify'>
		Para que uma revista possa ser cadastrada no Miguilim, deverá cumprir os seguintes requisitos mínimos: 
		</p>
</div>
</dspace:layout>

