package report;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reportTotalItem extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        try {
            reportDA rda = new reportDA();
            List<Report> reportList = rda.getTotalItemsSold();
            request.setAttribute("reportList", reportList);
            request.setAttribute("reportTitle", "Total Items Sold");
            request.getRequestDispatcher("displayReport.jsp").forward(request, response);
            
        } catch (Exception ex) {
            request.setAttribute("error", "Error: " + ex.getMessage());
            request.getRequestDispatcher("report.jsp").forward(request, response);
        }
    }
}
