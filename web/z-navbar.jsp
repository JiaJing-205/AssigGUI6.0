<%@page import="javax.servlet.http.Cookie"%>
<div id="navbar">
    <div></div>
    <div class="search-container">
        <form action="searchItemPublicListServlet" method="get" style="text-align:center; margin-bottom:20px;">
            <input type="text" name="searchmore" placeholder="Search item by name" required />
            <input type="submit" value="Search" />
        </form>
    </div>
    <div>
        <%
            Cookie[] cookies = request.getCookies();
            String userName = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("userName")) {
                        userName = cookie.getValue();
                    }
                }
            }
            if (userName != null) {
        %> 
        <a class="login-btn" href="AuthCheckServlet">Profile</a>
        <%
        } else {
        %>
        <a class="login-btn" href="AuthCheckServlet">Login</a>
        <% }%>
    </div>
</div>