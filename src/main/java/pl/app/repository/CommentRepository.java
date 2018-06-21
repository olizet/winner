package pl.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.app.entity.Analysis;
import pl.app.entity.Comment;
import pl.app.entity.User;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Long> {
    @Query(value = "SELECT AVG(rating) FROM comments", nativeQuery = true)
    Double getAvgRating();

    List<Comment> findCommentsByUser(User user);

    List<Comment> findCommentsByAnalysis(Analysis analysis);

    @Query(value = "SELECT AVG(rating) FROM comments WHERE analysis_id=?1", nativeQuery = true)
    Double getAvgRatingCamp(Long id);

    Comment findCommentById(Long id);
}
