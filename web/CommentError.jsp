<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Error | Comment and Rating System</title>
    <style>
        :root {
            --danger: #e74c3c;
            --primary: #3498db;
            --dark: #2c3e50;
            --light: #f9f9f9;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            color: #333;
            background-color: #f5f5f5;
        }
        
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
</head>
<body>
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
            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss z"/>
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
</body>
</html>