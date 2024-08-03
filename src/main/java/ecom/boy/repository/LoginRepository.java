package ecom.boy.repository;

import ecom.boy.model.persistence.ECBUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface LoginRepository extends JpaRepository<ECBUser, String> {
    @Query(nativeQuery = true, value = """
                SELECT * FROM ECBUSER;
                """)
        List<Map<String, Object>> getAllUser();

    @Query(nativeQuery = true, value = """
                SELECT * FROM ECBUSER
                WHERE username = :username;
                """)
    Map<String, Object> getAllUserByUserName(@Param("username") String username);
}

