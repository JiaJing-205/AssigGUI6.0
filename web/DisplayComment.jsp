<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Comments</title>
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
            <h1>View Comments</h1>

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

                <a href="${pageContext.request.contextPath}/CreateComment.jsp" class="create-new">
                    + Create New Comment
                </a>

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
                        No comments found matching your filter.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>