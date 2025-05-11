<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtered Comments</title>
        <link rel="stylesheet" href="z-styles.css" />

        <style>
            .filter-container {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
                align-items: center;
                flex-wrap: wrap;
            }

            .filter-dropdown {
                position: relative;
                display: inline-block;
            }

            .filter-button:hover {
                background: #2980b9;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                min-width: 200px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                border-radius: 4px;
                overflow: hidden;
            }

            .filter-dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown-content a {
                color: var(--dark);
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            .dropdown-header {
                padding: 12px 16px;
                font-weight: bold;
                background-color: var(--light);
                color: var(--dark);
                border-bottom: 1px solid #ddd;
            }
            .comment {
                background: white;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .comment-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .username {
                font-weight: bold;
                color: var(--dark);
                font-size: 18px;
            }

            .rating {
                color: #f39c12;
                font-weight: bold;
            }

            .stars {
                color: #f1c40f;
                font-size: 20px;
                letter-spacing: 2px;
            }

            .comment-date {
                color: #7f8c8d;
                font-size: 14px;
                margin-top: 5px;
            }

            .create-new {
                display: inline-block;
                background: var(--success);
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 4px;
                transition: background 0.3s;
            }

            .create-new:hover {
                background: #27ae60;
            }

            .refresh {
                display: inline-block;
                background: var(--primary);
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 4px;
                transition: background 0.3s;
            }

            .refresh:hover {
                background: #2980b9;
            }

            .empty-message {
                text-align: center;
                padding: 30px;
                color: #7f8c8d;
                font-style: italic;
            }

            .active-filter {
                background-color: var(--success);
                color: white;
            }

        </style>

    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">

            <h1>
                <c:choose>
                    <c:when test="${param.type eq 'asc'}">Comments: Lowest to Highest Rating</c:when>
                    <c:when test="${param.type eq 'desc'}">Comments: Highest to Lowest Rating</c:when>
                    <c:when test="${param.type eq 'star5'}">★★★★★ (5 Star Ratings)</c:when>
                    <c:when test="${param.type eq 'star4'}">★★★★ (4 Star Ratings)</c:when>
                    <c:when test="${param.type eq 'star3'}">★★★ (3 Star Ratings)</c:when>
                    <c:when test="${param.type eq 'star2'}">★★ (2 Star Ratings)</c:when>
                    <c:when test="${param.type eq 'star1'}">★ (1 Star Ratings)</c:when>
                    <c:otherwise>All Comments</c:otherwise>
                </c:choose>
            </h1>

            <div class="filter-container">
                <div class="filter-dropdown">
                    <button class="filter-button ${not empty param.type ? 'active-filter' : ''}">
                        Filter Comments ▼
                    </button>

                    <div class="dropdown-content">
                        <div class="dropdown-header">Sort Order</div>
                        <a href="filter-comments?type=asc" class="${param.type eq 'asc' ? 'active-filter' : ''}">↑ Lowest to Highest</a>
                        <a href="filter-comments?type=desc" class="${param.type eq 'desc' ? 'active-filter' : ''}">↓ Highest to Lowest</a>

                        <div class="dropdown-header">Filter by Rating</div>
                        <a href="filter-comments?type=star5" class="${param.type eq 'star5' ? 'active-filter' : ''}">★★★★★ (5 Stars)</a>
                        <a href="filter-comments?type=star4" class="${param.type eq 'star4' ? 'active-filter' : ''}">★★★★ (4 Stars)</a>
                        <a href="filter-comments?type=star3" class="${param.type eq 'star3' ? 'active-filter' : ''}">★★★ (3 Stars)</a>
                        <a href="filter-comments?type=star2" class="${param.type eq 'star2' ? 'active-filter' : ''}">★★ (2 Stars)</a>
                        <a href="filter-comments?type=star1" class="${param.type eq 'star1' ? 'active-filter' : ''}">★ (1 Star)</a>
                    </div>
                </div>

                <a href="${pageContext.request.contextPath}/view-comments" class="refresh">
                    🌐 Show All Comments
                </a>
            </div>

            <c:choose>
                <c:when test="${not empty comments}">
                    <c:forEach items="${comments}" var="comment">
                        <div class="comment">
                            <div class="comment-header">
                                <span class="username">${comment.username}</span>
                                <span class="rating">
                                    <span class="stars">
                                        <c:forEach begin="1" end="${comment.rating}">★</c:forEach>
                                        <c:forEach begin="${comment.rating + 1}" end="5">☆</c:forEach>
                                        </span>
                                        (${comment.rating}/5)
                                </span>
                            </div>
                            <p>${comment.comment}</p>
                            <div class="comment-date">
                                <fmt:formatDate value="${comment.createdAt}" pattern="MMMM dd, yyyy 'at' hh:mm a"/>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-message">
                        <p>No comments found matching your filter.</p>
                        <c:if test="${empty comments}">
                            <p class="debug-info">Debug: The 'comments' attribute is null or empty</p>
                        </c:if>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>