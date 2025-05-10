<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error | Comment and Rating System</title>
        <style>
            h1 {
                color: var(--danger);
                border-bottom: 2px solid var(--danger);
                padding-bottom: 10px;
            }

            .error-container {
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                margin: 20px 0;
            }

            .error-message {
                color: var(--danger);
                background-color: #fdecea;
                padding: 15px;
                border-left: 4px solid var(--danger);
                margin-bottom: 20px;
                font-size: 16px;
            }

            .error-details {
                background: var(--light);
                padding: 15px;
                border-radius: 4px;
                font-family: monospace;
                white-space: pre-wrap;
                overflow-x: auto;
                margin-bottom: 20px;
                font-size: 14px;
            }

            .action-button {
                display: inline-block;
                background: var(--primary);
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 4px;
                transition: background 0.3s;
            }

            .action-button:hover {
                background: #2980b9;
            }

            .timestamp {
                color: #7f8c8d;
                font-size: 14px;
                margin-top: 20px;
                text-align: right;
            }
        </style>
        <link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <div id="navbar">
            <div>
            </div>

            <div class="search-container"><form action="searchItemPublicServlet" method="get" style="text-align:center; margin-bottom:20px;">
                    <input type="text" name="search" placeholder="Search item by name" required />
                    <input type="submit" value="Search" />
                </form>
            </div>

            <div>
                <a class="login-btn" href="Auth/Login.jsp">Login</a>
            </div>
        </div>

        <div class="sidebar">
            <a href="home.jsp"><img src="Images/logohorizon.png" height="90" width ="230" alt="alt" style="padding:0;margin:0;"/></a>
            <a href="home.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="events">Events</a>
            <a href="cart.jsp">Cart</a>
            <a href="checkout/checkout.jsp">Checkout</a>
            <a href="DisplayComment.jsp">Comments</a>
        </div>

        <div class="content">
            <h1>Error Occurred</h1>

            <div class="error-container">
                <div class="error-message">
                    <strong>Oops! Something went wrong:</strong>
                    <p>${errorMessage}</p>
                </div>

                <c:if test="${not empty exception}">
                    <div class="error-details">
                        <strong>Technical Details:</strong><br>
                        ${exception.message}
                    </div>
                </c:if>

                <div class="timestamp">
                    <fmt:formatDate value="<%= new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm:ss z"/>
                </div>

                <a href="${pageContext.request.contextPath}/CreateComment.jsp" class="action-button">
                    ← Back to Comments
                </a>

            </div>

            <!-- Hidden debugging information for admins -->
            <c:if test="${not empty exception}">
                <!--
                Stack Trace:
                <c:forEach items="${exception.stackTrace}" var="trace">
                    ${trace}
                </c:forEach>
                -->
            </c:if>
        </div>
    </body>
</html>