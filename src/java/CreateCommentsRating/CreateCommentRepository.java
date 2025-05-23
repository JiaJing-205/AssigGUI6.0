package CreateCommentsRating;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.*;
import javax.persistence.criteria.*;

@Stateless
public class CreateCommentRepository {

    private static final Logger logger = Logger.getLogger(CreateCommentRepository.class.getName());

    @PersistenceContext(unitName = "comment")
    private EntityManager em;

    public void save(CreateComment comment) {
        try {
            em.persist(comment);
            logger.log(Level.INFO, "Saved comment by {0}", comment.getUsername());
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error saving comment", e);
            throw new RuntimeException("Failed to save comment", e);
        }
    }

    public List<CreateComment> findAll() {
        try {
            return em.createQuery(
                    "SELECT c FROM CreateComment c ORDER BY c.createdAt DESC",
                    CreateComment.class
            ).getResultList();
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error loading comments", e);
            throw new RuntimeException("Failed to load comments", e);
        }
    }

    public List<CreateComment> filterComments(String filterType) {
        logger.info("Filtering comments by: " + filterType);

        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<CreateComment> query = cb.createQuery(CreateComment.class);
        Root<CreateComment> root = query.from(CreateComment.class);

        query.select(root);

        switch (filterType.toLowerCase()) {
            case "asc":
                query.orderBy(cb.asc(root.get("rating")));
                break;
            case "desc":
                query.orderBy(cb.desc(root.get("rating")));
                break;
            case "star5":
                query.where(cb.equal(root.get("rating"), 5));
                break;
            case "star4":
                query.where(cb.equal(root.get("rating"), 4));
                break;
            case "star3":
                query.where(cb.equal(root.get("rating"), 3));
                break;
            case "star2":
                query.where(cb.equal(root.get("rating"), 2));
                break;
            case "star1":
                query.where(cb.equal(root.get("rating"), 1));
                break;
            default:
                logger.warning("Unknown filter type: " + filterType);
                query.orderBy(cb.desc(root.get("createdAt")));
        }

        try {
            List<CreateComment> results = em.createQuery(query).getResultList();
            logger.log(Level.INFO, "Found {0} comments matching filter", results.size());
            return results;
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Filter query failed", e);
            throw new RuntimeException("Filter operation failed", e);
        }
    }

    public long countAllComments() {
        try {
            return em.createQuery("SELECT COUNT(c) FROM CreateComment c", Long.class)
                    .getSingleResult();
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Failed to count comments", e);
            return 0;
        }
    }

}