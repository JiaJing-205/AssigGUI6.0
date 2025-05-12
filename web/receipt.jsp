<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="domain.Payment" %>
<%
    Payment payment = (Payment) request.getAttribute("payment");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Receipt</title>
    <style>
        body {
            font-family: 'Courier New', monospace;
            background-color: #f5f5f5;
            padding: 40px;
        }
        .receipt-container {
            width: 400px;
            margin: auto;
            background-color: #fff;
            padding: 25px 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 1px dashed #999;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h2 {
            margin: 0;
            font-size: 22px;
        }
        .header p {
            margin: 0;
            font-size: 12px;
            color: #555;
        }
        .line {
            border-top: 1px dashed #999;
            margin: 15px 0;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            margin: 6px 0;
            font-size: 14px;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #555;
        }
        .print-btn {
            margin-top: 25px;
            text-align: center;
        }
        .print-btn button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }
        .print-btn button:hover {
            background-color: #0056b3;
        }

        @media print {
            .print-btn {
                display: none;
            }
        }
    </style>
</head>
<body>

<div class="receipt-container">
    <div class="header">
        <h2>Online Cinema Booking</h2>
        <p>Payment Receipt</p>
    </div>

    <div class="line"></div>

    <div class="detail-row">
        <span><strong>Receipt ID:</strong></span>
        <span><%= payment.getPaymentID() %></span>
    </div>
    <div class="detail-row">
        <span><strong>User ID:</strong></span>
        <span><%= payment.getUserID() %></span>
    </div>
    <div class="detail-row">
        <span><strong>Date:</strong></span>
        <span><%= payment.getPaymentDate() %></span>
    </div>
    <div class="detail-row">
        <span><strong>Status:</strong></span>
        <span><%= payment.getPaymentStatus() %></span>
    </div>

    <div class="line"></div>

    <div class="detail-row">
        <span><strong>Payment Method</strong></span>
        <span><%= payment.getPaymentMethod() %></span>
    </div>
    <div class="detail-row">
        <span><strong>Total Paid</strong></span>
        <span>RM<%= String.format("%.2f", payment.getTotalPrice()) %></span>
    </div>

    <div class="line"></div>

    <div class="footer">
        Thank you for your payment!<br>
        Please keep this receipt for your records.
    </div>

    <div class="print-btn">
        <button onclick="window.print()">Print Receipt</button>
    </div>
    
    <div class="print-btn">
        <a href="home.jsp"><button>Back to Home</button></a>
    </div>
</div>

</body>
</html>
