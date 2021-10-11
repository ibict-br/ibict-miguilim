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

<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="org.dspace.discovery.configuration.DiscoverySearchFilterFacet"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.dspace.discovery.DiscoverResult.FacetResult"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>


<%
	boolean brefine = false;
	
	Map<String, List<FacetResult>> mapFacetes = (Map<String, List<FacetResult>>) request.getAttribute("discovery.fresults");
	List<DiscoverySearchFilterFacet> facetsConf = (List<DiscoverySearchFilterFacet>) request.getAttribute("facetsConfig");
	String searchScope = (String) request.getAttribute("discovery.searchScope");
	if (searchScope == null)
	{
	    searchScope = "";
	}
	
	if (mapFacetes != null)
	{
	    for (DiscoverySearchFilterFacet facetConf : facetsConf)
		{
		    String f = facetConf.getIndexFieldName();
		    List<FacetResult> facet = mapFacetes.get(f);
		    if (facet != null && facet.size() > 0)
		    {
		        brefine = true;
		        break;
		    }
		    else
		    {
		        facet = mapFacetes.get(f+".year");
			    if (facet != null && facet.size() > 0)
			    {
			        brefine = true;
			        break;
			    }
		    }
		}
	}
	if (brefine) {
%>
	<div class="marketing">
			 
<%
	for (DiscoverySearchFilterFacet facetConf : facetsConf){
	   		String f = facetConf.getIndexFieldName();
	   		List<FacetResult> facet = mapFacetes.get(f);
		    if (facet == null){
		        facet = mapFacetes.get(f+".year");
		    }
		    if (facet == null){
		        continue;
		    }
	    String fkey = "jsp.search.facet.refine."+f;
	    int limit = facetConf.getFacetLimit()+1;
%>		
			
            <div>
				<%
				
				Collections.sort(facet, new Comparator(){
				    @Override
				    public int compare(Object o1, Object o2) {
				    	FacetResult a1 = (FacetResult)o1;
				    	FacetResult a2 = (FacetResult)o2;
				        return a1.getDisplayedValue().compareToIgnoreCase(a2.getDisplayedValue());
				    }

				});
				
				
				if (facet != null){
					for (FacetResult fvalue : facet){ 
						if(fvalue.getDisplayedValue().equals("Ciências exatas e da terra")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/exatasedaterra@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Ciências biológicas")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/biologicas@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Engenharias")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/engenharias@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Ciências da saúde")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/saude@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Ciências agrárias")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/agrarias@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Ciências sociais aplicadas")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/sociais@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Ciências humanas")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/humanas@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Linguística, letras e artes")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/linguaseartes@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}else if(fvalue.getDisplayedValue().equals("Multidisciplinar")){
								%>
								<div class="col-lg-4 mt-5 link-customizado" align="center">
									<a href="<%= request.getContextPath()
									+ searchScope
									+ "/simple-search?filterquery="+URLEncoder.encode(fvalue.getAsFilterQuery(),"UTF-8")
									+ "&amp;filtername="+URLEncoder.encode(f,"UTF-8")
									+ "&amp;filtertype="+URLEncoder.encode(fvalue.getFilterType(),"UTF-8") %>"
									title="<fmt:message key="jsp.search.facet.narrow"><fmt:param><%=fvalue.getDisplayedValue() %></fmt:param></fmt:message>">
										<img class="rounded-circle" src="image/multidisciplinar@2x.png" alt="Generic placeholder image" width="140" height="140">
										<p class="espacamento-estilo-areas"><%= StringUtils.abbreviate(fvalue.getDisplayedValue(),36) %></p>
						             </a>
						         </div>
								<%
							}
						
					}	
				}
					%>
		</div>
	</div>	
	<%}
}
%>
<script type="text/javascript" src="<%= request.getContextPath() %>/static/js/clickable-facet.js"></script>