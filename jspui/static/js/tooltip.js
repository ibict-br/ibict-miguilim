
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    
    let arrayclassTds = ['.metadataFieldLabel.dc_title', '.metadataFieldLabel.dc_title_abbreviated', 
    '.metadataFieldLabel.dc_title_proper', '.metadataFieldLabel.dc_title_other', 
    '.metadataFieldLabel.dc_title_previous', '.metadataFieldLabel.dc_title_later'];

    incluirHtml(arrayclassTds);
    
});

function incluirHtml(nomeClasseTd){
    nomeClasseTd.forEach(element => {
        if($(element) !== null){
            let textoClasseTd = $(element).text();
            $(element).html(textoClasseTd + '<i data-toggle="tooltip" title="Em caso de revista científica este campo é preenchido conforme o registro na Rede ISSN. Em caso de Portal de periódicos esta regra não se aplica." class="fa fa-question-circle" aria-hidden="true"></i>');
        }
    });
    
    
}


  

