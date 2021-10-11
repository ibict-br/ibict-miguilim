<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - fragment JSP to be included in site, community or collection home to show discovery facets
  -
  - Attributes required:
  -    discovery.fresults    - the facets result to show
  -    discovery.facetsConf  - the facets configuration
  -    discovery.searchScope - the search scope 
  --%>

<%@page import="org.dspace.discovery.configuration.DiscoverySearchFilterFacet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.dspace.discovery.DiscoverResult.FacetResult"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>


<%
	boolean brefineCarousel = false;
	
	Map<String, List<FacetResult>> mapFacetesCarousel = (Map<String, List<FacetResult>>) request.getAttribute("discovery.fresults");
	List<DiscoverySearchFilterFacet> facetsConfCarousel = (List<DiscoverySearchFilterFacet>) request.getAttribute("facetsConfig");
	String searchScopeCarousel = (String) request.getAttribute("discovery.searchScopeCarousel");
	if (searchScopeCarousel == null)
	{
	   searchScopeCarousel = "";
	}
	String indexFieldName = "";
	if (mapFacetesCarousel != null){
	    for (DiscoverySearchFilterFacet facetConf : facetsConfCarousel){
		    indexFieldName = facetConf.getIndexFieldName();
		    List<FacetResult> facet = mapFacetesCarousel.get(indexFieldName);
		    if (facet != null && facet.size() > 0)
		    {
		        brefineCarousel = true;
		        break;
		    }else{
		        facet = mapFacetesCarousel.get(indexFieldName+".year");
			    if (facet != null && facet.size() > 0)
			    {
			        brefineCarousel = true;
			        break;
			    }
		    }
		}
	}

	if (brefineCarousel) {
		List<FacetResult> facet = mapFacetesCarousel.get("title");
		if (facet == null){
			facet = mapFacetesCarousel.get("title"+".year");
		}
		if (facet == null){
			continue;
		}
		String fkey = "jsp.search.facet.refine."+"title";
		if (facet != null){
%>
			<div class="carousel">
				<h2 class="titulos-em-vermelho mb-4">Submissões recentes</h2>
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<i data-target="#carouselExampleIndicators" data-slide-to="0" class="fas fa-circle active"></i></li>
						<i data-target="#carouselExampleIndicators" data-slide-to="1" class="fas fa-circle"></i></li>
						<i  data-target="#carouselExampleIndicators" data-slide-to="2" class="fas fa-circle"></i></li>
					</ol>
					<div class="carousel-inner mb-4">
						<%
						int cont = 0;
						for (FacetResult fvalue : facet){
							if(fvalue.getDisplayedValue() != null){
								if(cont == 0){ 
									%><div class="carousel-item active"><%
								} else {
									%><div class="carousel-item"><%
								}
								cont++;
						%>
								<div class="titulos-em-laranja col-lg-8" align= "center">
									<h2>
										<a href="<%= request.getContextPath()
										+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
										+ "&amp;filtername="+URLEncoder.encode(indexFieldName,"UTF-8")
										+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
										title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<p><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
										</a>
									</h2>
								</div>
							</div>
						<%
							}
						}
						%>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						<i class="fas fa-chevron-left"></i>
						<span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						<i class="fas fa-chevron-right"></i>
						<span class="sr-only">Next</span>
					</a>
				</div> 
			</div>
<%
		}
	}
%>
											
	
<script type="text/javascript" src="<%= request.getContextPath() %>/static/js/clickable-facet.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/static/diretorio-revistas-layout/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
