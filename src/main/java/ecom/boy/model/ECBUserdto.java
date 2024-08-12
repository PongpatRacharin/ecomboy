package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBUserdto {
    private String userid;
    private String username;
    private String password;
    private String name;
    private String snaem;
    private String address;
    private String tel;
    private String email;
    private String permission;

    public ECBUserdto mapForObject(Map<String, Object> mapValue){
        ECBUserdto result = new ECBUserdto();
        result.setUserid((String) mapValue.get("userid"));
        result.setUsername((String)mapValue.get("username"));
        result.setPassword((String)mapValue.get("password"));
        result.setName((String)mapValue.get("name"));
        result.setSnaem((String)mapValue.get("snaem"));
        result.setAddress((String)mapValue.get("address"));
        result.setTel((String)mapValue.get("tel"));
        result.setEmail((String)mapValue.get("email"));
        result.setPermission((String)mapValue.get("permission"));
        return result;
    }
}
