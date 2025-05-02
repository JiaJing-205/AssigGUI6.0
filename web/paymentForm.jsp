<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Payment Form</h1>
        
        <form action="PaymentServlet" method="POST">
            <label for="paymentType">Select Payment Method:</label>
            <select name="paymentType" id="paymentType" onchange="displayPaymentFields()">
                <option value="creditCard">Credit Card</option>
                <option value="tng">TNG</option>
                <option value="cash">Cash</option>
            </select>
            
            <div id="creditCardFields" class="payment-fields" style="display:none;">
                <h3>Credit Card Payment</h3>
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter card number">
                
                <label for="expiryDate">Expiry Date:</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY">
                
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" placeholder="Enter CVV">
            </div>
            
            <div id="tngFields" class="payment-fields" style="display:none;">
                <h3>Touch 'n Go Payment</h3>
                <p>Scan the QR code to complete your payment.</p>
                <img src="tng_qr_code.png" alt="TNG QR Code" />
            </div>
            
            <div id="cashFields" class="payment-fields" style="display:none;">
                <h3>Cash Payment</h3>
                <label for="amountPaid">Amount:</label>
                <input type="text" id="amountPaid" name="amountPaid" placeholder="Enter amount paid">
            </div>
            
            <input type="submit" value="Submit Payment">
        </form>
    </div>
    
    <script>
        function displayPaymentFields() {
            var paymentType = document.getElementById('paymentType').value;
            document.getElementById('creditCardFields').style.display = 'none';
            document.getElementById('tngFields').style.display = 'none';
            document.getElementById('cashFields').style.display = 'none';
            
            if (paymentType == 'creditCard') {
                document.getElementById('creditCardFields').style.display = 'block';
            } else if (paymentType == 'tng') {
                document.getElementById('tngFields').style.display = 'block';
            } else if (paymentType == 'cash') {
                document.getElementById('cashFields').style.display = 'block';
            }
        }
    </script>
</body>
</html>