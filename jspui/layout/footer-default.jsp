<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3 col-md-pull-9">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
	<footer>
        <address>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <p id= "fonte">Instituto Brasileiro de Informação em Ciência e Tecnologia (Ibict)<br>
                        SAUS Quadra 5 - Lote 6 Bloco H - Asa sul - CEP: 70.070-912 - Brasília - DF
                        </p>
                    </div>
                    <!--<div class="col-lg-1 imagem-ibict" border="0">
                        <a href="http://ibict.br/" target="_blank">
                        <img src="<%= request.getContextPath() %>/image/ibict.png"></a>
                    </div>-->
                    <div class="col-lg-3 imagem-ibict-mctie" border="0">
                        <a href="http://www.mctic.gov.br/portal" target="_blank">
                        <img class="img-fluid" src="<%= request.getContextPath() %>/image/ibict-mctie.png" alt="Logo Ibict MCTI"></a>
                    </div>
                </div>
            </div>
        </address>
    </footer>
	
    </body>
</html>