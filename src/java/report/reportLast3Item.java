package report;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class reportLast3Item extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            reportDA rda = new reportDA();
            List<Report> reportList = rda.getLast3Item();
            request.setAttribute("reportList", reportList);
            request.setAttribute("reportTitle", "Last 3 Items Sold");
            request.getRequestDispatcher("displayReport.jsp").forward(request, response);
            
        } catch (Exception ex) {
            request.setAttribute("error", "Error: " + ex.getMessage());
            request.getRequestDispatcher("report.jsp").forward(request, response);
        }
    }
}