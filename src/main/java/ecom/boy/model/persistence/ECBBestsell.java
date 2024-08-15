package ecom.boy.model.persistence;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "ecbbestsell")
@Data
public class ECBBestsell {
    @Id
    @Column(name = "bestsellno")
    private int bestsellno;

    @Column(name = "itemcode")
    private String itemcode;
}
