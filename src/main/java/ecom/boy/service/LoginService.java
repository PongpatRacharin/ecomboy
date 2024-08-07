package ecom.boy.service;

import ecom.boy.model.ECBUserdto;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.repository.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class LoginService {
    @Autowired
    LoginRepository loginRepository;

    public List<ECBUserdto> getAllUSer(){
        List<Map<String, Object>> results = loginRepository.getAllUser();
        return  results.stream()
                .map(t -> new ECBUserdto(
                        (int) t.get("userid"),
                        (String) t.get("username"),
                        (String) t.get("password"),
                        (String) t.get("name"),
                        (String) t.get("snaem"),
                        (String) t.get("address"),
                        (String) t.get("tel"),
                        (String) t.get("email"),
                        (String) t.get("permission")))
                .collect(Collectors.toList());
    }

    public ECBUserdto getUSerByUsername(String username){
        Map<String, Object> results = loginRepository.getAllUserByUserName(username);
        ECBUserdto ecbOBJ = new ECBUserdto();
        return ecbOBJ.mapForObject(results);
    }

}
