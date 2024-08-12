package ecom.boy.utility;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BaseUtility {
    public static String itemcodegenerate(){
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("MMddHHmmss");
        return "ITEM" + myDateObj.format(myFormatObj);
    }
}
