<%@ page import="da.PaymentDA" %>
<%@ page import="domain.Payment" %>

<%
    String paymentID = request.getParameter("paymentID");
    String userID = request.getParameter("userID");
    Payment payment = null;

    if (paymentID != null) {
        PaymentDA paymentDA = new PaymentDA();
        payment = paymentDA.retrieveRecord(paymentID);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Finalize Payment</title>
        <style>
            label, select, input {
                margin: 5px;
                display: block;
            }
            form {
                border: 1px solid #ccc;
                padding: 15px;
                margin-bottom: 30px;
            }
            .payment-details {
                margin-top: 10px;
            }
        </style>
        <script>
            function togglePaymentFields() {
                const method = document.getElementById("paymentMethod").value;
                document.getElementById("cardDetails").style.display = "none";
                document.getElementById("tngDetails").style.display = "none";

                if (method === "Card") {
                    document.getElementById("cardDetails").style.display = "block";
                } else if (method === "TNG") {
                    document.getElementById("tngDetails").style.display = "block";
                }
            }

            function enforceDigitsOnly(field) {
                field.value = field.value.replace(/\D/g, '');
            }
        </script>
    </head>
    <body>
        <h1>Payment Finalization</h1>

        <%
            if (payment != null && "Pending".equals(payment.getPaymentStatus())) {
        %>
        <form action="updatePaymentStatusServlet" method="post">
            <h3>Payment ID: <%= payment.getPaymentID()%></h3>
            <p>Total: RM <%= payment.getTotalPrice()%></p>

            <input type="hidden" name="paymentID" value="<%= payment.getPaymentID()%>" />
            <input type="hidden" name="userID" value="<%= payment.getUserID()%>" />

            <label for="paymentMethod">Payment Method: <span style="color:red;">*</span></label>
            <select name="paymentMethod" id="paymentMethod" onchange="togglePaymentFields()" required>
                <option value="">--Select--</option>
                <option value="TNG">TNG</option>
                <option value="Card">Card</option>
                <option value="Cash">Cash</option>
            </select>

            <!-- TNG QR Details -->
            <div id="tngDetails" class="payment-details" style="display: none;">
                <label>TNG Card Number: <span style="color:red;">*</span></label>
                <input type="text" name="tngCardNumber" placeholder="Enter TNG Card Number" />
                <label>Scan QR to Pay:</label><br>
                <img src="images/tng-qr-placeholder.png" alt="TNG QR Code" width="200" height="200" />
            </div>

            <!-- Card Details -->
            <div id="cardDetails" class="payment-details" style="display: none;">
                <label>Card Number: <span style="color:red;">*</span></label>
                <input type="text" name="cardNumber" maxlength="16" placeholder="16-digit Card Number" oninput="enforceDigitsOnly(this)" />
                <label>Expiry Date: <span style="color:red;">*</span></label>
                <input type="month" name="expiryDate" />
                <label>CVV: <span style="color:red;">*</span></label>
                <input type="text" name="cvv" maxlength="3" placeholder="3-digit CVV" oninput="enforceDigitsOnly(this)" />
            </div>

            <label for="paymentDate">Payment Date: <span style="color:red;">*</span></label>
            <input type="date" name="paymentDate" required />

            <button type="submit">Confirm Payment</button>
        </form>
        <%
        } else if (payment != null) {
        %>
        <p style="color:red;">This payment is already finalized.</p>
        <%
        } else {
        %>
        <p style="color:red;">No such payment found.</p>
        <%
            }
        %>

        <a href="viewPaymentServlet?userID=<%= userID%>">Back to Payment List</a>
    </body>
</html>
