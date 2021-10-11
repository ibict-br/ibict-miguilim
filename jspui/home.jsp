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

<%--
	<div class="jumbotron">
        <%= topNews %>
	</div>
--%>
	
<div class="container row">
	
<%
if (communities != null && communities.size() != 0)
{
%>
<!--
	<div class="col-md-4">		
               <h3><fmt:message key="jsp.home.com1"/></h3>
                <p><fmt:message key="jsp.home.com2"/></p>
				<div class="list-group">
<%
	boolean showLogos = configurationService.getBooleanProperty("jspui.home-page.logos", true);
    for (Community com : communities)
    {
%>

<div class="list-group-item row">
<%  
		Bitstream logo = com.getLogo();
		if (showLogos && logo != null) { %>
	<div class="col-md-3">
        <img alt="Logo" class="img-responsive" src="<%= request.getContextPath() %>/retrieve/<%= logo.getID() %>" /> 
	</div>
	<div class="col-md-9">
<% } else { %>
	<div class="col-md-12">
<% }  %>		
		<h4 class="list-group-item-heading"><a href="<%= request.getContextPath() %>/handle/<%= com.getHandle() %>"><%= com.getName() %></a>
<%
        if (configurationService.getBooleanProperty("webui.strengths.show"))
        {
%>
		<span class="badge pull-right"><%= ic.getCount(com) %></span>
<%
        }

%>
		</h4>
		<p><%= communityService.getMetadata(com, "short_description") %></p>
    </div>
</div>                            
<%
    }
%>
	</div>

	</div> -->
<%
}
%>

</div>


<div class="container mt-5">
	<div class="row pesquisa">
		<div class="col-xl-9 offset-xl-1">
			 <form method="get" action="<%= request.getContextPath() %>/simple-search" scope="search" role="form">
				<div class="input-group">
					<input type="text" class="form-control " placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query" id="tequery-main-page" size="25"/>				
					<div class="input-group-append">
						<button type="submit"><i class="fas fa-search"></i></button>
						<input type="hidden" name="location" value="123456789/1">
						<input type="hidden" name="rpp" value="100">
						<input type="hidden" name="sort_by" value="score">
						<input type="hidden" name="order" value="DESC">
					</div>
				</div>
				<div class="busca-avancada mt-2">
					<p class="text-right">
						<button type="submit" class="button-busca-avancada"  action="<%= request.getContextPath() %>/simple-search">Busca avançada</button>
					</p>
                </div>
			</form>
		</div>
	</div>
