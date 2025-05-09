<%@ page import="java.util.List" %>
<%@ page import="report.Report" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Item Reports</title>
        <style>
            .top-bar {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }
        </style>
        <script>
            function submitForm(formId) {
                const month = document.getElementById("month").value;
                if (!month || month < 1 || month > 12) {
                    alert("Please enter a valid month (1-12)");
                    return;
                }
                document.getElementById(formId + "_month").value = month;
                document.getElementById(formId).submit();
            }
        </script><link rel="stylesheet" href="z-styles.css" />
    </head>
    <body>
        <%@ include file="z-navbar.jsp" %>
        <%@ include file="z-sidebar.jsp" %>
        <div class="content">
            <a class="button" href="/Assignment_Login/Auth/ProfileServlet">Return</a>
            <h2 style="text-align:center;">Generate Item Reports</h2>
            <h3 style="text-align:center;">Monthly</h3>

            <div style="text-align:center; margin-bottom: 20px;">
                <label>Enter Month (1-12): </label>
                <input type="number" id="month" name="month" min="1" max="12" required />
            </div>

            <div class="top-bar">      
                <form id="form1" action="reportTotalItemByMonth" method="get">
                    <input type="hidden" name="month" id="form1_month" />
                    <button type="button" onclick="submitForm('form1')">Total items sold</button>
                </form>

                <form id="form2" action="reportCategoryByMonth" method="get">
                    <input type="hidden" name="month" id="form2_month" />
                    <button type="button" onclick="submitForm('form2')">Total categories sold</button>
                </form>      

                <form id="form3" action="reportTop3ItemByMonth" method="get">
                    <input type="hidden" name="month" id="form3_month" />
                    <button type="button" onclick="submitForm('form3')">Top 3 items sold</button>
                </form>

                <form id="form4" action="reportLast3ItemByMonth" method="get">
                    <input type="hidden" name="month" id="form4_month" />
                    <button type="button" onclick="submitForm('form4')">Least 3 items sold</button>
                </form>

            </div>

            <h3 style="text-align:center;">Total</h3>

            <div class="top-bar">      
                <form action="reportTotalItem" method="get">
                    <button type="submit">Total items sold</button>
                </form>

                <form action="reportCategory" method="get">
                    <button type="submit">Total categories sold</button>
                </form>

                <form action="reportTop3Item" method="get">
                    <button type="submit">Top 3 items sold</button>
                </form>

                <form action="reportLast3Item" method="get">
                    <button type="submit">Least 3 items sold</button>
                </form>      
            </div>
            <a href="admin.html">Return Back</a>

    </body>
</html>