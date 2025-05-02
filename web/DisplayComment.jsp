<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Comments</title>
        <link rel="stylesheet" href="styles.css" />
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

        <div class="content" style="margin-left: 250px; padding: 40px; font-family: Arial, sans-serif;">
            <h1 style="margin-bottom: 30px; color: #04484f;">View Comments</h1>

            <div class="filter-container" style="display: flex; flex-wrap: wrap; align-items: center; gap: 15px; margin-bottom: 30px;">
                <div class="filter-dropdown" style="position: relative;">
                    <button class="filter-button" style="padding: 10px 20px; background-color: #04484f; color: white; border: none; border-radius: 5px; cursor: pointer;">
                        Filter Comments ▼
                    </button>
                    <div class="dropdown-content" style="display: none; position: absolute; top: 100%; left: 0; background: #fff; border: 1px solid #ccc; padding: 15px; border-radius: 5px; z-index: 10; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
                        <div class="dropdown-header" style="font-weight: bold; margin-bottom: 5px;">Sort Order</div>
                        <a href="filter-comments?type=asc" class="${param.type eq 'asc' ? 'active-filter' : ''}">↑ Lowest to Highest</a><br/>
                        <a href="filter-comments?type=desc" class="${param.type eq 'desc' ? 'active-filter' : ''}">↓ Highest to Lowest</a><br/>

                        <div class="dropdown-header" style="font-weight: bold; margin: 10px 0 5px;">Filter by Rating</div>
                        <c:forEach var="i" begin="5" end="1" step="-1">
                            <a href="filter-comments?type=star${i}" class="${param.type eq 'star' += i ? 'active-filter' : ''}">
                                <c:forEach begin="1" end="${i}">★</c:forEach>
                                <c:forEach begin="${i+1}" end="5">☆</c:forEach>
                                </a><br/>
                        </c:forEach>
                    </div>
                </div>

                <a href="${pageContext.request.contextPath}/CreateComment.jsp" class="create-new" style="background-color: #28a745; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">+ Create New Comment</a>

                <a href="${pageContext.request.contextPath}/view-comments" class="refresh" style="background-color: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">🌐 Show All Comments</a>
            </div>

            <c:choose>
                <c:when test="${not empty comments}">
                    <c:forEach items="${comments}" var="comment">
                        <div class="comment" style="border: 1px solid #ddd; padding: 20px; margin-bottom: 20px; border-radius: 8px; background-color: #fafafa;">
                            <div class="comment-header" style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                                <span class="username" style="font-weight: bold; color: #04484f;">${comment.username}</span>
                                <span class="rating" style="color: #f5c518;">
                                    <c:forEach begin="1" end="${comment.rating}">★</c:forEach>
                                    <c:forEach begin="${comment.rating + 1}" end="5">☆</c:forEach>
                                    <span style="color: #333; margin-left: 5px;">(${comment.rating}/5)</span>
                                </span>
                            </div>
                            <p style="font-size: 16px; color: #333;">${comment.comment}</p>
                            <div class="comment-date" style="font-size: 14px; color: #888;">
                                <fmt:formatDate value="${comment.createdAt}" pattern="MMMM dd, yyyy 'at' hh:mm a"/>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-message" style="font-size: 18px; color: #666; text-align: center; padding: 30px;">
                        No comments found matching your filter.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <script>
            document.querySelector('.filter-button').addEventListener('click', function () {
                const dropdown = this.nextElementSibling;
                dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
            });
        </script>

    </body>
</html>