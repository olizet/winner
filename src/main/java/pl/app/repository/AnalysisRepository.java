package pl.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.entity.Analysis;
import pl.app.entity.User;


import java.util.List;

public interface AnalysisRepository extends JpaRepository<Analysis,Long> {
    Analysis findAnalysisById(Long id);
    List<Analysis> findAnalysesByOwner(User owner);
    List<Analysis> findAnalysesByFixture(String fixture);
}
