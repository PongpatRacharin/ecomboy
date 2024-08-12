package ecom.boy.controller;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.*;
import ecom.boy.model.response.CommonResponse;
import ecom.boy.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    public  ResponseEntity<CommonResponse<String>> addItem(@RequestBody ECBItemadddto itemdata) {
        ECBItemdto foradd = new ECBItemdto();
        // Set variable for balance with random between 5 - 100
        int randomNumber = (int)(Math.random() * 96) + 5; // 96 because (100 - 5) + 1 = 96
        foradd.setBalance(randomNumber);
        // Set variable for type to Test
        foradd.setItemname(itemdata.getItemname());
        foradd.setItemdetail(itemdata.getItemdetail());
        foradd.setPrice(itemdata.getPrice());
        foradd.setItemtype("Test");
        foradd.setImagedata(itemdata.getImagedata());
        itemService.addItem(foradd);
        CommonResponse<String> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/stock/getitembycode")
    public ResponseEntity<CommonResponse<ECBItemfilterbycodedto>> getUserData(String itemcode) {
        ECBItemfilterbycodedto itemobj = itemService.getAllItemByItemCode(itemcode);
        CommonResponse<ECBItemfilterbycodedto> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(itemobj);
        return ResponseEntity.ok(response);
    }

//    @PostMapping(value = "/stock/updateitem", produces = "application/json")
//    public ResponseEntity<CommonResponse<String>> updateItem(@RequestBody ECBItemadddto itemData) {
//        itemService.updateItem(itemData.getitemcode(),itemData);
//        CommonResponse<String> response = new CommonResponse<>();
//        response.setCode(CommonConstant.STATUS_CODE_200);
//        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
//        return ResponseEntity.ok(response);

}
