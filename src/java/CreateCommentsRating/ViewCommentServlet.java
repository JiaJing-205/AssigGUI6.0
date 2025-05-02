package CreateCommentsRating;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
<<<<<<< Updated upstream
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
=======
import java.io.IOException;
import java.util.List;

@WebServlet("/view-comments")
public class ViewCommentServlet extends HttpServlet {
    private CreateCommentRepository commentRepo;

    @Override
    public void init() throws ServletException {
        commentRepo = new CreateCommentRepository();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String filterType = request.getParameter("filter");
            List<CreateComment> comments = (filterType != null) ? 
                commentRepo.filterComments(filterType) : 
                commentRepo.findAll();
            
            request.setAttribute("comments", comments);
            request.setAttribute("totalComments", commentRepo.countAllComments());
            request.getRequestDispatcher("/DisplayComments.jsp").forward(request, response);
            
        } catch (Exception e) {
            throw new ServletException("Failed to load comments", e);
        }
    }

    @Override
    public void destroy() {
        commentRepo.close();
    }
>>>>>>> Stashed changes
}