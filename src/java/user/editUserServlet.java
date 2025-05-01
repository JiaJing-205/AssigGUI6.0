package user;

import domain.User;
import da.UserDA;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

public class editUserServlet extends HttpServlet {
    
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");

    try (PrintWriter out = response.getWriter()) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String hbd = request.getParameter("hbd");
        String pwd = request.getParameter("pwd");
        String permission = request.getParameter("permission");

        // Construct User object
        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setHbd(hbd);
        user.setPwd(pwd);
        user.setPermission(permission);

        // Update user
        UserDA userDA = new UserDA();
        userDA.updateUser(user);

        // JavaScript response with alert and redirect
        out.println("<!DOCTYPE html>");
        out.println("<html><head><meta charset='UTF-8'><title>Update</title></head><body>");
        out.println("<script type='text/javascript'>");
        out.println("alert('User \"" + id + "\" has been edited successfully.');");
        out.println("window.location.href = 'viewUserServlet';");
        out.println("</script>");
        out.println("</body></html>");
    } catch (Exception ex) {
        ex.printStackTrace(); // logs in server console
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "User update failed.");
    }
}
}