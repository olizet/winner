package pl.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    public User findFirstByEmail(String email);
}
