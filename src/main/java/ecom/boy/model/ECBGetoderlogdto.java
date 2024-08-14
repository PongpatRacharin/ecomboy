package ecom.boy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ECBGetoderlogdto {
    private String itemcode;
    private String itemname;
    private String ordercode;
    private Date orderdate;
    private String orderstatus;

    public ECBGetoderlogdto mapForObject(Map<String, Object> mapValue){
        ECBGetoderlogdto result = new ECBGetoderlogdto();
        result.setItemcode((String)mapValue.get("itemcode"));
        result.setItemname((String)mapValue.get("itemname"));
        result.setOrdercode((String)mapValue.get("ordercode"));
        result.setOrderdate((Date) mapValue.get("orderdate"));
        result.setOrderstatus((String) mapValue.get("orderstatus"));
        return result;
    }
}
