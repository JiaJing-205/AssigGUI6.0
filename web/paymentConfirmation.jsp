<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 20px;
        }

        .receipt-container {
            max-width: 700px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4CAF50;
        }

        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
        }

        .total {
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50;
            text-align: right;
            margin-top: 20px;
        }

        .btn {
            display: block;
            margin: 30px auto 10px auto;
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            text-align: center;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .footer {
            text-align: center;
            font-size: 13px;
            color: #777;
            margin-top: 20px;
        }
    </style>
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