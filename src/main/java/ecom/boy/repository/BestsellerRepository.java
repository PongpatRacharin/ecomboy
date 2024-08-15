package ecom.boy.repository;

import ecom.boy.model.persistence.ECBBestsell;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BestsellerRepository extends JpaRepository<ECBBestsell, String> {
    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbbestsell;
                """)
    List<Map<String, Object>> getAllItem();

    @Query(nativeQuery = true, value = """
                SELECT * FROM ecbbestsell;
                WHERE itemcode = :itemcode;
                """)
    List<Map<String, Object>> getItemByItemCode(@Param("itemcode") String itemcode);
}
