package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBBestselllandingdto {
    private String itemname;
    private String itemcode;
    private String imagedata;

    public ECBItemwiithbestsellerdto mapForObject(Map<String, Object> mapValue){
        ECBItemwiithbestsellerdto result = new ECBItemwiithbestsellerdto();
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setItemtype((String)mapValue.get("imagedata"));
        return result;
    }
}
