package ecom.boy.repository;

import ecom.boy.model.persistence.ECBItem;
import ecom.boy.model.persistence.ECBQna;
import ecom.boy.model.persistence.ECBUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface QnaRepository extends JpaRepository<ECBQna, String> {
    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbqna;
                LEFT JOIN ecborder
                ON ecbqna.itemcode=ecborder.itemcode;
                LEFT JOIN ecbuser
                ON ecbitem.username=ecbuser.username;
                """)
    Map<String, Object> getAllQnA();
}
