package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemdto {
    private int itemid;
    private String itemcode;
    private String itemname;
    private String itemdetail;
    private String  itemtype;
    private int price;
    private int balance;
    private String imagedata;

    public ECBItemdto mapForObject(Map<String, Object> mapValue){
        ECBItemdto result = new ECBItemdto();
        result.setItemid((int)mapValue.get("itemid"));
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setItemdetail((String)mapValue.get("itemdetail"));
        result.setItemtype((String)mapValue.get("itemtype"));
        result.setPrice((int)mapValue.get("price"));
        result.setBalance((int)mapValue.get("balance"));
        result.setImagedata((String) mapValue.get("imagedata"));
        return result;
    }
}
