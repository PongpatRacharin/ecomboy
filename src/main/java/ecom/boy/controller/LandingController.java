package ecom.boy.controller;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.*;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.model.response.CommonResponse;
import ecom.boy.service.LandingService;
import ecom.boy.service.LoginService;
import ecom.boy.utility.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/v1/landing")
public class LandingController {
    @Autowired
    private LandingService landingService = new LandingService();

    @GetMapping("/item/getbestsell")
    public ResponseEntity<CommonResponse<List<ECBBestselllandingdto>>> getBestSeller() {
        List<ECBBestselllandingdto> result = landingService.getBestSellerLanding();
        CommonResponse<List<ECBBestselllandingdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(result);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/item/getitem")
    public ResponseEntity<CommonResponse<List<ECBBestselllandingdto>>> getItemOrderLanding() {
        List<ECBBestselllandingdto> result = landingService.getBestSellerLanding();
        CommonResponse<List<ECBBestselllandingdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(result);
        return ResponseEntity.ok(response);
    }
}
