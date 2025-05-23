<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Comment</title>
        <link rel="stylesheet" href="z-styles.css" />

        <style>
            #commentSubmissionForm {
                background: white;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                margin-bottom: 30px;
            }

            #commentSubmissionForm .form-group {
                margin-bottom: 20px;
            }

            #commentSubmissionForm label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: var(--dark);
            }

            #commentSubmissionForm input[type="text"],
            #commentSubmissionForm textarea,
            #commentSubmissionForm select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border 0.3s;
                box-sizing: border-box;
            }

            #commentSubmissionForm textarea {
                height: 40px;
                max-height: 120px;
                overflow-y: hidden;
                resize: none;
            }

            #commentSubmissionForm button {
                background: white;
                color: #04484f;
                border: 2px solid #04484f;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background 0.3s;
            }

            #commentSubmissionForm button:hover,
            a:hover{
                background: #04484f;
                color: white;
            }

            .required-asterisk {
                color: red;
            }
        </style>

    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <h1>Create New Comment</h1>

            <c:if test="${not empty errorMessage}">
                <div class="error">
                    <p>${errorMessage}</p>
                </div>
            </c:if>

            <div class="comment-form">
                <form id="commentSubmissionForm" method="POST" action="${pageContext.request.contextPath}/create-comment">
                    <div class="form-group">
                        <label for="username">Your Name: <span class="required-asterisk">*</span></label>
                        <input type="text" id="username" name="username" required 
                               placeholder="Enter your name" maxlength="50">
                    </div>

                    <div class="form-group">
                        <label for="comment">Your Comment: </label>
                        <textarea id="comment" name="comment"
                                  placeholder="Share your thoughts..." ></textarea>
                    </div>

                    <div class="form-group">
                        <label for="rating">Rating: <span class="required-asterisk">*</span></label>
                        <select id="rating" name="rating" required>
                            <option value="" disabled selected>Select rating</option>
                            <option value="1">★ (Poor)</option>
                            <option value="2">★★ (Fair)</option>
                            <option value="3">★★★ (Good)</option>
                            <option value="4">★★★★ (Very Good)</option>
                            <option value="5">★★★★★ (Excellent)</option>
                        </select>
                    </div>

                    <button type="submit">Submit Comment</button>
                </form>

                <div style="margin-top: 20px; text-align: center;">
                    <a href="${pageContext.request.contextPath}/view-comments" 
                       style="text-decoration: none;">
                        ← View All Comments
                    </a>
                </div>
            </div>

            <script>
                const commentBox = document.getElementById('comment');
                commentBox.addEventListener('input', function () {
                    this.style.height = '40px';
                    this.style.height = Math.min(this.scrollHeight, 120) + 'px';
                });
            </script>
        </div>
    </body>
</html>