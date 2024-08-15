package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBAuthendto {
    private String username;
    private String password;
    private String permission;

    public ECBAuthendto mapForObject(Map<String, Object> mapValue){
        ECBAuthendto result = new ECBAuthendto();
        result.setUsername((String)mapValue.get("username"));
        result.setPassword((String)mapValue.get("password"));
        result.setPermission((String)mapValue.get("permission"));
        return result;
    }
}
