package ecom.boy.model;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBOrderitemadddto {
    private int orderid;
    private String ordercode;
    private String itemcode;
    private  String orderstatus;
    private Date orderdate;
    private int orderuserid;

    public ECBOrderitemadddto mapForObject(Map<String, Object> mapValue){
        ECBOrderitemadddto result = new ECBOrderitemadddto();
        result.setOrderid((int)mapValue.get("orderid"));
        result.setOrdercode((String)mapValue.get("ordercode"));
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setOrderstatus((String)mapValue.get("orderstatus"));
        result.setOrderdate((Date)mapValue.get("orderdate"));
        result.setOrderuserid((int)mapValue.get("orderuserid"));
        return result;
    }
}
