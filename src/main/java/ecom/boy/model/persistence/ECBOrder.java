package ecom.boy.model.persistence;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "ecborder")
@Data
public class ECBOrder {
    @Id
    @Column(name = "orderid")
    private int orderid;

    @Column(name = "ordercode")
    private String ordercode;

    @Column(name = "itemcode")
    private String itemcode;

    @Column(name = "orderstatus")
    private  String orderstatus;

    @Column(name = "orderdate")
    private Date orderdate;

    @Column(name = "orderuserid")
    private int orderuserid;
}
