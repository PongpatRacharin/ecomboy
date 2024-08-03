package ecom.boy.controller;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.ECBUserdto;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.model.response.CommonResponse;
import ecom.boy.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
