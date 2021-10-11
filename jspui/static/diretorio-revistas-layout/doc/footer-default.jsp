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
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
            <%-- Page footer --%>
	<footer class="mt-5">
        <address>
            <div class="container">
                <div class="row">
                    <div class="col-xl-6">
                        <p>Brasileiro de Informação em Ciência e Tecnologia<br>
                        Quadra 5 - Lote 6 Bloco H - Asa sul - CEP: 70070-912 - Brasília - DF
                        </P>
                    </div>
                    <div class="col-xl-2 imagem-ibict" border="0">
                        <a href="http://ibict.br/">
                        <img src="<%= request.getContextPath() %>/image/ibict-65.png"></a>
                    </div>
                    <div class="col-xl-2 imagem-mctic" border="0">
                        <a href="http://www.mctic.gov.br/portal">
                        <img src="<%= request.getContextPath() %>/image/mctic.png"></a>
                    </div>
                </div>
            </div>
        </address>
    </footer>
	
    </body>
</html>