package CreateCommentsRating;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import javax.inject.Inject;
import java.io.IOException;
import java.util.logging.Logger;
=======
import java.io.IOException;
import java.util.logging.*;
>>>>>>> Stashed changes
=======
import java.io.IOException;
import java.util.logging.*;
>>>>>>> Stashed changes

@WebServlet("/create-comment")
public class CreateCommentServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(CreateCommentServlet.class.getName());
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    
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
=======
=======
>>>>>>> Stashed changes
    private CreateCommentRepository commentRepo;

    @Override
    public void init() throws ServletException {
        commentRepo = new CreateCommentRepository();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = sanitizeInput(request.getParameter("username"));
        String commentText = sanitizeInput(request.getParameter("comment"));
        String ratingParam = request.getParameter("rating");

        try {
            // Validation
            if (username == null || username.trim().isEmpty() ||
                commentText == null || commentText.trim().isEmpty() ||
                ratingParam == null) {
                throw new IllegalArgumentException("All fields are required");
            }

            short rating = Short.parseShort(ratingParam);
            if (rating < 1 || rating > 5) {
                throw new IllegalArgumentException("Rating must be between 1-5");
            }

            // Create and save comment
            CreateComment comment = new CreateComment(username, commentText, rating);
            commentRepo.save(comment);
            
            response.sendRedirect(request.getContextPath() + "/view-comments");

        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/CreateComment.jsp").forward(request, response);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "System error creating comment", e);
            request.setAttribute("errorMessage", "System error: Please try again later");
            request.getRequestDispatcher("/CommentError.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        commentRepo.close();
    }

    private String sanitizeInput(String input) {
        return input != null ? 
               input.replaceAll("<", "&lt;").replaceAll(">", "&gt;") : 
               null;
    }
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
}