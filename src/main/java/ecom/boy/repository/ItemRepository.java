package ecom.boy.repository;

import ecom.boy.model.persistence.ECBItem;
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
public interface ItemRepository extends JpaRepository<ECBItem, String> {
    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbitem;
                """)
    List<Map<String, Object>> getAllItem();

}
