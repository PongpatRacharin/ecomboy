package ecom.boy.repository;

import ecom.boy.model.persistence.ECBItem;
import org.springframework.data.jpa.repository.JpaRepository;
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

    @Query(nativeQuery = true, value = """
            SELECT * FROM ecbitem
            WHERE itemcode = :itemcode;
            """)
    Map<String, Object> getAllItemByItemCode(@Param("itemcode") String itemcode);

}
