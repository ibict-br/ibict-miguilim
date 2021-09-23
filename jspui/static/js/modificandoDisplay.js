	
	document.body.onload = ModificandoTabela;

	function ModificandoTabela (){

	/*Excluindo os panels*/

	removentoPanel = document.querySelector('.panel.panel-info');
    removentoPanel.classList.remove("panel");
    removentoPanel.classList.remove("panel-info");

    removentoPanel = document.querySelector('.panel-heading');
    removentoPanel.classList.remove("panel-heading");

    removentoPanel = document.querySelector('.panel-body');
	removentoPanel.classList.remove("panel-body");
	
	let table = document.querySelector('.table.itemDisplayTable');
	table.classList.remove("table");
	table.classList.remove("itemDisplayTable");

	let tbody = document.querySelector("tbody");
	tbody.id="tobdyTeste";

	
	
	div = document.createElement("div");
	div.classList.add("listas");

	let divColMd4 = document.createElement("div");
	divColMd4.classList.add("col-md-4");
	let nav = document.createElement("nav");
	let divItem = document.createElement("div");
	divItem.classList.add("item");
	let input = document.createElement("input");
	input.setAttribute("type", "checkbox");
	input.id= "check1";
	let label = document.createElement("label");
	let textoLabel = document.createTextNode("Menu dos itens");
	label.setAttribute("for" , "check1");
	label.appendChild(textoLabel);
	 
	let ul = document.createElement("ul");
	
	
	
	let li_object1 = document.querySelector('.metadataFieldLabel.dc_description_abstract');
	let li1 = document.createElement("li");
	if(li_object1 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0001");
		let textoModificado = textContent = "Descrição";
		a.textContent = textoModificado;
		li1.appendChild(a);
		ul.appendChild(li1);
	} else {
		li1.remove();
	}

	let li_object2 = document.querySelector('.metadataFieldLabel.dc_title');
	let li2 = document.createElement("li");
	li2.id="li02";
	if(li_object2 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0003");
		let textoModificado = textContent = "Título";
		a.textContent = textoModificado;
		li2.appendChild(a);
		ul.appendChild(li2);
	} else {
		li2.remove();
	}

	let li_object3 = document.querySelector('.metadataFieldLabel.dc_title_abbreviated');
	let li3 = document.createElement("li");
	li3.id="li03";
	if(li_object3 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0005");
		let textoModificado = textContent = "Título abreviado";
		a.textContent = textoModificado;
		li3.appendChild(a);
		ul.appendChild(li3);
	} else {
		li3.remove();
	}

	let li_object4 = document.querySelector('.metadataFieldLabel.dc_title_proper');
	let li4 = document.createElement("li");
	li4.id="li04";
	if(li_object4 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0007");
		let textoModificado = textContent = "Título próprio";
		a.textContent = textoModificado;
		li4.appendChild(a);
		ul.appendChild(li4);
	} else {
		li4.remove();
	}

	let li_object5 = document.querySelector('.metadataFieldLabel.dc_title_other');
	let li5 = document.createElement("li");
	li5.id="li05";
	if(li_object5 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0009");
		let textoModificado = textContent = "Outros Títulos";
		a.textContent = textoModificado;
		li5.appendChild(a);
		ul.appendChild(li5);
	} else {
		li5.remove();
	}
	
	let li_object6 = document.querySelector('.metadataFieldLabel.dc_title_previous');
	let li6 = document.createElement("li");
	li6.id="li06";
	if(li_object6 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0011");
		let textoModificado = textContent = "Título anterior";
		a.textContent = textoModificado;
		li6.appendChild(a);
		ul.appendChild(li6);
	} else {
		li6.remove();
	}

	let li_object7 = document.querySelector('.metadataFieldLabel.dc_title_later');
	let li7 = document.createElement("li");
	li7.id="li07";
	if(li_object7 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0013");
		let textoModificado = textContent = "Título posterior";
		a.textContent = textoModificado;
		li7.appendChild(a);
		ul.appendChild(li7);
	} else {
		li7.remove();
	}

	let li_object8 = document.querySelector('.metadataFieldLabel.dc_identifier_issn');
	let li8 = document.createElement("li");
	if(li_object8 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0015");
		let textoModificado = textContent = "ISSN";
		a.textContent = textoModificado;
		li8.appendChild(a);
		ul.appendChild(li8);
	} else {
		li8.remove();
	}

	let li_object9 = document.querySelector('.metadataFieldLabel.dc_identifier_issnl');
	let li9 = document.createElement("li");
	if(li_object9 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0017");
		let textoModificado = textContent = "ISSN-L";
		a.textContent = textoModificado;
		li9.appendChild(a);
		ul.appendChild(li9);
	} else {
		li9.remove();
	}

	let li_object10 = document.querySelector('.metadataFieldLabel.dc_description_situation');
	let li10 = document.createElement("li");
	if(li_object10 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0019");
		let textoModificado = textContent = "Situação";
		a.textContent = textoModificado;
		li10.appendChild(a);
		ul.appendChild(li10);
	} else {
		li10.remove();
	}

	let li_object11 = document.querySelector('.metadataFieldLabel.dc_date_startyear');
	let li11 = document.createElement("li");
	if(li_object11 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0021");
		let textoModificado = textContent = "Ano de início de publicação";
		a.textContent = textoModificado;
		li11.appendChild(a);
		ul.appendChild(li11);
	} else {
		li11.remove();
	}
	
	let li_object12 = document.querySelector('.metadataFieldLabel.dc_date_endyear');
	let li12 = document.createElement("li");
	if(li_object12 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0023");
		let textoModificado = textContent = "Ano de finalização de publicação";
		a.textContent = textoModificado;
		li12.appendChild(a);
		ul.appendChild(li12);
	} else {
		li12.remove();
	}

	let li_object13 = document.querySelector('.metadataFieldLabel.dc_identifier_url');
	let li13 = document.createElement("li");
	if(li_object13 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0025");
		let textoModificado = textContent = "URL";
		a.textContent = textoModificado;
		li13.appendChild(a);
		ul.appendChild(li13);
	} else {
		li13.remove();
	}

	let li_object14 = document.querySelector('.metadataFieldLabel.dc_identifier_interoperabilityprotocol');
	let li14 = document.createElement("li");
	if(li_object14 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0027");
		let textoModificado = textContent = "Protocolo de interoperabilidade";
		a.textContent = textoModificado;
		li14.appendChild(a);
		ul.appendChild(li14);
	} else {
		li14.remove();
	}

	let li_object15 = document.querySelector('.metadataFieldLabel.dc_identifier_persistentidentifier');
	let li15 = document.createElement("li");
	if(li_object15 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0029");
		let textoModificado = textContent = "Identificador persistente"; 
		a.textContent = textoModificado;
		li15.appendChild(a);
		ul.appendChild(li15);
	} else {
		li15.remove();
	}

	let li_object16 = document.querySelector('.metadataFieldLabel.dc_subject_cnpq');
	let li16 = document.createElement("li");
	if(li_object16 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0031");
		let textoModificado = textContent = "Áreas do conhecimento";
		a.textContent = textoModificado;
		li16.appendChild(a);
		ul.appendChild(li16);
	} else {
		li16.remove();
	}

	let li_object17 = document.querySelector('.metadataFieldLabel.dc_language');
	let li17 = document.createElement("li");
	if(li_object17 != null){
		a = document.createElement("a");
		a.setAttribute('href', "#p0033");
		a.classList.add("scrollSuave");
		let textoModificado = textContent = "Idioma";
		a.textContent = textoModificado;
		li17.appendChild(a);
		ul.appendChild(li17);
	} else {
		li17.remove();
	}

	let li_object18 = document.querySelector('.metadataFieldLabel.dc_publisher_name');
	let li18 = document.createElement("li");
	if(li_object18 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0035");
		let textoModificado = textContent = "Instituição editora";
		a.textContent = textoModificado;
		li18.appendChild(a);
		ul.appendChild(li18);
	} else {
		li18.remove();
	}

	let li_object19 = document.querySelector('.metadataFieldLabel.dc_publisher_subordinate');
	let li19 = document.createElement("li");
	if(li_object19 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0037");
		let textoModificado = textContent = "Organismo subordinado";
		a.textContent = textoModificado;
		li19.appendChild(a);
		ul.appendChild(li19);
	} else {
		li19.remove();
	}

	let li_object20 = document.querySelector('.metadataFieldLabel.dc_identifier_publisher');
	let li20 = document.createElement("li");
	if(li_object20 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0039");
		let textoModificado = textContent = "Identificador da instituição editora";
		a.textContent = textoModificado;
		li20.appendChild(a);
		ul.appendChild(li20);
	} else {
		li20.remove();
	}

	let li_object21 = document.querySelector('.metadataFieldLabel.dc_publisher_legalnature');
	let li21 = document.createElement("li");
	if(li_object21 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0041");
		let textoModificado = textContent = "Natureza jurídica da instituição editora";
		a.textContent = textoModificado;
		li21.appendChild(a);
		ul.appendChild(li21);
	} else {
		li21.remove();
	}

	let li_object22 = document.querySelector('.metadataFieldLabel.dc_contributor_editor');
	let li22 = document.createElement("li");
	if(li_object22 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0043");
		let textoModificado = textContent = "Editor responsável";
		a.textContent = textoModificado;
		li22.appendChild(a);
		ul.appendChild(li22);
	} else {
		li22.remove();
	}

	let li_object23 = document.querySelector('.metadataFieldLabel.dc_identifier_editor');
	let li23 = document.createElement("li");
	if(li_object23 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0045");
		let textoModificado = textContent = "Identificador do editor responsável";
		a.textContent = textoModificado;
		li23.appendChild(a);
		ul.appendChild(li23);
	} else {
		li23.remove();
	}

	let li_object24 = document.querySelector('.metadataFieldLabel.dc_identifier_email');
	let li24 = document.createElement("li");
	if(li_object24 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0047");
		let textoModificado = textContent = "E-mail";
		a.textContent = textoModificado;
		li24.appendChild(a);
		ul.appendChild(li24);
	} else {
		li24.remove();
	}

	let li_object25 = document.querySelector('.metadataFieldLabel.dc_description_cep');
	let li25 = document.createElement("li");
	if(li_object25 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0049");
		let textoModificado = textContent = "Código postal (CEP)";
		a.textContent = textoModificado;
		li25.appendChild(a);
		ul.appendChild(li25);
	} else {
		li25.remove();
	}

	let li_object26 = document.querySelector('.metadataFieldLabel.dc_description_state');
	let li26 = document.createElement("li");
	if(li_object26 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0051");
		let textoModificado = textContent = "Estado (UF)";
		a.textContent = textoModificado;
		li26.appendChild(a);
		ul.appendChild(li26);
	} else {
		li26.remove();
	}

	let li_object27 = document.querySelector('.metadataFieldLabel.dc_description_city');
	let li27 = document.createElement("li");
	if(li_object27 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0053");
		let textoModificado = textContent = "Cidade";
		a.textContent = textoModificado;
		li27.appendChild(a);
		ul.appendChild(li27);
	} else {
		li27.remove();
	}

	let li_object28 = document.querySelector('.metadataFieldLabel.dc_description_neighborhood');
	let li28 = document.createElement("li");
	if(li_object28 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0055");
		let textoModificado = textContent = "Bairro/setor";
		a.textContent = textoModificado;
		li28.appendChild(a);
		ul.appendChild(li28);
	} else {
		li28.remove();
	}

	let li_object29 = document.querySelector('.metadataFieldLabel.dc_description_street');
	let li29 = document.createElement("li");
	if(li_object29 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0057");
		let textoModificado = textContent = "Rua/quadra ou similar";
		a.textContent = textoModificado;
		li29.appendChild(a);
		ul.appendChild(li29);
	} else {
		li29.remove();
	}

	let li_object30 = document.querySelector('.metadataFieldLabel.dc_description_building');
	let li30 = document.createElement("li");
	if(li_object30 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0059");
		let textoModificado = textContent = "Casa/prédio/sala ou similar";
		a.textContent = textoModificado;
		li30.appendChild(a);
		ul.appendChild(li30);
	} else {
		li30.remove();
	}

	let li_object31 = document.querySelector('.metadataFieldLabel.dc_description_phone');
	let li31 = document.createElement("li");
	if(li_object31 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0061");
		let textoModificado = textContent = "Telefone";
		a.textContent = textoModificado;
		li31.appendChild(a);
		ul.appendChild(li31);
	} else {
		li31.remove();
	}

	let li_object32 = document.querySelector('.metadataFieldLabel.dc_description_modalityofpublication');
	let li32 = document.createElement("li");
	if(li_object32 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0063");
		let textoModificado = textContent = "Modalidade de publicação";
		a.textContent = textoModificado;
		li32.appendChild(a);
		ul.appendChild(li32);
	} else {
		li32.remove();
	}

	let li_object33 = document.querySelector('.metadataFieldLabel.dc_description_periodicity');
	let li33 = document.createElement("li");
	if(li_object33 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0065");
		let textoModificado = textContent = "Periodicidade do fascículo";
		a.textContent = textoModificado;
		li33.appendChild(a);
		ul.appendChild(li33);
	} else {
		li33.remove();
	}

	let li_object34 = document.querySelector('.metadataFieldLabel.dc_date_monthofpublication');
	let li34 = document.createElement("li");
	if(li_object34 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0067");
		let textoModificado = textContent = "Mês de publicação do fascículo";
		a.textContent = textoModificado;
		li34.appendChild(a);
		ul.appendChild(li34);
	} else {
		li34.remove();
	}

	let li_object35 = document.querySelector('.metadataFieldLabel.dc_description_editorialboardperiodicity');
	let li35 = document.createElement("li");
	if(li_object35 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0069");
		let textoModificado = textContent = "Periodicidade de publicação do expediente"; 
		a.textContent = textoModificado;
		li35.appendChild(a);
		ul.appendChild(li35);
	} else {
	 	li35.remove();
	}
	
	let li_object36 = document.querySelector('.metadataFieldLabel.dc_date_editorialboardmonthofpublication');
	let li36 = document.createElement("li");
	if(li_object36 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0071");
		let textoModificado = textContent = "Mês de publicação do expediente";
		a.textContent = textoModificado;
		li36.appendChild(a);
		ul.appendChild(li36);
	} else {
	 	li36.remove();
	}

	let li_object37 = document.querySelector('.metadataFieldLabel.dc_description_peerreview');
	let li37 = document.createElement("li");
	if(li_object37 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0073");
		let textoModificado = textContent = "Modalidade de avaliação por pares";
		a.textContent = textoModificado;
		li37.appendChild(a);
		ul.appendChild(li37);
	} else {
		li37.remove();
	}
	
	let li_object38 = document.querySelector('.metadataFieldLabel.dc_description_reviewerspublication');
	let li38 = document.createElement("li");
	if(li_object38 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0075");
		let textoModificado = textContent = "Publicação dos avaliadores";
		a.textContent = textoModificado;
		li38.appendChild(a);
		ul.appendChild(li38);
	} else {
		li38.remove();
	}
	
	let li_object39 = document.querySelector('.metadataFieldLabel.dc_description_reviewerstypeofpublication');
	let li39 = document.createElement("li");
	if(li_object39 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0077");
		let textoModificado = textContent = "Forma de publicação do nome dos avaliadores";
		a.textContent = textoModificado;
		li39.appendChild(a);
		ul.appendChild(li39);
	} else {
		li39.remove();
	}

	let li_object40 = document.querySelector('.metadataFieldLabel.dc_description_reviewersperiodicityofpublication');
	let li40 = document.createElement("li");
	if(li_object40 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0079");
		let textoModificado = textContent = "Periodicidade de publicação dos avaliadores";
		a.textContent = textoModificado;
		li40.appendChild(a);
		ul.appendChild(li40);
	} else {
		li40.remove();
	}


	let li_object41 = document.querySelector('.metadataFieldLabel.dc_description_peerreviewexternality');
	let li41 = document.createElement("li");
	if(li_object41 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0081");
		let textoModificado = textContent = "Externalidade da avaliação por pares";
		a.textContent = textoModificado;
		li41.appendChild(a);
		ul.appendChild(li41);
	} else {
		li41.remove();
	}

	let li_object42 = document.querySelector('.metadataFieldLabel.dc_description_peerreviewdocuments');
	let li42 = document.createElement("li");
	if(li_object42 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0083");
		let textoModificado = textContent = "Documentos avaliados";
		a.textContent = textoModificado;
		li42.appendChild(a);
		ul.appendChild(li42);
	} else {
		li42.remove();
	}

	let li_object43 = document.querySelector('.metadataFieldLabel.dc_contributor_publishingresponsable');
	let li43 = document.createElement("li");
	if(li_object43 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0085");
		let textoModificado = textContent = "Responsável pela decisão de publicação";
		a.textContent = textoModificado;
		li43.appendChild(a);
		ul.appendChild(li43);
	} else {
		li43.remove();
	}

	let li_object44 = document.querySelector('.metadataFieldLabel.dc_rights_preprintsubmission');
	let li44 = document.createElement("li");
	if(li_object44 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0087");
		let textoModificado = textContent = "Permissão de submissão de preprint";
		a.textContent = textoModificado;
		li44.appendChild(a);
		ul.appendChild(li44);
	} else {
		li44.remove();
	}

	let li_object45 = document.querySelector('.metadataFieldLabel.dc_rights_preprint');
	let li45 = document.createElement("li");
	if(li_object45 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0089");
		let textoModificado = textContent = "Permissão de armazenamento e acesso à versão preprint";
		a.textContent = textoModificado;
		li45.appendChild(a);
		ul.appendChild(li45);
	} else {
		li45.remove();
	}

	let li_object46 = document.querySelector('.metadataFieldLabel.dc_rights_authorpostprint');
	let li46 = document.createElement("li");
	if(li_object46 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0091");
		let textoModificado = textContent = "Permissão de armazenamento e acesso à versão pós-print do autor";
		a.textContent = textoModificado;
		li46.appendChild(a);
		ul.appendChild(li46);
	} else {
		li46.remove();
	}


	let li_object47 = document.querySelector('.metadataFieldLabel.dc_rights_journalpostprint');
	let li47 = document.createElement("li");
	if(li_object47 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0093");
		let textoModificado = textContent = "Permissão de armazenamento e acesso à versão pós-prints da revista";
		a.textContent = textoModificado;
		li47.appendChild(a);
		ul.appendChild(li47);
	} else {
		li47.remove();
	}


	let li_object48 = document.querySelector('.metadataFieldLabel.dc_rights_sealcolor');
	let li48 = document.createElement("li");
	if(li_object48 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0095");
		let textoModificado = textContent = "Selo de armazenamento e acesso";
		a.textContent = textoModificado;
		li48.appendChild(a);
		ul.appendChild(li48);
	} else {
		li48.remove();
	}

	let li_object49 = document.querySelector('.metadataFieldLabel.dc_rights_time');
	let li49 = document.createElement("li");
	if(li_object49 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0097");
		let textoModificado = textContent = "Prazo para disponibilização de documentos";
		a.textContent = textoModificado;
		li49.appendChild(a);
		ul.appendChild(li49);
	} else {
		li49.remove();
	}

	let li_object50 = document.querySelector('.metadataFieldLabel.dc_rights_access');
	let li50 = document.createElement("li");
	if(li_object50 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0099");
		let textoModificado = textContent = "Tipo de acesso";
		a.textContent = textoModificado;
		li50.appendChild(a);
		ul.appendChild(li50);
	} else {
		li50.remove();
	}

	let li_object51 = document.querySelector('.metadataFieldLabel.dc_rights_embargedtime');
	let li51 = document.createElement("li");
	if(li_object51 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0101");
		let textoModificado = textContent = "Período de embargo";
		a.textContent = textoModificado;
		li51.appendChild(a);
		ul.appendChild(li51);
	} else {
		li51.remove();
	}

	let li_object52 = document.querySelector('.metadataFieldLabel.dc_rights_creativecommons');
	let li52 = document.createElement("li");
	if(li_object52 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0103");
		let textoModificado = textContent = "Licença Creative Commons";
		a.textContent = textoModificado;
		li52.appendChild(a);
		ul.appendChild(li52);
	} else {
		li52.remove();
	}

	let li_object53 = document.querySelector('.metadataFieldLabel.dc_description_publicationfees');
	let li53 = document.createElement("li");
	if(li_object53 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0105");
		let textoModificado = textContent = "Taxas de publicação";
		a.textContent = textoModificado;
		li53.appendChild(a);
		ul.appendChild(li53);
	} else {
		li53.remove();
	}

	let li_object54 = document.querySelector('.metadataFieldLabel.dc_description_submissionfees');
	let li54 = document.createElement("li");
	if(li_object54 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0107");
		let textoModificado = textContent = "Taxa de submissão de artigos";
		a.textContent = textoModificado;
		li54.appendChild(a);
		ul.appendChild(li54);
	} else {
		li54.remove();
	}

	let li_object55 = document.querySelector('.metadataFieldLabel.dc_description_apc');
	let li55 = document.createElement("li");
	if(li_object55 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0109");
		let textoModificado = textContent = "Taxa de processamento de artigos (APC)";
		a.textContent = textoModificado;
		li55.appendChild(a);
		ul.appendChild(li55);
	} else {
		li55.remove();
	}

	let li_object56 = document.querySelector('.metadataFieldLabel.dc_description_codeofethics');
	let li56 = document.createElement("li");
	if(li_object56 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0111");
		let textoModificado = textContent = "Código de ética";
		a.textContent = textoModificado;
		li56.appendChild(a);
		ul.appendChild(li56);
	} else {
		li56.remove();
	}

	let li_object57 = document.querySelector('.metadataFieldLabel.dc_description_referenceguidelines');
	let li57 = document.createElement("li");
	if(li_object57 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0113");
		let textoModificado = textContent = "Padrão de normalização bibliográfica";
		a.textContent = textoModificado;
		li57.appendChild(a);
		ul.appendChild(li57);
	} else {
		li57.remove();
	}
	
	let li_object58 = document.querySelector('.metadataFieldLabel.dc_description_plagiarismdetection');
	let li58 = document.createElement("li");
	if(li_object58 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0115");
		let textoModificado = textContent = "Plataforma de detecção de plágio";
		a.textContent = textoModificado;
		li58.appendChild(a);
		ul.appendChild(li58);
	} else {
		li58.remove();
	}

	let li_object59 = document.querySelector('.metadataFieldLabel.dc_description_digitalpreservation');
	let li59 = document.createElement("li");
	if(li_object59 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0117");
		let textoModificado = textContent = "Estratégia de preservação digital";
		a.textContent = textoModificado;
		li59.appendChild(a);
		ul.appendChild(li59);
	} else {
		li59.remove();
	}

	let li_object60 = document.querySelector('.metadataFieldLabel.dc_rights_researchdata');
	let li60 = document.createElement("li");
	if(li_object60 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0119");
		let textoModificado = textContent = "Exigência de disponibilização de dados de pesquisa";
		a.textContent = textoModificado;
		li60.appendChild(a);
		ul.appendChild(li60);
	} else {
		li60.remove();
	}

	let li_object61 = document.querySelector('.metadataFieldLabel.dc_description_qualisarea');
	let li61 = document.createElement("li");
	if(li_object61 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0121");
		let textoModificado = textContent = "Área de avaliação Qualis-Periódicos";
		a.textContent = textoModificado;
		li61.appendChild(a);
		ul.appendChild(li61);
	} else {
		li61.remove();
	}

	let li_object62 = document.querySelector('.metadataFieldLabel.dc_description_qualisclassification');
	let li62 = document.createElement("li");
	if(li_object62 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0123");
		let textoModificado = textContent = "Classificação Qualis-Periódicos";
		a.textContent = textoModificado;
		li62.appendChild(a);
		ul.appendChild(li62);
	} else {
		li62.remove();
	}

	let li_object63 = document.querySelector('.metadataFieldLabel.dc_description_socialnetworks');
	let li63 = document.createElement("li");
	if(li_object63 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0125");
		let textoModificado = textContent = "Redes sociais";
		a.textContent = textoModificado;
		li63.appendChild(a);
		ul.appendChild(li63);
	} else {
		li63.remove();
	}

	let li_object64 = document.querySelector('.metadataFieldLabel.dc_relation_informationservices');
	let li64 = document.createElement("li");
	if(li_object64 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0127");
		let textoModificado = textContent = "Serviços de informação";
		a.textContent = textoModificado;
		li64.appendChild(a);
		ul.appendChild(li64);
	} else {
		li64.remove();
	}

	let li_object65 = document.querySelector('.metadataFieldLabel.dc_identifier_journalsportaluri');
	let li65 = document.createElement("li");
	if(li_object65 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0129");
		let textoModificado = textContent = "Portal de periódicos";
		a.textContent = textoModificado;
		li65.appendChild(a);
		ul.appendChild(li65);
	} else {
		li65.remove();
	}

	let li_object66 = document.querySelector('.metadataFieldLabel.dc_relation_oasisbr');
	let li66 = document.createElement("li");
	if(li_object66 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0131");
		let textoModificado = textContent = "Artigos da revista no Portal oasisbr";
		a.textContent = textoModificado;
		li66.appendChild(a);
		ul.appendChild(li66);
	} else {
		li66.remove();
	}

	let li_object67 = document.querySelector('.metadataFieldLabel.dc_contributor_administrator');
	let li67 = document.createElement("li");
	if(li_object67 != null){
		a = document.createElement("a");
		a.classList.add("scrollSuave");
		a.setAttribute('href', "#p0133");
		let textoModificado = textContent = "Administrador responsável";
		a.textContent = textoModificado;
		li67.appendChild(a);
		ul.appendChild(li67);
		//ocultando os seguintes botoes, caso esse metadado apareça na tela
		let ocultarTermometro = document.getElementById("ocultarTermometro");
		ocultarTermometro.remove();
		let ocultarSolicitacao = document.getElementById("ocultarSolicitacao");
		ocultarSolicitacao.remove();
	} else {
		li67.remove();
	}
	
	divItem.appendChild(input);
	divItem.appendChild(label);
	divItem.appendChild(ul);

	nav.appendChild(divItem);

	divColMd4.appendChild(nav);

	div.appendChild(divColMd4);

		
	let divColMd8 = document.createElement("div");
	divColMd8.classList.add("col-md-8");
	let divParagrado = document.createElement("div");
	divParagrado.classList.add("div-paragrafo");
	divColMd8.appendChild(divParagrado);
	div.appendChild(divColMd8);


	let pa_object1 = document.querySelector('.metadataFieldLabel.dc_description_abstract');
	let p1 = document.createElement("p");
	p1.id="p0001";
	if(pa_object1 != null){
		p1.textContent = pa_object1.innerText;
		divParagrado.appendChild(p1);
	} else {
		p1.remove();

	}
	let pa_object2 = document.querySelector('.metadataFieldValue.dc_description_abstract');
	let p2 = document.createElement("p");
	p2.id="p0002";
	if(pa_object2 != null){
		p2.textContent = pa_object2.innerText;
		divParagrado.appendChild(p2);
	} else {
		p2.remove();
	}

	let pa_object3 = document.querySelector('.metadataFieldLabel.dc_title');
	let p3 = document.createElement("p");
	p3.id="p0003";
	if(pa_object3 != null){
		pa_object3.innerHTML;
		p3.appendChild(pa_object3);
		divParagrado.appendChild(p3);
	} else {
		p3.remove();
	}

	let pa_object4 = document.querySelector('.metadataFieldValue.dc_title');
	let p4 = document.createElement("p");
	p4.id="p0004";
	if(pa_object4 != null){
		p4.textContent = pa_object4.innerText;
		divParagrado.appendChild(p4);
	} else {
		p4.remove();
	}

	
	let pa_object5 = document.querySelector('.metadataFieldLabel.dc_title_abbreviated');
	let p5 = document.createElement("p");
	p5.id="p0005";
	if(pa_object5 != null){
		pa_object5.innerHTML;
		p5.appendChild(pa_object5);
		divParagrado.appendChild(p5);
	} else {
		p5.remove();
	}

	let pa_object6 = document.querySelector('.metadataFieldValue.dc_title_abbreviated');
	let p6 = document.createElement("p");
	p6.id="p0006";
	if(pa_object6 != null){
		p6.textContent = pa_object6.innerText;
		divParagrado.appendChild(p6);
	} else {
		p6.remove();
	}

	let pa_object7 = document.querySelector('.metadataFieldLabel.dc_title_proper');
	let p7 = document.createElement("p");
	p7.id="p0007";
	if(pa_object7 != null){
		pa_object7.innerHTML;
		p7.appendChild(pa_object7);
		divParagrado.appendChild(p7);
	} else {
		p7.remove();
	}

	let pa_object8 = document.querySelector('.metadataFieldValue.dc_title_proper');
	let p8 = document.createElement("p");
	p8.id="p0008";
	if(pa_object8 != null){
		p8.textContent = pa_object8.innerText;
		divParagrado.appendChild(p8);
	} else {
		p8.remove();
	}
	
	let pa_object9 = document.querySelector('.metadataFieldLabel.dc_title_other');
	let p9 = document.createElement("p");
	p9.id="p0009";
	if(pa_object9 != null){
		pa_object9.innerHTML;
		p9.appendChild(pa_object9);
		divParagrado.appendChild(p9);
	} else {
		p9.remove();
	}

	let pa_object10 = document.querySelector('.metadataFieldValue.dc_title_other');
	let p10 = document.createElement("p");
	p10.id="p0010";
	if(pa_object10 != null){
		p10.textContent = pa_object10.innerText;
		divParagrado.appendChild(p10);
	} else {
		p10.remove();
	}

	let pa_object11 = document.querySelector('.metadataFieldLabel.dc_title_previous');
	let p11 = document.createElement("p");
	p11.id="p0011";
	if(pa_object11 != null){
		pa_object11.innerHTML;
		p11.appendChild(pa_object11);
		divParagrado.appendChild(p11);
	} else {
		p11.remove();
	}

	let pa_object12 = document.querySelector('.metadataFieldValue.dc_title_previous');
	let p12 = document.createElement("p");
	p12.id="p0012";
	if(pa_object12 != null){
		p12.textContent = pa_object12.innerText;
		divParagrado.appendChild(p12);
	} else {
		p12.remove();
	}

	let pa_object13 = document.querySelector('.metadataFieldLabel.dc_title_later');
	let p13 = document.createElement("p");
	p13.id="p0013";
	if(pa_object13 != null){
		pa_object13.innerHTML;
		p13.appendChild(pa_object13);
		divParagrado.appendChild(p13);
	} else {
		p13.remove();
	}

	let pa_object14 = document.querySelector('.metadataFieldValue.dc_title_later');
	let p14 = document.createElement("p");
	p14.id="p0014";
	if(pa_object14 != null){
		p14.textContent = pa_object14.innerText;
		divParagrado.appendChild(p14);
	} else {
		p14.remove();
	}

	let pa_object15 = document.querySelector('.metadataFieldLabel.dc_identifier_issn');
	let p15 = document.createElement("p");
	p15.id="p0015";
	if(pa_object15 != null){
		p15.textContent = pa_object15.innerText;
		divParagrado.appendChild(p15);
	} else {
		p15.remove();
	}

	let pa_object16 = document.querySelector('.metadataFieldValue.dc_identifier_issn');
	let p16 = document.createElement("p");
	p16.id="p0016";
	if(pa_object16 != null){
		p16.textContent = pa_object16.innerText;
		var issn = pa_object16.innerText;
		divParagrado.appendChild(p16);
	} else {
		p16.remove();
	}

	let pa_object17 = document.querySelector('.metadataFieldLabel.dc_identifier_issnl');
	let p17 = document.createElement("p");
	p17.id="p0017";
	if(pa_object17 != null){
		p17.textContent = pa_object17.innerText;
		divParagrado.appendChild(p17);
	} else {
		p17.remove();
	}

	let pa_object18 = document.querySelector('.metadataFieldValue.dc_identifier_issnl');
	let p18 = document.createElement("p");
	p18.id="p0018";
	if(pa_object18 != null){
		p18.textContent = pa_object18.innerText;
		divParagrado.appendChild(p18);
	} else {
		p18.remove();
	}

	let pa_object19 = document.querySelector('.metadataFieldLabel.dc_description_situation');
	let p19 = document.createElement("p");
	p19.id="p0019";
	if(pa_object19 != null){
		p19.textContent = pa_object19.innerText;
		divParagrado.appendChild(p19);
	} else {
		p19.remove();
	}

	let pa_object20 = document.querySelector('.metadataFieldValue.dc_description_situation');
	let p20 = document.createElement("p");
	p20.id="p0020";
	if(pa_object20 != null){
		p20.textContent = pa_object20.innerText;
		divParagrado.appendChild(p20);
	} else {
		p20.remove();
	}

	let pa_object21 = document.querySelector('.metadataFieldLabel.dc_date_startyear');
	let p21 = document.createElement("p");
	p21.id="p0021";
	if(pa_object21 != null){
		p21.textContent = pa_object21.innerText;
		divParagrado.appendChild(p21);
	} else {
		p21.remove();
	}

	let pa_object22 = document.querySelector('.metadataFieldValue.dc_date_startyear');
	let p22 = document.createElement("p");
	p22.id="p0022";
	if(pa_object22 != null){
		p22.textContent = pa_object22.innerText;
		divParagrado.appendChild(p22);
	} else {
		p22.remove();
	}

	let pa_object23 = document.querySelector('.metadataFieldLabel.dc_date_endyear');
	let p23 = document.createElement("p");
	p23.id="p0023";
	if(pa_object23 != null){
		p23.textContent = pa_object23.innerText;
		divParagrado.appendChild(p23);
	} else {
		p23.remove();
	}

	let pa_object24 = document.querySelector('.metadataFieldValue.dc_date_endyear');
	let p24 = document.createElement("p");
	p24.id="p0024";
	if(pa_object24 != null){
		p24.textContent = pa_object24.innerText;
		divParagrado.appendChild(p24);
	} else {
		p24.remove();
	}

	let pa_object25 = document.querySelector('.metadataFieldLabel.dc_identifier_url');
	let p25 = document.createElement("p");
	p25.id="p0025";
	if(pa_object25 != null){
		p25.textContent = pa_object25.innerText;
		divParagrado.appendChild(p25);
	} else {
		p25.remove();
	}

	let pa_object26 = document.querySelector('.metadataFieldValue.dc_identifier_url');
	let p26 = document.createElement("p");
	p26.id="p0026";
	if(pa_object26 != null){
		let url = pa_object26.innerText;
    	url = url.toString();
    	let arrayUrl = url.split(/\r?\n|\r/);
		arrayUrl.forEach(function (item, indice, array) {
			let a = document.createElement("a");
			a.setAttribute('href', (item));
			a.setAttribute('target','_blank', '%0D');
			a.textContent = item
			p26.appendChild(a);
			divParagrado.appendChild(p26);  
    });
	} else {
		p26.remove();
	}

	let pa_object27 = document.querySelector('.metadataFieldLabel.dc_identifier_interoperabilityprotocol');
	let p27 = document.createElement("p");
	p27.id="p0027";
	if(pa_object27 != null){
		p27.textContent = pa_object27.innerText;
		divParagrado.appendChild(p27);
	} else {
		p27.remove();
	}

	let pa_object28 = document.querySelector('.metadataFieldValue.dc_identifier_interoperabilityprotocol');
	let p28 = document.createElement("p");
	p28.id="p0028";
	if(pa_object28 != null){
		p28.textContent = pa_object28.innerText;
		divParagrado.appendChild(p28);
	} else {
		p28.remove();
	}

	let pa_object29 = document.querySelector('.metadataFieldLabel.dc_identifier_persistentidentifier');
	let p29 = document.createElement("p");
	p29.id="p0029";
	if(pa_object29 != null){
		p29.textContent = pa_object29.innerText;
		divParagrado.appendChild(p29);
	} else {
		p29.remove();
	}

	let pa_object30 = document.querySelector('.metadataFieldValue.dc_identifier_persistentidentifier');
	let p30 = document.createElement("p");
	p30.id="p0030";
	if(pa_object30 != null){
		p30.textContent = pa_object30.innerText;
		divParagrado.appendChild(p30);
	} else {
		p30.remove();
	}

	let pa_object31 = document.querySelector('.metadataFieldLabel.dc_subject_cnpq');
	let p31 = document.createElement("p");
	p31.id="p0031";
	if(pa_object31 != null){
		p31.textContent = pa_object31.innerText;
		divParagrado.appendChild(p31);
	} else {
		p31.remove();
	}

	let pa_object32 = document.querySelector('.metadataFieldValue.dc_subject_cnpq');
	let p32 = document.createElement("p");
	p32.id="p0032";
	if(pa_object32 != null){
		p32.textContent = pa_object32.innerText;
		divParagrado.appendChild(p32);
	} else {
		p32.remove();
	}

	let pa_object33 = document.querySelector('.metadataFieldLabel.dc_language');
	let p33 = document.createElement("p");
	p33.id="p0033";
	if(pa_object33 != null){
		p33.textContent = pa_object33.innerText;
		divParagrado.appendChild(p33);
	} else {
		p33.remove();
	}

	let pa_object34 = document.querySelector('.metadataFieldValue.dc_language');
	let p34 = document.createElement("p");
	p34.id="p0034";
	if(pa_object34 != null){
		p34.textContent = pa_object34.innerText;
		divParagrado.appendChild(p34);
	} else {
		p34.remove();
	}

	let pa_object35 = document.querySelector('.metadataFieldLabel.dc_publisher_name');
	let p35 = document.createElement("p");
	p35.id="p0035";
	if(pa_object35 != null){
		p35.textContent = pa_object35.innerText;
		divParagrado.appendChild(p35);
	} else {
		p35.remove();
	}

	let pa_object36 = document.querySelector('.metadataFieldValue.dc_publisher_name');
	let p36 = document.createElement("p");
	p36.id="p0036";
	if(pa_object36 != null){
		p36.textContent = pa_object36.innerText;
		divParagrado.appendChild(p36);
	} else {
		p36.remove();
	}

	let pa_object37 = document.querySelector('.metadataFieldLabel.dc_publisher_subordinate');
	let p37 = document.createElement("p");
	p37.id="p0037";
	if(pa_object37 != null){
		p37.textContent = pa_object37.innerText;
		divParagrado.appendChild(p37);
	} else {
		p37.remove();
	}

	let pa_object38 = document.querySelector('.metadataFieldValue.dc_publisher_subordinate');
	let p38 = document.createElement("p");
	p38.id="p0038";
	if(pa_object38 != null){
		p38.textContent = pa_object38.innerText;
		divParagrado.appendChild(p38);
	} else {
		p38.remove();
	}

	let pa_object39 = document.querySelector('.metadataFieldLabel.dc_identifier_publisher');
	let p39 = document.createElement("p");
	p39.id="p0039";
	if(pa_object39 != null){
		p39.textContent = pa_object39.innerText;
		divParagrado.appendChild(p39);
	} else {
		p39.remove();
	}

	let pa_object40 = document.querySelector('.metadataFieldValue.dc_identifier_publisher');
	let p40 = document.createElement("p");
	p40.id="p0040";
	if(pa_object40 != null){
		p40.textContent = pa_object40.innerText;
		divParagrado.appendChild(p40);
	} else {
		p40.remove();
	}

	let pa_object41 = document.querySelector('.metadataFieldLabel.dc_publisher_legalnature');
	let p41 = document.createElement("p");
	p41.id="p0041";
	if(pa_object41 != null){
		p41.textContent = pa_object41.innerText;
		divParagrado.appendChild(p41);
	} else {
		p41.remove();
	}

	let pa_object42 = document.querySelector('.metadataFieldValue.dc_publisher_legalnature');
	let p42 = document.createElement("p");
	p42.id="p0042";
	if(pa_object42 != null){
		p42.textContent = pa_object42.innerText;
		divParagrado.appendChild(p42);
	} else {
		p42.remove();
	}

	let pa_object43 = document.querySelector('.metadataFieldLabel.dc_contributor_editor');
	let p43 = document.createElement("p");
	p43.id="p0043";
	if(pa_object43 != null){
		p43.textContent = pa_object43.innerText;
		divParagrado.appendChild(p43);
	} else {
		p43.remove();
	}

	let pa_object44 = document.querySelector('.metadataFieldValue.dc_contributor_editor');
	let p44 = document.createElement("p");
	p44.id="p0044";
	if(pa_object44 != null){
		p44.textContent = pa_object44.innerText;
		divParagrado.appendChild(p44);
	} else {
		p44.remove();
	}

	let pa_object45 = document.querySelector('.metadataFieldLabel.dc_identifier_editor');
	let p45 = document.createElement("p");
	p45.id="p0045";
	if(pa_object45 != null){
		p45.textContent = pa_object45.innerText;
		divParagrado.appendChild(p45);
	} else {
		p45.remove();
	}

	let pa_object46 = document.querySelector('.metadataFieldValue.dc_identifier_editor');
	let p46 = document.createElement("p");
	p46.id="p0046";
	if(pa_object46 != null){
		p46.textContent = pa_object46.innerText;
		divParagrado.appendChild(p46);
	} else {
		p46.remove();
	}

	let pa_object47 = document.querySelector('.metadataFieldLabel.dc_identifier_email');
	let p47 = document.createElement("p");
	p47.id="p0047";
	if(pa_object47 != null){
		p47.textContent = pa_object47.innerText;
		divParagrado.appendChild(p47);
	} else {
		p47.remove();
	}

	let pa_object48 = document.querySelector('.metadataFieldValue.dc_identifier_email');
	let p48 = document.createElement("p");
	p48.id="p0048";
	if(pa_object48 != null){
		p48.textContent = pa_object48.innerText;
		var email = pa_object48.innerText;
		divParagrado.appendChild(p48);
	} else {
		p48.remove();
	}

	let pa_object49 = document.querySelector('.metadataFieldLabel.dc_description_cep');
	let p49 = document.createElement("p");
	p49.id="p0049";
	if(pa_object49 != null){
		p49.textContent = pa_object49.innerText;
		divParagrado.appendChild(p49);
	} else {
		p49.remove();
	}

	let pa_object50 = document.querySelector('.metadataFieldValue.dc_description_cep');
	let p50 = document.createElement("p");
	p50.id="p0050";
	if(pa_object50 != null){
		p50.textContent = pa_object50.innerText;
		divParagrado.appendChild(p50);
	} else {
		p50.remove();
	}

	let pa_object51 = document.querySelector('.metadataFieldLabel.dc_description_state');
	let p51 = document.createElement("p");
	p51.id="p0051";
	if(pa_object51 != null){
		p51.textContent = pa_object51.innerText;
		divParagrado.appendChild(p51);
	} else {
		p51.remove();
	}

	let pa_object52 = document.querySelector('.metadataFieldValue.dc_description_state');
	let p52 = document.createElement("p");
	p52.id="p0052";
	if(pa_object52 != null){
		p52.textContent = pa_object52.innerText;
		divParagrado.appendChild(p52);
	} else {
		p52.remove();
	}

	let pa_object53 = document.querySelector('.metadataFieldLabel.dc_description_city');
	let p53 = document.createElement("p");
	p53.id="p0053";
	if(pa_object53 != null){
		p53.textContent = pa_object53.innerText;
		divParagrado.appendChild(p53);
	} else {
		p53.remove();
	}

	let pa_object54 = document.querySelector('.metadataFieldValue.dc_description_city');
	let p54 = document.createElement("p");
	p54.id="p0054";
	if(pa_object54 != null){
		p54.textContent = pa_object54.innerText;
		divParagrado.appendChild(p54);
	} else {
		p54.remove();
	}

	let pa_object55 = document.querySelector('.metadataFieldLabel.dc_description_neighborhood');
	let p55 = document.createElement("p");
	p55.id="p0055";
	if(pa_object55 != null){
		p55.textContent = pa_object55.innerText;
		divParagrado.appendChild(p55);
	} else {
		p55.remove();
	}

	let pa_object56 = document.querySelector('.metadataFieldValue.dc_description_neighborhood');
	let p56 = document.createElement("p");
	p56.id="p0056";
	if(pa_object56 != null){
		p56.textContent = pa_object56.innerText;
		divParagrado.appendChild(p56);
	} else {
		p56.remove();
	}

	let pa_object57 = document.querySelector('.metadataFieldLabel.dc_description_street');
	let p57 = document.createElement("p");
	p57.id="p0057";
	if(pa_object57 != null){
		p57.textContent = pa_object57.innerText;
		divParagrado.appendChild(p57);
	} else {
		p57.remove();
	}

	let pa_object58 = document.querySelector('.metadataFieldValue.dc_description_street');
	let p58 = document.createElement("p");
	p58.id="p0058";
	if(pa_object58 != null){
		p58.textContent = pa_object58.innerText;
		divParagrado.appendChild(p58);
	} else {
		p58.remove();
	}

	let pa_object59 = document.querySelector('.metadataFieldLabel.dc_description_building');
	let p59 = document.createElement("p");
	p59.id="p0059";
	if(pa_object59 != null){
		p59.textContent = pa_object59.innerText;
		divParagrado.appendChild(p59);
	} else {
		p59.remove();
	}

	let pa_object60 = document.querySelector('.metadataFieldValue.dc_description_building');
	let p60 = document.createElement("p");
	p60.id="p0060";
	if(pa_object60 != null){
		p60.textContent = pa_object60.innerText;
		divParagrado.appendChild(p60);
	} else {
		p60.remove();
	}

	let pa_object61 = document.querySelector('.metadataFieldLabel.dc_description_phone');
	let p61 = document.createElement("p");
	p61.id="p0061";
	if(pa_object61 != null){
		p61.textContent = pa_object61.innerText;
		divParagrado.appendChild(p61);
	} else {
		p61.remove();
	}

	let pa_object62 = document.querySelector('.metadataFieldValue.dc_description_phone');
	let p62 = document.createElement("p");
	p62.id="p0062";
	if(pa_object62 != null){
		p62.textContent = pa_object62.innerText;
		divParagrado.appendChild(p62);
	} else {
		p62.remove();
	}

	let pa_object63 = document.querySelector('.metadataFieldLabel.dc_description_modalityofpublication');
	let p63 = document.createElement("p");
	p63.id="p0063";
	if(pa_object63 != null){
		p63.textContent = pa_object63.innerText;
		divParagrado.appendChild(p63);
	} else {
		p63.remove();
	}

	let pa_object64 = document.querySelector('.metadataFieldValue.dc_description_modalityofpublication');
	let p64 = document.createElement("p");
	p64.id="p0064";
	if(pa_object64 != null){
		p64.textContent = pa_object64.innerText;
		divParagrado.appendChild(p64);
	} else {
		p64.remove();
	}

	let pa_object65 = document.querySelector('.metadataFieldLabel.dc_description_periodicity');
	let p65 = document.createElement("p");
	p65.id="p0065";
	if(pa_object65 != null){
		p65.textContent = pa_object65.innerText;
		divParagrado.appendChild(p65);
	} else {
		p65.remove();
	}

	let pa_object66 = document.querySelector('.metadataFieldValue.dc_description_periodicity');
	let p66 = document.createElement("p");
	p66.id="p0066";
	if(pa_object66 != null){
		p66.textContent = pa_object66.innerText;
		divParagrado.appendChild(p66);
	} else {
		p66.remove();
	}

	let pa_object67 = document.querySelector('.metadataFieldLabel.dc_date_monthofpublication');
	let p67 = document.createElement("p");
	p67.id="p0067";
	if(pa_object67 != null){
		p67.textContent = pa_object67.innerText;
		divParagrado.appendChild(p67);
	} else {
		p67.remove();
	}

	let pa_object68 = document.querySelector('.metadataFieldValue.dc_date_monthofpublication');
	let p68 = document.createElement("p");
	p68.id="p0068";
	if(pa_object68 != null){
		p68.textContent = pa_object68.innerText;
		divParagrado.appendChild(p68);
	} else {
		p68.remove();
	}

	let pa_object69 = document.querySelector('.metadataFieldLabel.dc_description_editorialboardperiodicity');
	let p69 = document.createElement("p");
	p69.id="p0069";
	if(pa_object69 != null){
		p69.textContent = pa_object69.innerText;
		divParagrado.appendChild(p69);
	} else {
		p69.remove();
	}

	let pa_object70 = document.querySelector('.metadataFieldValue.dc_description_editorialboardperiodicity');
	let p70 = document.createElement("p");
	p70.id="p0070";
	if(pa_object70 != null){
		p70.textContent = pa_object70.innerText;
		divParagrado.appendChild(p70);
	} else {
		p70.remove();
	}

	let pa_object71 = document.querySelector('.metadataFieldLabel.dc_date_editorialboardmonthofpublication');
	let p71 = document.createElement("p");
	p71.id="p0071";
	if(pa_object71 != null){
		p71.textContent = pa_object71.innerText;
		divParagrado.appendChild(p71);
	} else {
		p71.remove();
	}

	let pa_object72 = document.querySelector('.metadataFieldValue.dc_date_editorialboardmonthofpublication');
	let p72 = document.createElement("p");
	p72.id="p0072";
	if(pa_object72 != null){
		p72.textContent = pa_object72.innerText;
		divParagrado.appendChild(p72);
	} else {
		p72.remove();
	}

	let pa_object73 = document.querySelector('.metadataFieldLabel.dc_description_peerreview');
	let p73 = document.createElement("p");
	p73.id="p0073";
	if(pa_object73 != null){
		p73.textContent = pa_object73.innerText;
		divParagrado.appendChild(p73);
	} else {
		p73.remove();
	}

	let pa_object74 = document.querySelector('.metadataFieldValue.dc_description_peerreview');
	let p74 = document.createElement("p");
	p74.id="p0074";
	if(pa_object72 != null){
		p74.textContent = pa_object74.innerText;
		divParagrado.appendChild(p74);
	} else {
		p74.remove();
	}

	let pa_object75 = document.querySelector('.metadataFieldLabel.dc_description_reviewerspublication');
	let p75 = document.createElement("p");
	p75.id="p0075";
	if(pa_object75 != null){
		p75.textContent = pa_object75.innerText;
		divParagrado.appendChild(p75);
	} else {
		p75.remove();
	}

	let pa_object76 = document.querySelector('.metadataFieldValue.dc_description_reviewerspublication');
	let p76 = document.createElement("p");
	p76.id="p0076";
	if(pa_object76 != null){
		p76.textContent = pa_object76.innerText;
		divParagrado.appendChild(p76);
	} else {
		p76.remove();
	}

	let pa_object77 = document.querySelector('.metadataFieldLabel.dc_description_reviewerstypeofpublication');
	let p77 = document.createElement("p");
	p77.id="p0077";
	if(pa_object77 != null){
		p77.textContent = pa_object77.innerText;
		divParagrado.appendChild(p77);
	} else {
		p77.remove();
	}

	let pa_object78 = document.querySelector('.metadataFieldValue.dc_description_reviewerstypeofpublication');
	let p78 = document.createElement("p");
	p78.id="p0078";
	if(pa_object78 != null){
		p78.textContent = pa_object78.innerText;
		divParagrado.appendChild(p78);
	} else {
		p78.remove();
	}

	let pa_object79 = document.querySelector('.metadataFieldLabel.dc_description_reviewersperiodicityofpublication');
	let p79 = document.createElement("p");
	p79.id="p0079";
	if(pa_object79 != null){
		p79.textContent = pa_object79.innerText;
		divParagrado.appendChild(p79);
	} else {
		p79.remove();
	}

	let pa_object80 = document.querySelector('.metadataFieldValue.dc_description_reviewersperiodicityofpublication');
	let p80 = document.createElement("p");
	p80.id="p0080";
	if(pa_object80 != null){
		p80.textContent = pa_object80.innerText;
		divParagrado.appendChild(p80);
	} else {
		p80.remove();
	}

	let pa_object81 = document.querySelector('.metadataFieldLabel.dc_description_peerreviewexternality');
	let p81 = document.createElement("p");
	p81.id="p0081";
	if(pa_object81 != null){
		p81.textContent = pa_object81.innerText;
		divParagrado.appendChild(p81);
	} else {
		p81.remove();
	}

	let pa_object82 = document.querySelector('.metadataFieldValue.dc_description_peerreviewexternality');
	let p82 = document.createElement("p");
	p82.id="p0082";
	if(pa_object82 != null){	
		p82.textContent = pa_object82.innerText;
		divParagrado.appendChild(p82);
	} else {
		p82.remove();
	}

	let pa_object83 = document.querySelector('.metadataFieldLabel.dc_description_peerreviewdocuments');
	let p83 = document.createElement("p");
	p83.id="p0083";
	if(pa_object83 != null){
		p83.textContent = pa_object83.innerText;
		divParagrado.appendChild(p83);
	} else {
		p83.remove();
	}

	let pa_object84 = document.querySelector('.metadataFieldValue.dc_description_peerreviewdocuments');
	let p84 = document.createElement("p");
	p84.id="p0084";
	if(pa_object84 != null){
		p84.textContent = pa_object84.innerText;
		divParagrado.appendChild(p84);
	} else {
		p84.remove();
	}

	let pa_object85 = document.querySelector('.metadataFieldLabel.dc_contributor_publishingresponsable');
	let p85 = document.createElement("p");
	p85.id="p0085";
	if(pa_object85 != null){
		p85.textContent = pa_object85.innerText;
		divParagrado.appendChild(p85);
	} else {
		p85.remove();
	}

	let pa_object86 = document.querySelector('.metadataFieldValue.dc_contributor_publishingresponsable');
	let p86 = document.createElement("p");
	p86.id="p0086";
	if(pa_object86 != null){
		p86.textContent = pa_object86.innerText;
		divParagrado.appendChild(p86);
	} else {
		p86.remove();
	}

	let pa_object87 = document.querySelector('.metadataFieldLabel.dc_rights_preprintsubmission');
	let p87 = document.createElement("p");
	p87.id="p0087";
	if(pa_object87 != null){
		p87.textContent = pa_object87.innerText;
		divParagrado.appendChild(p87);
	} else {
		p87.remove();
	}

	let pa_object88 = document.querySelector('.metadataFieldValue.dc_rights_preprintsubmission');
	let p88 = document.createElement("p");
	p88.id="p0088";
	if(pa_object88 != null){
		p88.textContent = pa_object88.innerText;
		divParagrado.appendChild(p88);
	} else {
		p88.remove();
	}

	let pa_object89 = document.querySelector('.metadataFieldLabel.dc_rights_preprint');
	let p89 = document.createElement("p");
	p89.id="p0089";
	if(pa_object89 != null){
		p89.textContent = pa_object89.innerText;
		divParagrado.appendChild(p89);
	} else {
		p89.remove();
	}

	let pa_object90 = document.querySelector('.metadataFieldValue.dc_rights_preprint');
	let p90 = document.createElement("p");
	p90.id="p0090";
	if(pa_object90 != null){
		p90.textContent = pa_object90.innerText;
		divParagrado.appendChild(p90);
	} else {
		p90.remove();
	}

	let pa_object91 = document.querySelector('.metadataFieldLabel.dc_rights_authorpostprint');
	let p91 = document.createElement("p");
	p91.id="p0091";
	if(pa_object91 != null){
		p91.textContent = pa_object91.innerText;
		divParagrado.appendChild(p91);
	} else {
		p91.remove();
	}

	let pa_object92 = document.querySelector('.metadataFieldValue.dc_rights_authorpostprint');
	let p92 = document.createElement("p");
	p92.id="p0092";
	if(pa_object92 != null){
		p92.textContent = pa_object92.innerText;
		divParagrado.appendChild(p92);
	} else {
		p92.remove();
	}


	let pa_object93 = document.querySelector('.metadataFieldLabel.dc_rights_journalpostprint');
	let p93 = document.createElement("p");
	p93.id="p0093";
	if(pa_object93 != null){
		p93.textContent = pa_object93.innerText;
		divParagrado.appendChild(p93);
	} else {
		p93.remove();
	}


	let pa_object94 = document.querySelector('.metadataFieldValue.dc_rights_journalpostprint');
	let p94 = document.createElement("p");
	p94.id="p0094";
	if(pa_object94 != null){
		p94.textContent = pa_object94.innerText;
		divParagrado.appendChild(p94);
	} else {
		p94.remove();
	}

	let pa_object95 = document.querySelector('.metadataFieldLabel.dc_rights_sealcolor');
	let p95 = document.createElement("p");
	p95.id="p0095";
	if(pa_object95 != null){
		p95.textContent = pa_object95.innerText;
		divParagrado.appendChild(p95);
	} else {
		p95.remove();
	}

	let pa_object96 = document.querySelector('.metadataFieldValue.dc_rights_sealcolor');
	let p96 = document.createElement("p");
	p96.id="p0096";
	if(pa_object96 != null){
		p96.textContent = pa_object96.innerText;
		divParagrado.appendChild(p96);
	} else {
		p96.remove();
	}

	let pa_object97 = document.querySelector('.metadataFieldLabel.dc_rights_time');
	let p97 = document.createElement("p");
	p97.id="p0097";
	if(pa_object97 != null){
		p97.textContent = pa_object97.innerText;
		divParagrado.appendChild(p97);
	} else {
		p97.remove();
	}
	

	let pa_object98 = document.querySelector('.metadataFieldValue.dc_rights_time');
	let p98 = document.createElement("p");
	p98.id="p0098";
	if(pa_object98 != null){
		p98.textContent = pa_object98.innerText;
		divParagrado.appendChild(p98);
	} else {
		p98.remove();
	}

	let pa_object99 = document.querySelector('.metadataFieldLabel.dc_rights_access');
	let p99 = document.createElement("p");
	p99.id="p0099";
	if(pa_object99 != null){
		p99.textContent = pa_object99.innerText;
		divParagrado.appendChild(p99);
	} else {
		p99.remove();
	}

	let pa_object100 = document.querySelector('.metadataFieldValue.dc_rights_access');
	let p100 = document.createElement("p");
	p100.id="p0100";
	if(pa_object100 != null){
		p100.textContent = pa_object100.innerText;
		divParagrado.appendChild(p100);
	} else {
		p100.remove();
	}

	let pa_object101 = document.querySelector('.metadataFieldLabel.dc_rights_embargedtime');
	let p101 = document.createElement("p");
	p101.id="p0101";
	if(pa_object101 != null){
		p101.textContent = pa_object101.innerText;
		divParagrado.appendChild(p101);
	} else {
		p101.remove();
	}

	let pa_object102 = document.querySelector('.metadataFieldValue.dc_rights_embargedtime');
	let p102 = document.createElement("p");
	p102.id="p0102";
	if(pa_object102 != null){
		p102.textContent = pa_object102.innerText;
		divParagrado.appendChild(p102);
	} else {
		p102.remove();
	}

	let pa_object103 = document.querySelector('.metadataFieldLabel.dc_rights_creativecommons');
	let p103 = document.createElement("p");
	p103.id="p0103";
	if(pa_object103 != null){
		p103.textContent = pa_object103.innerText;
		divParagrado.appendChild(p103);
	} else {
		p103.remove();
	}

	let pa_object104 = document.querySelector('.metadataFieldValue.dc_rights_creativecommons');
	let p104 = document.createElement("p");
	p104.id="p0104";
	if(pa_object104 != null){
		p104.textContent = pa_object104.innerText;
		divParagrado.appendChild(p104);
	} else {
		p104.remove();
	}

	let pa_object105 = document.querySelector('.metadataFieldLabel.dc_description_publicationfees');
	let p105 = document.createElement("p");
	p105.id="p0105";
	if(pa_object105 != null){
		p105.textContent = pa_object105.innerText;
		divParagrado.appendChild(p105);
	} else {
		p105.remove();
	}

	let pa_object106 = document.querySelector('.metadataFieldValue.dc_description_publicationfees');
	let p106 = document.createElement("p");
	p106.id="p0106";
	if(pa_object106 != null){
		p106.textContent = pa_object106.innerText;
		divParagrado.appendChild(p106);
	} else {
		p106.remove();
	}


	let pa_object107 = document.querySelector('.metadataFieldLabel.dc_description_submissionfees');
	let p107 = document.createElement("p");
	p107.id="p0107";
	if(pa_object107 != null){
		p107.textContent = pa_object107.innerText;
		divParagrado.appendChild(p107);
	} else {
		p107.remove();
	}

	let pa_object108 = document.querySelector('.metadataFieldValue.dc_description_submissionfees');
	let p108 = document.createElement("p");
	p108.id="p0108";
	if(pa_object108 != null){
		p108.textContent = pa_object108.innerText;
		divParagrado.appendChild(p108);
	} else {
		p108.remove();
	}


	let pa_object109 = document.querySelector('.metadataFieldLabel.dc_description_apc');
	let p109 = document.createElement("p");
	p109.id="p0109";
	if(pa_object109 != null){
		p109.textContent = pa_object109.innerText;
		divParagrado.appendChild(p109);
	} else {
		p109.remove();
	}


	let pa_object110 = document.querySelector('.metadataFieldValue.dc_description_apc');
	let p110 = document.createElement("p");
	p110.id="p0110";
	if(pa_object110 != null){
		p110.textContent = pa_object110.innerText;
		divParagrado.appendChild(p110);
	} else {
		p110.remove();
	}

	let pa_object111 = document.querySelector('.metadataFieldLabel.dc_description_codeofethics');
	let p111 = document.createElement("p");
	p111.id="p0111";
	if(pa_object111 != null){
		p111.textContent = pa_object111.innerText;
		divParagrado.appendChild(p111);
	} else {
		p111.remove();
	}

	let pa_object112 = document.querySelector('.metadataFieldValue.dc_description_codeofethics');
	let p112 = document.createElement("p");
	p112.id="p0112";
	if(pa_object112 != null){
		p112.textContent = pa_object112.innerText;
		divParagrado.appendChild(p112);
	} else {
		p112.remove();
	}


	let pa_object113 = document.querySelector('.metadataFieldLabel.dc_description_referenceguidelines');
	let p113 = document.createElement("p");
	p113.id="p0113";
	if(pa_object113 != null){
		p113.textContent = pa_object113.innerText;
		divParagrado.appendChild(p113);
	} else {
		p113.remove();
	}

	let pa_object114 = document.querySelector('.metadataFieldValue.dc_description_referenceguidelines');
	let p114 = document.createElement("p");
	p114.id="p0114";
	if(pa_object114 != null){
		p114.textContent = pa_object114.innerText;
		divParagrado.appendChild(p114);
	} else {
		p114.remove();
	}

	let pa_object115 = document.querySelector('.metadataFieldLabel.dc_description_plagiarismdetection');
	let p115 = document.createElement("p");
	p115.id="p0115";
	if(pa_object115 != null){
		p115.textContent = pa_object115.innerText;
		divParagrado.appendChild(p115);
	} else {
		p115.remove();
	}

	let pa_object116 = document.querySelector('.metadataFieldValue.dc_description_plagiarismdetection');
	let p116 = document.createElement("p");
	p116.id="p0116";
	if(pa_object116 != null){
		p116.textContent = pa_object116.innerText;
		divParagrado.appendChild(p116);
	} else {
		p116.remove();
	}

	let pa_object117 = document.querySelector('.metadataFieldLabel.dc_description_digitalpreservation');
	let p117 = document.createElement("p");
	p117.id="p0117";
	if(pa_object117 != null){
		p117.textContent = pa_object117.innerText;
		divParagrado.appendChild(p117);
	} else {
		p117.remove();
	}


	let pa_object118 = document.querySelector('.metadataFieldValue.dc_description_digitalpreservation');
	let p118 = document.createElement("p");
	p118.id="p0118";
	if(pa_object118 != null){
		p118.textContent = pa_object118.innerText;
		divParagrado.appendChild(p118);
	} else {
		p118.remove();
	}

	let pa_object119 = document.querySelector('.metadataFieldLabel.dc_rights_researchdata');
	let p119 = document.createElement("p");
	p119.id="p0119";
	if(pa_object119 != null){
		p119.textContent = pa_object119.innerText;
		divParagrado.appendChild(p119);
	} else {
		p119.remove();
	}

	let pa_object120 = document.querySelector('.metadataFieldValue.dc_rights_researchdata');
	let p120 = document.createElement("p");
	p120.id="p0120";
	if(pa_object120 != null){
		p120.textContent = pa_object120.innerText;
		divParagrado.appendChild(p120);
	} else {
		p120.remove();
	}

	let pa_object121 = document.querySelector('.metadataFieldLabel.dc_description_qualisarea');
	let p121 = document.createElement("p");
	p121.id="p0121";
	if(pa_object121 != null){
		p121.textContent = pa_object121.innerText;
		divParagrado.appendChild(p121);
	} else {
		p121.remove();
	}

	let pa_object122 = document.querySelector('.metadataFieldValue.dc_description_qualisarea');
	let p122 = document.createElement("p");
	p122.id="p0122";
	if(pa_object122 != null){
		p122.textContent = pa_object122.innerText;
		divParagrado.appendChild(p122);
	} else {
		p122.remove();
	}

	let pa_object123 = document.querySelector('.metadataFieldLabel.dc_description_qualisclassification');
	let p123 = document.createElement("p");
	p123.id="p0123";
	if(pa_object123 != null){
		p123.textContent = pa_object123.innerText;
		divParagrado.appendChild(p123);
	} else {
		p123.remove();
	}

	let pa_object124 = document.querySelector('.metadataFieldValue.dc_description_qualisclassification');
	let p124 = document.createElement("p");
	p124.id="p0124";
	if(pa_object124 != null){
		p124.textContent = pa_object124.innerText;
		divParagrado.appendChild(p124);
	} else {
		p124.remove();
	}

	let pa_object125 = document.querySelector('.metadataFieldLabel.dc_description_socialnetworks');
	let p125 = document.createElement("p");
	p125.id="p0125";
	if(pa_object125 != null){
		p125.textContent = pa_object125.innerText;
		divParagrado.appendChild(p125);
	} else {
		p125.remove();
	}

	let pa_object126 = document.querySelector('.metadataFieldValue.dc_description_socialnetworks');
	let p126 = document.createElement("p");
	p126.id="p0126";
	if(pa_object126 != null){
		p126.textContent = pa_object126.innerText;
		divParagrado.appendChild(p126);
	} else {
		p126.remove();
	}

	let pa_object127 = document.querySelector('.metadataFieldLabel.dc_relation_informationservices');
	let p127 = document.createElement("p");
	p127.id="p0127";
	if(pa_object127 != null){
		p127.textContent = pa_object127.innerText;
		divParagrado.appendChild(p127);
	} else {
		p127.remove();
	}

	let pa_object128 = document.querySelector('.metadataFieldValue.dc_relation_informationservices');
	let p128 = document.createElement("p");
	p128.id="p0128";
	if(pa_object128 != null){
		p128.textContent = pa_object128.innerText;
		divParagrado.appendChild(p128);
	} else {
		p128.remove();
	}

	let pa_object129 = document.querySelector('.metadataFieldLabel.dc_identifier_journalsportaluri');
	let p129 = document.createElement("p");
	p129.id="p0129";
	if(pa_object129 != null){
		p129.textContent = pa_object129.innerText;
		divParagrado.appendChild(p129);
	} else {
		p129.remove();
	}

	let pa_object130 = document.querySelector('.metadataFieldValue.dc_identifier_journalsportaluri');
	let p130 = document.createElement("p");
	p130.id="p0130";
	if(pa_object130 != null){
		p130.textContent = pa_object130.innerText;
		divParagrado.appendChild(p130);
	} else {
		p130.remove();
	}

	let pa_object131 = document.querySelector('.metadataFieldLabel.dc_relation_oasisbr');
	let p131 = document.createElement("p");
	p131.id="p0131";
	if(pa_object131 != null){
		p131.textContent = pa_object131.innerText;
		divParagrado.appendChild(p131);
	} else {
		p131.remove();
	}

	let pa_object132 = document.querySelector('.metadataFieldValue.dc_relation_oasisbr');
	let p132 = document.createElement("p");
	p132.id="p0132";
	if(pa_object132 != null){
		a = document.createElement("a");
		a.setAttribute('href', (pa_object132.innerText));
		a.setAttribute('target','_blank');
		a.textContent = pa_object132.innerText;
		p132.appendChild(a);
		divParagrado.appendChild(p132);
	} else {
		p132.remove();
	}

	let pa_object133 = document.querySelector('.metadataFieldLabel.dc_contributor_administrator');
	let p133 = document.createElement("p");
	p133.id="p0133";
	if(pa_object133 != null){
		p133.textContent = pa_object133.innerText;
		divParagrado.appendChild(p133);
	} else {
		p133.remove();
	}

	let pa_object134 = document.querySelector('.metadataFieldValue.dc_contributor_administrator');
	let p134 = document.createElement("p");
	p134.id="p0134";
	if(pa_object134 != null){
		p134.textContent = pa_object134.innerText;
		divParagrado.appendChild(p134);
	} else {
		p134.remove();
	}

	document.getElementById("lista-customizada").appendChild(div);

	var link = 'http://200.130.0.112:8081/formulario-metadados/login?email='+email+'&issn='+ issn;  

	let linkEmailIssn = document.getElementById("parametroEmailIssn");
	linkEmailIssn.setAttribute('href', link);
	linkEmailIssn.setAttribute('target','_blank', link);
	
	let elementos = document.getElementById("tobdyTeste");	
	elementos.remove();

	/*Scroll suave*/
	$(document).ready(function(){
		let $doc = $('html, body');
		$('.scrollSuave').click(function() {
			$doc.animate({
				scrollTop: $( $.attr(this, 'href') ).offset().top
			}, 1500);
			return false;
		});
	});
}

	
	


    


  

