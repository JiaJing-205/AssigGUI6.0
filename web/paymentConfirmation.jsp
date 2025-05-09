<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Confirmation</title>
    <script>
        function generateReceipt() {
            alert("Receipt download triggered (not implemented).");
        }
    </script>
</head>
<body>
<div class="receipt-container">
    <h1>Payment Successful</h1>
    <table>
        <tr>
            <th>Payment Method</th>
            <td>${payment.paymentMethod}</td>
        </tr>
        <tr>
            <th>Amount Paid</th>
            <td>RM ${payment.totalPrice}</td>
        </tr>
        <tr>
            <th>Payment Status</th>
            <td>${payment.paymentStatus}</td>
        </tr>
        <tr>
            <th>Payment Date</th>
            <td>${payment.paymentDate}</td>
        </tr>
    </table>

    <div class="total">
        Total Paid: RM ${payment.totalPrice}
    </div>

    <button class="btn" onclick="generateReceipt()">Download Receipt</button>

    <div class="footer">
        Thank you for your purchase! For help, contact support@example.com
    </div>
</div>
</body>
</html>