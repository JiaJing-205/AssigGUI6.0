package CreateCommentsRating;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.inject.Inject;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/create-comment")
public class CreateCommentServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CreateCommentServlet.class.getName());
    
    @Inject
    private CreateCommentRepository commentRepo;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CreateComment comment = new CreateComment();
            comment.setUsername(request.getParameter("username"));
            comment.setComment(request.getParameter("comment"));
            comment.setRating(Short.parseShort(request.getParameter("rating")));
            
            commentRepo.save(comment);
            response.sendRedirect(request.getContextPath() + "/view-comments");
            
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Failed to create comment");
            request.getRequestDispatcher("/CommentError.jsp").forward(request, response);
        }
    }
}