package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemstockgetdto {
    private String itemcode;
    private String itemname;
    private String  itemtype;
    private int balance;
}
