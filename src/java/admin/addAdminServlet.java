/*
package admin;

import admin.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

public class addAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
        adminDA adDA = new adminDA();
        //obtain the parameter value from the html form
        String id = request.getParameter("id");
        String name = request.getParameter("name");      
        String password = request.getParameter("pass");
        String role = request.getParameter("role");
        
        Admin a = new Admin (id,name,password,role);
        adDA.addRecord(a);
        out.println("<script type='text/javascript'>");
        out.println("alert('Admin \"" + id + "\" has been added successfully.');");
        out.println("window.location = 'addAdmin.html';");
        out.println("</script>");
        } catch (Exception ex){
            out.println(ex);
        }
    }
}
*/
