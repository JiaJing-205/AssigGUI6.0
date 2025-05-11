<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.YearMonth" %>
<%@ page import="domain.*" %>
<%@ page import="da.*" %>
<%@ page import="Payment.*" %>

<%
    YearMonth now = YearMonth.now();
    String minMonth = now.toString(); // Format: YYYY-MM
%>
<html>
<head>
    <title>Make a Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
            padding: 40px;
        }
        .payment-form {
            max-width: 550px;
            margin: auto;
            background: #fff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        .required {
            color: red;
        }
        input[type="text"], input[type="month"], input[type="file"], select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .qr-section {
            display: none;
            margin-top: 20px;
            text-align: center;
        }
        .qr-section img {
            width: 180px;
            height: auto;
            margin-bottom: 15px;
        }
        button {
            margin-top: 25px;
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function handlePaymentTypeChange() {
            const type = document.getElementById('paymentType').value;
            document.getElementById('creditCardFields').style.display = (type === 'creditCard') ? 'block' : 'none';
            document.getElementById('tngFields').style.display = (type === 'tng') ? 'block' : 'none';
        }

        function formatCardNumber(input) {
            input.value = input.value.replace(/\D/g, '').replace(/(.{4})/g, '$1 ').trim().substring(0, 19);
        }

        function formatCVV(input) {
            input.value = input.value.replace(/\D/g, '').substring(0, 3);
        }
    </script>
</head>
<body>
    <div class="payment-form">
        <h2>Payment Form</h2>
        <form action="PaymentServlet" method="post" enctype="multipart/form-data">
            <label for="paymentType">Payment Type<span class="required">*</span></label>
            <select name="paymentType" id="paymentType" onchange="handlePaymentTypeChange()" required>
                <option value="">-- Select --</option>
                <option value="creditCard">Credit Card</option>
                <option value="tng">Touch 'n Go</option>
                <option value="cash">Cash</option>
            </select>

            <div id="creditCardFields" style="display:none;">
                <label for="cardNumber">Card Number<span class="required">*</span></label>
                <input type="text" name="cardNumber" id="cardNumber" maxlength="19" required oninput="formatCardNumber(this)" />

                <label for="expiryDate">Expiry Date<span class="required">*</span></label>
                <input type="month" name="expiryDate" id="expiryDate" required min="<%= minMonth %>" />

                <label for="cvv">CVV<span class="required">*</span></label>
                <input type="text" name="cvv" id="cvv" maxlength="3" required oninput="formatCVV(this)" />
            </div>

            <div id="tngFields" class="qr-section">
                <p><strong>Scan QR Code to Pay</strong></p>
                <img src="Images/tngQRCode.jpg" alt="TNG QR Code" />
                <label for="tngScreenshot">Upload Payment Screenshot<span class="required">*</span></label>
                <input type="file" name="tngScreenshot" id="tngScreenshot" accept="image/*" required />
            </div>

            <button type="submit">Submit Payment</button>
        </form>
    </div>

    <script>
        window.onload = handlePaymentTypeChange;
    </script>
</body>
</html>
