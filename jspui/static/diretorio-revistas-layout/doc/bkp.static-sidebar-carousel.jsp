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
	
	if (mapFacetesCarousel != null)
	{
	    for (DiscoverySearchFilterFacet facetConf : facetsConfCarousel)
		{
		    String f = facetConf.getIndexFieldName();
		    List<FacetResult> facet = mapFacetesCarousel.get(f);
		    if (facet != null && facet.size() > 0)
		    {
		         brefineCarousel = true;
		        break;
		    }
		    else
		    {
		        facet = mapFacetesCarousel.get(f+".year");
			    if (facet != null && facet.size() > 0)
			    {
			        brefineCarousel = true;
			        break;
			    }
		    }
		}
	}
	if (brefineCarousel) {
%>
				<div class="carousel">
					<h2 class="titulos-em-vermelho mb-4">Submissoes recentes</h2>
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<i data-target="#carouselExampleIndicators" data-slide-to="0" class="fas fa-circle active"></i></li>
								<i data-target="#carouselExampleIndicators" data-slide-to="1" class="fas fa-circle"></i></li>
								<i  data-target="#carouselExampleIndicators" data-slide-to="2" class="fas fa-circle"></i></li>
							</ol>
<%
	for (DiscoverySearchFilterFacet facetConf : facetsConfCarousel){
	   		String f = facetConf.getIndexFieldName();
	   		List<FacetResult> facet = mapFacetesCarousel.get("title");
		    if (facet == null){
		        facet = mapFacetesCarousel.get("title"+".year");
		    }
		    if (facet == null){
		        continue;
		    }
	    String fkey = "jsp.jsp.search.facet.refine."+"title";
	    int limit = facetConf.getFacetLimit()+1;
%>		

				<h1 style="color: blue;"><%= f %></h2>
				<h2 style="color: red;"><%= facetConf.getIndexFieldName() %></h2>
				<%
				int idx = 1;
				int currFp = UIUtil.getIntParameter(request, "title"+"_page");
				if (currFp < 0){
					currFp = 0;
				}
				if (facet != null){
					for (FacetResult fvalue : facet){

						%>
	
						<%

						if (idx != limit){
							
						%> 	
							<div class="carousel-inner mb-4">
								<div class="carousel-item active">
									<div class="titulos-em-laranja col-lg-8" >
										<h3 class="titulos-em-vermelho mb-4"><%= fvalue.getDisplayedValue() %></h2>
									</div>
									<div class="titulos-em-laranja col-lg-8" >
										<h3 class="titulos-em-vermelho mb-4"><%= fvalue.getDisplayedValue() %></h2>
									</div>
								</div>
							</div>
						<%
							
						%>
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
						idx++;
					}
					if (currFp > 0 || idx > limit){
						if (currFp > 0) { 
					%>
							<a class="pull-left" href="<%= request.getContextPath()+ searchScopeCarousel + "?"+f+"_page="+(currFp-1) %>">
								<fmt:message key="jsp.search.facet.refine.previous" />
							</a>
					<% 
						} 
						if (idx > limit) { 
					%>
							<a href="<%= request.getContextPath()+ searchScopeCarousel + "?"+f+"_page="+(currFp+1) %>">
								<span class="pull-right"><fmt:message key="jsp.search.facet.refine.next" /></span>
							</a>
					<%
						}
					}
				}
					%>
	<%}
}
%>
<script type="text/javascript" src="<%= request.getContextPath() %>/static/js/clickable-facet.js"></script>