package ecom.boy.service;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.ECBUserdto;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.repository.LoginRepository;
import ecom.boy.utility.BusinessException;
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

    public void saveUser(ECBUserdto userData){
        try {
            ECBUser dataForSave = new ECBUser();
            dataForSave.setUsername(userData.getUsername());
            dataForSave.setPassword(userData.getPassword());
            dataForSave.setAddress(userData.getAddress());
            dataForSave.setEmail(userData.getEmail());
            dataForSave.setPermission(userData.getPermission());
            dataForSave.setName(userData.getName());
            dataForSave.setSnaem(userData.getSnaem());
            dataForSave.setTel(userData.getTel());
            loginRepository.save(dataForSave);
            ECBUserdto ecbOBJ = new ECBUserdto();
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }
}
