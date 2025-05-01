package item;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

public class removeItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        //obtain the parameter value from the html form
        String id = request.getParameter("id");        
        
        try{
            ItemDA itDA = new ItemDA();
            itDA.deleteRecord(id);
            out.println("<script type='text/javascript'>");
            out.println("alert('Item \"" + id + "\" has been deleted successfully.');");
            out.println("window.location = 'viewItemServlet';");
            out.println("</script>");

        } catch (Exception ex){
            out.println(ex);
        }
        
    }
}
