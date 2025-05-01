package user;

import domain.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

public class addUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
         /*
        try{
        
        userDA usDA = new userDA();
        //obtain the parameter value from the html form
        String id = request.getParameter("id");
        String name = request.getParameter("name");      
        String password = request.getParameter("pass");
        char gender = request.getParameter("gender").charAt(0);
        String membership = request.getParameter("membership");
        
        User u = new User (id,name,password,gender,membership);
        usDA.addRecord(u);
        out.println("<script type='text/javascript'>");
        out.println("alert('User \"" + id + "\" has been added successfully.');");
        out.println("window.location = 'addUser.html';");
        out.println("</script>");
        } catch (Exception ex){
            out.println(ex);
        }
*/
    }
}
