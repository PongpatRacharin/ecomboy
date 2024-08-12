package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemupdatedto {
    private String itemname;
    private String itemdetail;
    private int  price;
    private byte[] imagedata;
}
