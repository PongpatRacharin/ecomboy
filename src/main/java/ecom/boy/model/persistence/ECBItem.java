package ecom.boy.model.persistence;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "ecbitem")
@Data
public class ECBItem {
    @Id
    @Column(name = "itemid")
    private int itemid;

    @Column(name = "itemcode")
    private String itemcode;

    @Column(name = "itemname")
    private String  itemname;

    @Column(name = "itemdetail")
    private String  itemdetail;

    @Column(name = "itemtype")
    private String  itemtype;

    @Column(name = "price")
    private int  price;

    @Column(name = "balance")
    private int  balance;

    @Column(name = "imagedaata")
    private byte[]  imagedata;
}
