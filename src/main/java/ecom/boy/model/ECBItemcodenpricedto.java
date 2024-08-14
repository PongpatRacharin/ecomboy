package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemcodenpricedto {
    private String itemcode;
    private String itemname;
    private int price;
    private String imagedata;

    public ECBItemcodenpricedto mapForObject(Map<String, Object> mapValue){
        ECBItemcodenpricedto result = new ECBItemcodenpricedto();
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setPrice((int)mapValue.get("price"));
        result.setImagedata((String) mapValue.get("imagedata"));
        return result;
    }
}
