package pl.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.app.entity.Analysis;
import pl.app.entity.User;


import java.util.List;

public interface AnalysisRepository extends JpaRepository<Analysis,Long> {
    Analysis findAnalysisById(Long id);
    List<Analysis> findAnalysesByOwner(User owner);
//    List<Analysis> findAnalysesByFixture(String fixture);

    @Query(value = "SELECT*FROM analysis ORDER BY created DESC LIMIT 10", nativeQuery = true)
    List<Analysis> getFresh();

    @Query(value = "SELECT*FROM analysis WHERE fixture =?1 ORDER BY rating DESC LIMIT 10", nativeQuery = true)
    List<Analysis> getTopAnalysis(String fixture);

}
