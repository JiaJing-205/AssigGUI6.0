package report;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class reportTop3ItemByMonth extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String monthStr = request.getParameter("month");
        if (monthStr == null || monthStr.isEmpty()) {
            request.setAttribute("error", "Please enter a valid month.");
            request.getRequestDispatcher("report.jsp").forward(request, response);
            return;
        }

        int month = Integer.parseInt(monthStr);
        
        try {
            reportDA rda = new reportDA();
            List<Report> reportList = rda.getTop3ItemByMonth(month);
            request.setAttribute("reportList", reportList);
            request.setAttribute("reportTitle", "Last 3 Items Sold in Month " + month);
            request.getRequestDispatcher("displayReport.jsp").forward(request, response);
            
        } catch (Exception ex) {
            request.setAttribute("error", "Error: " + ex.getMessage());
            request.getRequestDispatcher("report.jsp").forward(request, response);
        }
    }
}