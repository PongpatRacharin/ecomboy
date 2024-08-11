package ecom.boy.controller;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.ECBItemdto;
import ecom.boy.model.ECBItemstockgetdto;
import ecom.boy.repository.ItemRepository;
import ecom.boy.model.ECBUsermgntdto;
import ecom.boy.model.persistence.ECBItem;
import ecom.boy.model.response.CommonResponse;
import ecom.boy.service.ItemService;
import ecom.boy.utility.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/v1/item")
public class ItemController {

    @Autowired
    private ItemService itemService = new ItemService();

    @GetMapping("/stock/getitem")
    public ResponseEntity<CommonResponse<List<ECBItemstockgetdto>>> getItemInfo(){
        List<ECBItemstockgetdto> Information = itemService.getItemInfo();
        CommonResponse<List<ECBItemstockgetdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(Information);
        return ResponseEntity.ok(response);
    }

    @PostMapping(value = "/stock/additem", produces = "application/json")
    public  ResponseEntity<CommonResponse<String>> addItem(@RequestBody ECBItemdto itemdata) {
        // Set variable to collect imagedata in byte form
        byte[] imagedata = itemdata.getImagedata();
        // Set variable for balance with random between 5 - 100
        int randomNumber = (int)(Math.random() * 96) + 5; // 96 because (100 - 5) + 1 = 96
        itemdata.setBalance(randomNumber);
        // Set variable for type to Test
        itemdata.setItemtype("Test");
        itemdata.setImagedata(imagedata);
        itemService.addItem(itemdata);
        CommonResponse<String> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

}
