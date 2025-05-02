package CreateCommentsRating;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.inject.Inject;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/view-comments")
public class ViewCommentServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ViewCommentServlet.class.getName());
    
    @Inject
    private CreateCommentRepository commentRepo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("comments", commentRepo.findAll());
            request.getRequestDispatcher("/DisplayComment.jsp").forward(request, response);
        } catch (Exception e) {
            logger.severe("Error loading comments: " + e.getMessage());
            request.setAttribute("errorMessage", "Could not load comments");
            request.getRequestDispatcher("/CommentError.jsp").forward(request, response);
        }
    }
}