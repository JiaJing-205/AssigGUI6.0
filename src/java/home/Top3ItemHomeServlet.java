package home;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import report.Report;
import report.reportDA;

public class Top3ItemHomeServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            reportDA rda = new reportDA();
            List<Report> reportList = rda.getTop3Item();
            request.setAttribute("reportList", reportList);
            request.setAttribute("reportTitle", "Top 3 Items Sold");
            request.getRequestDispatcher("home.jsp").forward(request, response);
            
        } catch (Exception ex) {
            request.setAttribute("error", "Error: " + ex.getMessage());
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
}