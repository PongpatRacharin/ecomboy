package ecom.boy.repository;

import ecom.boy.model.persistence.ECBUser;
import jakarta.transaction.Transactional;
import org.hibernate.annotations.DialectOverride;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface LoginRepository extends JpaRepository<ECBUser, String> {
    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbuser;
                """)
        List<Map<String, Object>> getAllUser();

    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbuser;
                """)
    List<Map<String, Object>> getUserInfo();

    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbuser
                WHERE username = :username;
                """)
    Map<String, Object> getAllUserByUserName(@Param("username") String username);


    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbuser
                WHERE userid = :userid;
                """)
    Map<String, Object> getAllUserByUserId(@Param("userid") int userid);

    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbuser
                WHERE username = :username
                and password = :password;
                """)
    Map<String, Object> getUserAndPassword(@Param("username") String username, @Param("password") String password);


    //@Modifying udapte
    //@Transactional roll back transection
}

