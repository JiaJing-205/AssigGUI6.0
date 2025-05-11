<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.YearMonth" %>
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

                const creditFields = document.getElementById('creditCardFields');
                const tngFields = document.getElementById('tngFields');

                // Get individual inputs
                const cardNumber = document.getElementById('cardNumber');
                const expiryDate = document.getElementById('expiryDate');
                const cvv = document.getElementById('cvv');
                const tngScreenshot = document.getElementById('tngScreenshot');

                // Show/hide field groups
                creditFields.style.display = (type === 'creditCard') ? 'block' : 'none';
                tngFields.style.display = (type === 'tng') ? 'block' : 'none';

                // Set required attributes based on selected type
                if (type === 'creditCard') {
                    cardNumber.required = true;
                    expiryDate.required = true;
                    cvv.required = true;

                    tngScreenshot.required = false;
                    tngScreenshot.value = ''; // clear file input
                } else if (type === 'tng') {
                    cardNumber.required = false;
                    expiryDate.required = false;
                    cvv.required = false;

                    cardNumber.value = '';
                    expiryDate.value = '';
                    cvv.value = '';

                    tngScreenshot.required = true;
                } else {
                    // Cash: nothing is required except the payment type
                    cardNumber.required = false;
                    expiryDate.required = false;
                    cvv.required = false;
                    tngScreenshot.required = false;

                    cardNumber.value = '';
                    expiryDate.value = '';
                    cvv.value = '';
                    tngScreenshot.value = '';
                }
            }
        </script>

    </head>
    <body>
        <div class="payment-form">
            <h2>Payment Form</h2>
            <form action="PaymentServlet" method="post" enctype="multipart/form-data">
                <label for="paymentType">Payment Type<span class="required">*</span></label>
                <select name="paymentMethod" id="paymentType" onchange="handlePaymentTypeChange()" required>
                    <option value="">-- Select --</option>
                    <option value="creditCard">Credit Card</option>
                    <option value="tng">Touch 'n Go</option>
                    <option value="cash">Cash</option>
                </select>

                <div id="creditCardFields" style="display:none;">
                    <label for="cardNumber">Card Number<span class="required">*</span></label>
                    <input type="text" name="cardNumber" id="cardNumber" maxlength="19" required oninput="formatCardNumber(this)" />

                    <label for="expiryDate">Expiry Date<span class="required">*</span></label>
                    <input type="month" name="expiryDate" id="expiryDate" required min="<%= minMonth%>" />

                    <label for="cvv">CVV<span class="required">*</span></label>
                    <input type="text" name="cvv" id="cvv" maxlength="3" required oninput="formatCVV(this)" />
                </div>

                <div id="tngFields" class="qr-section">
                    <p><strong>Scan QR Code to Pay</strong></p>
                    <img src="resources/tng_qr.png" alt="TNG QR Code" />
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