package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemadddto {
    private String itemcode;
    private String itemname;
    private String itemdetail;
    private int price;
    private String imagedata;
}
