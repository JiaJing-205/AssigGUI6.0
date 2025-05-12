<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="domain.Payment" %>
<%
    Payment payment = (Payment) request.getAttribute("payment");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Confirmation</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f0f8ff;
                padding: 50px;
            }
            .confirmation {
                max-width: 600px;
                margin: auto;
                background: #ffffff;
                padding: 30px 40px;
                border-radius: 12px;
                text-align: center;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            h2 {
                color: #28a745;
                font-size: 28px;
            }
            .details {
                text-align: left;
                margin-top: 25px;
                font-size: 16px;
            }
            .details p {
                margin: 8px 0;
            }
            button {
                margin-top: 30px;
                padding: 12px 30px;
                background-color: #007bff;
                color: white;
                font-size: 16px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.2s ease;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="confirmation">
            <h2>Payment Successful!</h2>
            <div class="details">
                <p><strong>Payment ID:</strong> <%= payment.getPaymentID()%></p>
                <p><strong>User ID:</strong> <%= payment.getUserID()%></p>
                <p><strong>Total Price:</strong> RM<%= String.format("%.2f", payment.getTotalPrice())%></p>
                <p><strong>Payment Method:</strong> <%= payment.getPaymentMethod()%></p>
                <p><strong>Status:</strong> <%= payment.getPaymentStatus()%></p>
                <p><strong>Date:</strong> <%= payment.getPaymentDate()%></p>
            </div>

            <form action="GenerateReceiptServlet" method="post">
                <input type="hidden" name="paymentID" value="<%= payment.getPaymentID()%>">
                <button type="submit">Generate Receipt</button>
            </form>

            <form action="home.jsp">
                <input type="hidden" name="paymentID" value="<%= payment.getPaymentID()%>">
                <button type="submit">Back to Home</button>
            </form>
        </div>
    </body>
</html>
