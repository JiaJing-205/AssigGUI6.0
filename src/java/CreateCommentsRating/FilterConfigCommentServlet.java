package CreateCommentsRating;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.inject.Inject;
import java.io.IOException;
import java.util.List;
import java.util.logging.*;

@WebServlet("/filter-comments") // Changed from "/filter-config"
public class FilterConfigCommentServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(FilterConfigCommentServlet.class.getName());
    
    @Inject 
    private CreateCommentRepository commentRepo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Logger.getLogger("").setLevel(Level.ALL);
        for (Handler h : Logger.getLogger("").getHandlers()) {
            h.setLevel(Level.ALL);
        }

        logger.info("======== FILTER SERVLET ENTERED ========");
        String filterType = request.getParameter("type");
        logger.log(Level.INFO, "Filter type parameter: {0}", filterType);
        
        try {

            long totalComments = commentRepo.countAllComments();
            logger.log(Level.INFO, "TOTAL COMMENTS IN DB: {0}", totalComments);
            
            if (totalComments == 0) {
                logger.warning("Database contains no comments!");
            }

            List<CreateComment> comments = commentRepo.filterComments(filterType);
            logger.log(Level.INFO, "Retrieved {0} filtered comments", comments.size());

            comments.stream().limit(3).forEach(c -> 
                logger.info(String.format(
                    "Comment Sample - ID: %d, User: %s, Rating: %d", 
                    c.getId(), c.getUsername(), c.getRating()
                ))
            );

            request.setAttribute("comments", comments);
            request.setAttribute("filterType", filterType);
            logger.info("Request attributes set");

            logger.info("Forwarding to FilteredComment.jsp");
            request.getRequestDispatcher("/FilteredComment.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "CRITICAL FILTER ERROR", e);
            request.setAttribute("errorMessage", "Filter Error: " + e.getMessage());
            request.getRequestDispatcher("/CommentError.jsp").forward(request, response);
        }
    }
}