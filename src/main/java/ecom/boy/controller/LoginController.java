package ecom.boy.controller;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.ECBUserdto;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.model.response.CommonResponse;
import ecom.boy.service.LoginService;
import ecom.boy.utility.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/v1/login")
public class LoginController {

    @Autowired
    private LoginService loginService = new LoginService();

    @GetMapping("/getuser")
    public ResponseEntity<CommonResponse<List<ECBUserdto>>> getUserData() {
        List<ECBUserdto> alluser = loginService.getAllUSer();
        CommonResponse<List<ECBUserdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(alluser);
        return ResponseEntity.ok(response);
//            throw new BusinessException(CommonConstant.STATUS_CODE_400,
//                    CommonConstant.ERR_INTERNAL_SERVER,
//                    CommonConstant.ERR_INTERNAL);
    }

    @GetMapping("/getuserbyusername")
    public ResponseEntity<CommonResponse<ECBUserdto>> getUserData(String username) {
        ECBUserdto userName = loginService.getUSerByUsername(username);
        CommonResponse<ECBUserdto> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(userName);
        return ResponseEntity.ok(response);
    }

    @PostMapping(value = "/save", produces = "application/json")
    public ResponseEntity<CommonResponse<String>> createUser(@RequestBody ECBUserdto userData) {
        loginService.saveUser(userData);
        CommonResponse<String> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }
}
