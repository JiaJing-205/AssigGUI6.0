package Auth;

import domain.Admin;
import domain.Staff;
import da.StaffDA;
import domain.User;
import da.UserDA;
import da.AdminDA;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

    LogError logger = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String password = request.getParameter("pwd");
        String permission = "User";
        logger = new LogError("login.log");
        logger.logObject(password);
        logger.close();

        String error = "";
        boolean hasError = false;
        User user = new User();
        // Validate ID
        UserDA userDA = new UserDA();
        if (userDA.searchId(id) || userDA.searchEmail(id)) {
            if (userDA.searchId(id)) {
                user = userDA.retrieveRecord(id);
                if (!user.getBlock()) {
                    if (!user.getPwd().equals(password)) {
                        if (user.getFailCount() >= 3) {
                            user.setBlock(true);
                            error = "Account has been lock.<br>Reset password is required<br>";
                        } else {
                            user.setFailCount(user.getFailCount() + 1);
                            error += "Password incorect.<br>";
                        }
                        userDA.updateProfileRecord(user);
                        hasError = true;
                    } else {
                        user.setFailCount(0);
                        userDA.updateProfileRecord(user);
                    }
                } else {
                    error = "Account has been lock.<br>Reset password is required<br>";
                    hasError = true;
                }
            } else if (userDA.searchEmail(id)) {
                user = userDA.retrieveRecordEmail(id);
                if (!user.getBlock()) {
                    if (!user.getPwd().equals(password)) {
                        if (user.getFailCount() >= 3) {
                            user.setBlock(true);
                            error = "Account has been lock.<br>Reset password is required<br>";
                        } else {
                            user.setFailCount(user.getFailCount() + 1);
                            error += "Password incorect.<br>";
                        }
                        userDA.updateProfileRecord(user);
                        hasError = true;
                    } else {
                        user.setFailCount(0);
                        userDA.updateProfileRecord(user);
                    }
                } else {
                    error = "Account has been lock.<br>Reset password is required<br>";
                    hasError = true;
                }
            }
        } else {
            error += "User ID or Email not exist.<br>";
            hasError = true;
        }

        if (hasError) {
            // Go back to page
            request.setAttribute("error", error);
            request.setAttribute("id", id);
            request.setAttribute("password", password);
            request.getRequestDispatcher("Auth/Login.jsp").forward(request, response);
        } else {
            //Get permission
            AdminDA adminDA = new AdminDA();
            Admin admin = adminDA.retrieveRecord(id);
            StaffDA staffDA = new StaffDA();
            Staff staff = staffDA.retrieveRecord(id);
            if (admin.getId() != 0 || staff.getId() != 0) {
                if (admin.getId() != 0) {
                    if (user.getPermission().equals(admin.getPermission_key())) {
                        permission = "Admin";
                    }
                }
                if (staff.getId() != 0) {
                    if (user.getPermission().equals(staff.getPermission_key())) {
                        permission = "Staff";
                    }
                }
            }
            //Store cookie, and go to profile page
            Cookie userNameCookie = new Cookie("userName", user.getName());
            userNameCookie.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(userNameCookie);
            Cookie userIDCookie = new Cookie("userId", user.getId());
            userIDCookie.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(userIDCookie);
            Cookie userPermissionCookie = new Cookie("userPermission", permission);
            userPermissionCookie.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(userPermissionCookie);

            response.sendRedirect("Auth/Profile.jsp");
        }
    }
}
