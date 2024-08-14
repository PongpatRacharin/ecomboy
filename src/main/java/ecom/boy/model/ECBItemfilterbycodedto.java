package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemfilterbycodedto {
    private String itemcode;
    private String itemname;
    private String itemdetail;
    private int  price;
    private String imagedata;

    public ECBItemfilterbycodedto mapForObject(Map<String, Object> mapValue){
        ECBItemfilterbycodedto result = new ECBItemfilterbycodedto();
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setItemdetail((String)mapValue.get("itemdetail"));
        result.setPrice((int)mapValue.get("price"));
        result.setImagedata(String.valueOf(mapValue.get("imagedata")));
        return result;
    }
}
