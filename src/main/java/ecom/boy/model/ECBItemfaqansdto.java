package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemfaqansdto {
    private String username;
    private String itemcode;
    private String question;

    public ECBItemfaqansdto mapForObject(Map<String, Object> mapValue){
        ECBItemfaqansdto result = new ECBItemfaqansdto();
        result.setUsername((String)mapValue.get("username"));
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setQuestion((String)mapValue.get("question"));
        return result;
    }
}