</div>

		
<h2 class="titulos-novos-registros mt-5 mb-5"><fmt:message key="browse.page-title.carousel"/></h2>
<div class="container espacamento-registros">
<%
if (submissions != null && submissions.count() > 0)
{
%>
        
        <div class="panel panel-primary-customizado">        
        <div id="recent-submissions-carousel" class="panel-heading carousel slide">
          <h3><!--<fmt:message key="jsp.collection-home.recentsub"/>-->
              <%
    if(feedEnabled)
    {
	    	String[] fmts = feedData.substring(feedData.indexOf(':')+1).split(",");
	    	String icon = null;
	    	int width = 0;
	    	for (int j = 0; j < fmts.length; j++)
	    	{
	    		if ("rss_1.0".equals(fmts[j]))
	    		{
	    		   icon = "rss1.gif";
	    		   width = 80;
	    		}
	    		else if ("rss_2.0".equals(fmts[j]))
	    		{
	    		   icon = "rss2.gif";
	    		   width = 80;
	    		}
	    		else
	    	    {
	    	       icon = "rss.gif";
	    	       width = 36;
	    	    }
	%>
	    <!--<a href="<%= request.getContextPath() %>/feed/<%= fmts[j] %>/site"><img src="<%= request.getContextPath() %>/image/<%= icon %>" alt="RSS Feed" width="<%= width %>" height="15" style="margin: 3px 0 3px" /></a>-->
	<%
	    	}
	    }
	%>
          </h3>
          
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <%
		    boolean first = true;
		    for (Item item : submissions.getRecentSubmissions())
		    {
		        String displayTitle = itemService.getMetadataFirstValue(item, "dc", "title", null, Item.ANY);
		        if (displayTitle == null)
		        {
		        	displayTitle = "Untitled";
		        }
		        
				String displayUrl = itemService.getMetadataFirstValue(item, "dc", "identifier", "url", Item.ANY);
		        if (displayUrl == null)
		        {
		            displayUrl = "Untitled";
		        }
				
				String displayPublisherName = itemService.getMetadataFirstValue(item, "dc", "publisher", "name", Item.ANY);
		        if (displayPublisherName == null)
		        {
		            displayPublisherName = "Untitled";
		        }
				
				
		%>
		    <div style="padding-bottom: 20px; padding-top: 25px; min-height: 160px;" class="item <%= first?"active":""%>">
		      <div class="carousel-fonte" style="padding-left: 80px; padding-right: 80px; display: inline-block;">
				<p style="padding-left: 20px;">Título: <a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>"><%= Utils.addEntities(StringUtils.abbreviate(displayTitle, 400)) %></a></p>
				<p style="padding-left: 20px;">Instituição editora: <%= Utils.addEntities(StringUtils.abbreviate(displayPublisherName, 600)) %></p>
				<p style="padding-left: 20px;">URL: <a target="_blank" href="<%=displayUrl%>"><%= Utils.addEntities(StringUtils.abbreviate(displayUrl, 1000)) %></a></p>
		      </div>
		    </div>
		<%
				first = false;
		     }
		%>
		  </div>

		  <!-- Controls -->
		  <a class="left carousel-control" href="#recent-submissions-carousel" data-slide="prev">
		    <span class="icon-prev"></span>
		  </a>
		  <a class="right carousel-control" href="#recent-submissions-carousel" data-slide="next">
		    <span class="icon-next"></span>
		  </a>

          <!--<ol class="carousel-indicators">
		    <li data-target="#recent-submissions-carousel" data-slide-to="0" class="active"></li>
		    <% for (int i = 1; i < submissions.count(); i++){ %>
		    <li data-target="#recent-submissions-carousel" data-slide-to="<%= i %>"></li>
		    <% } %>
	      </ol>-->
     </div></div>
<%
}
%>

</div>
	<h2 class="titulos-do-navegue"><fmt:message key="jsp.search.facet.refine.large.areas"/></h2>
	<div class="container mb-5">	
	<%
    	int discovery_panel_cols = 12;
    	int discovery_facet_cols = 4;
    %>
	<%@ include file="discovery/static-sidebar-grandes-areas.jsp" %>
	</div>
	
	
	<div class="container">	
		<div class="featurette">
				<div class="row">
					<div class="col-md-12">
						<h2 class="featurette-heading titulo-cinza">Conheça também</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 mt-5 efeito-na-imagem" align="center">
						<a href="http://192.168.0.195/wordpress/" target="_blank">
						<img src="image/manuelzao.png" alt="..." ></a>
					</div>
					
					<div class="col-lg-4 mt-2 efeito-na-imagem" align="center">
							<a href="https://diadorim.ibict.br/" target="_blank">
							<img src="image/diadorim_color.png" alt="..." ></a> 
					</div>
					
					<div class="col-lg-4 mt-3 efeito-na-imagem" align="center">
						<a href="http://oasisbr.ibict.br/vufind/" target="_blank">
						<img src="image/oasisbr_color.png" alt="..." ></a>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 mt-5 efeito-na-imagem" align="center">
						<a href="https://www.latindex.org/latindex/inicio" target="_blank">
						<img src="image/latindex_color.png" alt="..." ></a>
					</div>
				</div>
		 </div>
	</div>
	
	
	

<div class="row">
	<%@ include file="discovery/static-tagcloud-facet.jsp" %>
</div>
	
</div>
</dspace:layout>
