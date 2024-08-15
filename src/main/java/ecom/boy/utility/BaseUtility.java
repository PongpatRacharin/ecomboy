package ecom.boy.utility;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import ecom.boy.model.ECBUserdto;
import ecom.boy.model.persistence.ECBBestsell;
import ecom.boy.model.persistence.ECBUser;
import ecom.boy.repository.*;
import ecom.boy.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;


public class BaseUtility {
    public static String itemcodegenerate(){
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("MMddHHmmss");
        return "ITEM" + myDateObj.format(myFormatObj);
    }

    public static String ordercodegenerate(){
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("MMddHHmmss");
        return "ORDER" + myDateObj.format(myFormatObj);
    }

    private static BestsellerRepository bestsellerRepository;

    public void setECBItemRepository(BestsellerRepository ecbItemRepository) {
        BaseUtility.bestsellerRepository = ecbItemRepository;
    }

    public static ECBBestsell getItemByItemCode(String itemcode) {
        return (ECBBestsell) bestsellerRepository.getItemByItemCode(itemcode);
    }

}

