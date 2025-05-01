/*
package admin;

import admin.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            adminDA adDA = new adminDA();
            String id = request.getParameter("id"); 
            Admin editList = adDA.getRecord(id);
            
            if (editList == null) {
                // If item not found, show styled error (not alert)
                out.println("<script type='text/javascript'>");
                out.println("alert('No admin with that ID found!');");
                out.println("window.location = 'editUser.jsp';");
                out.println("</script>");                
                return;
            }
            request.setAttribute("editAdmin", editList); // set attribute
            RequestDispatcher dispatcher = request.getRequestDispatcher("editAdmin.jsp");
            dispatcher.forward(request, response);
        } catch (Exception ex){
            out.println(ex);
        }
        
    }

}
*/