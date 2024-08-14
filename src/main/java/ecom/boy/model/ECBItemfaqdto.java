package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBItemfaqdto {
    private int qnaid;
    private String name;
    private String itemcode;
    private String itemname;
    private String question;
    private String answer;
    private String imagedata;

    public ECBItemfaqdto mapForObject(Map<String, Object> mapValue){
        ECBItemfaqdto result = new ECBItemfaqdto();
        result.setQnaid((int)mapValue.get("qnaid"));
        result.setName((String)mapValue.get("name"));
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setQuestion((String)mapValue.get("question"));
        result.setAnswer((String)mapValue.get("answer"));
        result.setImagedata((String) mapValue.get("imagedata"));
        return result;
    }
}
