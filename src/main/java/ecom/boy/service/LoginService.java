package ecom.boy.service;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.ECBAuthendto;
import ecom.boy.model.ECBUsermgntdto;
import ecom.boy.model.ECBUserdto;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.repository.LoginRepository;
import ecom.boy.utility.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;
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

    public List<ECBUsermgntdto> getUserInfo(){
        List<Map<String, Object>> results = loginRepository.getUserInfo();
        return  results.stream()
                .map(t -> new ECBUsermgntdto(
                        (int) t.get("userid"),
                        (String) t.get("username"),
                        (String) t.get("password"),
                        (String) t.get("email")))
                .collect(Collectors.toList());
    }

    public ECBUserdto getUSerByUsername(String username){
        Map<String, Object> results = loginRepository.getAllUserByUserName(username);
        ECBUserdto ecbOBJ = new ECBUserdto();
        return ecbOBJ.mapForObject(results);
    }

    public ECBAuthendto getUserAndPassword(ECBAuthendto username){
        Map<String, Object> results = loginRepository.getUserAndPassword(username.getUsername(),username.getPassword());
        if(ObjectUtils.isEmpty(results.get("username"))){
                        throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }

        ECBAuthendto ecbOBJ = new ECBAuthendto();
        return ecbOBJ.mapForObject(results);
    }

    public void deleteUser(String userid){
        try {
            loginRepository.deleteById(String.valueOf(userid));
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

//    public void updateUser(ECBUserdto userData){
//        try {
//            ECBUser dataForUpdate = new ECBUser();
//            dataForUpdate.setUsername(userData.getUsername());
//            dataForUpdate.setPassword(userData.getPassword());
//            dataForUpdate.setAddress(userData.getAddress());
//            dataForUpdate.setEmail(userData.getEmail());
//            dataForUpdate.setPermission(userData.getPermission());
//            dataForUpdate.setName(userData.getName());
//            dataForUpdate.setSnaem(userData.getSnaem());
//            dataForUpdate.setTel(userData.getTel());
//            loginRepository.save(dataForUpdate);
//        }catch(BusinessException e){
//            throw new BusinessException(CommonConstant.STATUS_CODE_400,
//                    CommonConstant.ERR_INTERNAL_SERVER,
//                    CommonConstant.ERR_INTERNAL);
//        }
//    }

    public void updateUser(int userid, ECBUserdto updatedUser) {
        try{
            ECBUser dataForupdate = loginRepository.getReferenceById(String.valueOf(userid));
            dataForupdate.setUsername(updatedUser.getUsername());
            dataForupdate.setPassword(updatedUser.getPassword());
            dataForupdate.setAddress(updatedUser.getAddress());
            dataForupdate.setEmail(updatedUser.getEmail());
            dataForupdate.setPermission(updatedUser.getPermission());
            dataForupdate.setName(updatedUser.getName());
            dataForupdate.setSnaem(updatedUser.getSnaem());
            dataForupdate.setTel(updatedUser.getTel());
            loginRepository.save(dataForupdate);
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
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
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }
}
