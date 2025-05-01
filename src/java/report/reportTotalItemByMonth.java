package report;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reportTotalItemByMonth extends HttpServlet {

    
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
            List<Report> reportList = rda.getTotalItemsSoldByMonth(month);
            request.setAttribute("reportList", reportList);
            request.setAttribute("reportTitle", "Total Items Sold in Month " + month);
            request.getRequestDispatcher("displayReport.jsp").forward(request, response);
            
        } catch (Exception ex) {
            request.setAttribute("error", "Error: " + ex.getMessage());
            request.getRequestDispatcher("report.jsp").forward(request, response);
        }
    }
}
