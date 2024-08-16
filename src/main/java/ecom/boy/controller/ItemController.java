package ecom.boy.controller;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.*;
import ecom.boy.repository.LoginRepository;
import ecom.boy.model.persistence.ECBItem;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.model.response.CommonResponse;
import ecom.boy.service.ItemService;
import ecom.boy.service.LoginService;
import ecom.boy.utility.BaseUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/v1/item")
public class ItemController {

    @Autowired
    private ItemService itemService = new ItemService();
    private LoginService loginService = new LoginService();

    @CrossOrigin(origins = "http://localhost:*")
    @GetMapping("/stock/getitem")
    public ResponseEntity<CommonResponse<List<ECBItemstockgetdto>>> getItemInfo(){
        List<ECBItemstockgetdto> Information = itemService.getItemInfo();
        CommonResponse<List<ECBItemstockgetdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(Information);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/stock/bestsellno")
    public ResponseEntity<CommonResponse<List<ECBItemwiithbestsellerdto>>> editItemBestSeller(String itemcode) {
        itemService.editItemBestSeller(itemcode);
        CommonResponse<List<ECBItemwiithbestsellerdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/stock/getorderlog")
    public ResponseEntity<CommonResponse<List<ECBGetoderlogdto>>> getOrderLog(){
        List<ECBGetoderlogdto> result = itemService.getAllItemWithOrderLog();
        CommonResponse<List<ECBGetoderlogdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(result);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/stock/delete")
    public ResponseEntity<CommonResponse<String>> deleteItem(String itemcode) {
        itemService.deleteItem(itemcode);
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

    @GetMapping("/stock/getitembycodewithprice")
    public ResponseEntity<CommonResponse<ECBItemcodenpricedto>> getItemwithPrice(String itemcode) {
        ECBItemcodenpricedto itemobj = itemService.getAllItemByItemCodenPrice(itemcode);
        CommonResponse<ECBItemcodenpricedto> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(itemobj);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/faq/getfaq")
    public ResponseEntity<CommonResponse<ECBItemfaqdto>> getFaQ(){
        ECBItemfaqdto itemOBJ = itemService.getAllItemFaQ();
        CommonResponse<ECBItemfaqdto> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(itemOBJ);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/stock/getbestsell")
    public ResponseEntity<CommonResponse<List<ECBItemwiithbestsellerdto>>> getBestSeller() {
        List<ECBItemwiithbestsellerdto> result = itemService.getItemBestSeller();
        CommonResponse<List<ECBItemwiithbestsellerdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        response.setData(result);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/stock/orderitem")
    public ResponseEntity<CommonResponse<List<ECBItemwiithbestsellerdto>>> addOrderItem(int userid,String itemcode) {

        //Declair variable to temporaly store data for use later
        ECBItemfilterbycodedto iteminfo = itemService.getAllItemByItemCode(itemcode);
        ECBOrderitemadddto orderinfo = new ECBOrderitemadddto();

        //Set Value to orderinfo
        orderinfo.setOrdercode(BaseUtility.ordercodegenerate());
        orderinfo.setItemcode(iteminfo.getItemcode());
        orderinfo.setOrderstatus("Prepare");
        orderinfo.setOrderdate(new Date());
        orderinfo.setOrderuserid(userid);

        //Add orderinfo's data to ecborder db
        itemService.orderitem(orderinfo);
        CommonResponse<List<ECBItemwiithbestsellerdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

    @PostMapping(value = "/faq/addanswer", produces = "application/json")
    public ResponseEntity<CommonResponse<List<ECBItemwiithbestsellerdto>>> addFaQAns(ECBItemfaqansdto answer) {
        itemService.addQusetion(answer);
        CommonResponse<List<ECBItemwiithbestsellerdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/stock/addbestsell")
    public ResponseEntity<CommonResponse<List<ECBItemwiithbestsellerdto>>> addItemBestSeller(String itemcode) {
        itemService.addItemBestSeller(itemcode);
        CommonResponse<List<ECBItemwiithbestsellerdto>> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/faq/addquestion")
    public ResponseEntity<CommonResponse<String>> addQustion(@RequestBody ECBQnadto question){
        ECBQnadto foradd = new ECBQnadto();
        foradd.setQnaid(question.getQnaid());
        foradd.setQuestion(question.getQuestion());
        CommonResponse<String> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
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


    @PostMapping(value = "/stock/updateitem", produces = "application/json")
    public ResponseEntity<CommonResponse<String>> updateItem(@RequestBody ECBItemupdatedto itemData) {
        itemService.updateItem(itemData.getItemcode(), itemData);
        CommonResponse<String> response = new CommonResponse<>();
        response.setCode(CommonConstant.STATUS_CODE_200);
        response.setMessage(CommonConstant.SUCCESS_DESCRIPTION);
        return ResponseEntity.ok(response);
    }

}
