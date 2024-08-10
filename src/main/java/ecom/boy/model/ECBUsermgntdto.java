package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBUsermgntdto {
    private int userid;
    private String username;
    private String password;
    private String email;

    public ECBUsermgntdto mapForObject(Map<String, Object> mapValue){
        ECBUsermgntdto result = new ECBUsermgntdto();
        result.setUsername((String)mapValue.get("userid"));
        result.setUsername((String)mapValue.get("username"));
        result.setPassword((String)mapValue.get("password"));
        result.setPassword((String)mapValue.get("email"));
        return result;
    }
}