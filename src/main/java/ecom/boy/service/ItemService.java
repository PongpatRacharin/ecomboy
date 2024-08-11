package ecom.boy.service;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.ECBItemdto;
import ecom.boy.model.ECBItemstockgetdto;
import ecom.boy.model.persistence.ECBItem;
import ecom.boy.repository.ItemRepository;
import ecom.boy.utility.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
@Service
public class ItemService {
    @Autowired
    ItemRepository itemRepository;

    public List<ECBItemdto> getAllItem(){
        List<Map<String, Object>> results = itemRepository.getAllItem();
        return  results.stream()
                .map(t -> new ECBItemdto(
                        (int) t.get("itemid"),
                        (String) t.get("itemcode"),
                        (String) t.get("itemname"),
                        (String) t.get("itemdetail"),
                        (String) t.get("itemtype"),
                        (int) t.get("price"),
                        (int) t.get("balance"),
                        (byte[]) t.get("imagedata")))
                .collect(Collectors.toList());
    }

    public List<ECBItemstockgetdto> getItemInfo(){
        List<Map<String, Object>> results = itemRepository.getAllItem();
        return  results.stream()
                .map(t -> new ECBItemstockgetdto(
                        (String) t.get("itemcode"),
                        (String) t.get("itemname"),
                        (String) t.get("itemtype"),
                        (int) t.get("balance")))
                .collect(Collectors.toList());
    }

    public void addItem(ECBItemdto itemdata){
        try {
            ECBItem dataforadd = new ECBItem();
            // Count the current number of rows
            long rowCount = itemRepository.count();
            // Set the ID based on the row count + 1
            itemdata.setItemid((int) (rowCount + 1));
            itemdata.setItemcode((String.valueOf(rowCount + 1)));
            dataforadd.setItemid(itemdata.getItemid());
            dataforadd.setItemcode(itemdata.getItemcode());
            dataforadd.setItemname(itemdata.getItemname());
            dataforadd.setItemdetail(itemdata.getItemdetail());
            dataforadd.setItemtype(itemdata.getItemtype());
            dataforadd.setPrice(itemdata.getPrice());
            dataforadd.setBalance(itemdata.getBalance());
            dataforadd.setImagedata(itemdata.getImagedata());
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }
}
