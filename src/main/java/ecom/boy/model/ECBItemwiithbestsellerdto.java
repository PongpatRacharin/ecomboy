package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemwiithbestsellerdto {
    private String itemcode;
    private String itemname;
    private String itemtype;
    private int balance;
    private int bestsellno;

    public ECBItemwiithbestsellerdto mapForObject(Map<String, Object> mapValue){
        ECBItemwiithbestsellerdto result = new ECBItemwiithbestsellerdto();
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setItemtype((String)mapValue.get("itemtype"));
        result.setBalance((int)mapValue.get("balance"));
        result.setBestsellno((int)mapValue.get("bestsellno"));
        return result;
    }
}
