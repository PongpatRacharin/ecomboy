package ecom.boy.service;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.persistence.ECBBestsell;
import ecom.boy.model.persistence.ECBQna;
import ecom.boy.repository.BestsellerRepository;
import ecom.boy.repository.QnaRepository;
import ecom.boy.utility.*;
import ecom.boy.model.*;
import ecom.boy.model.persistence.ECBItem;
import ecom.boy.repository.ItemRepository;
import ecom.boy.utility.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
@Service
public class ItemService {
    @Autowired
    ItemRepository itemRepository;
    QnaRepository qnaRepository;

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
                        (String) t.get("imagedata")))
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

    public List<ECBGetoderlogdto> getAllItemWithOrderLog(){
        List<Map<String, Object>> results = itemRepository.getAllItemOrderLog();
        return results.stream()
                .map(t -> new ECBGetoderlogdto(
                        (String) t.get("itemcode"),
                        (String) t.get("itemname"),
                        (String) t.get("ordercode"),
                        (Date) t.get("orderdate"),
                        (String) t.get("orderstatus")))
                .collect(Collectors.toList());
    }

    public List<ECBItemwiithbestsellerdto> getItemBestSeller(){
        List<Map<String, Object>> results = itemRepository.getAllItemBestSeller();
        return  results.stream()
                .map(t -> new ECBItemwiithbestsellerdto(
                        (String) t.get("itemcode"),
                        (String) t.get("itemname"),
                        (String) t.get("itemtype"),
                        (int) t.get("balance"),
                        (int) t.get("bestsellno")))
                .collect(Collectors.toList());
    }

    public void addItemBestSeller(String itemcode){
        try{
            ECBBestsell dataforedit = BaseUtility.getItemByItemCode("");
            dataforedit.setItemcode(itemcode);
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

    public void editItemBestSeller(String itemcode){
        try{
            ECBBestsell dataforedit = BaseUtility.getItemByItemCode(itemcode);
            dataforedit.setItemcode("");
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

    public void addItem(ECBItemdto itemdata){
        try {
            ECBItem dataforadd = new ECBItem();
//            // Count the current number of rows
//            long rowCount = itemRepository.count();
//
//            // Set the ID based on the row count + 1
//            itemdata.setItemid((int) (rowCount + 1));
//            itemdata.setItemcode(String.valueOf(rowCount + 1));
//itemdata.getItemcode()
            // Set the properties of dataforadd
            dataforadd.setItemid(itemdata.getItemid());
            dataforadd.setItemcode(BaseUtility.itemcodegenerate());
            dataforadd.setItemname(itemdata.getItemname());
            dataforadd.setItemdetail(itemdata.getItemdetail());
            dataforadd.setItemtype(itemdata.getItemtype());
            dataforadd.setPrice(itemdata.getPrice());
            dataforadd.setBalance(itemdata.getBalance());
            dataforadd.setImagedata(itemdata.getImagedata());

            // Save the data to the database
            itemRepository.save(dataforadd);
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

    public ECBItemfilterbycodedto getAllItemByItemCode(String itemcode){
        Map<String, Object> results = itemRepository.getAllItemByItemCode();
        ECBItemfilterbycodedto ecbOBJ = new ECBItemfilterbycodedto();
        return ecbOBJ.mapForObject(results);
    }

    public ECBItemfaqdto getAllItemFaQ(){
        Map<String, Object> results = qnaRepository.getAllQnA();
        ECBItemfaqdto ecbOBJ = new ECBItemfaqdto();
        return ecbOBJ.mapForObject(results);
    }

    public void addQuestion(ECBItemfaqdto question){
        try{
            ECBQna dataForAdd = new ECBQna();
            dataForAdd.setQnaid(question.getQnaid());
            dataForAdd.setQuestion(question.getQuestion());
            qnaRepository.save(dataForAdd);
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

    public void updateItem(String itemid, ECBItemupdatedto updatedItem) {
        try{
            ECBItem dataForupdate = itemRepository.getReferenceById(String.valueOf(itemid));
            dataForupdate.setItemname(updatedItem.getItemname());
            dataForupdate.setItemdetail(updatedItem.getItemdetail());
            dataForupdate.setPrice(updatedItem.getPrice());
            dataForupdate.setImagedata(updatedItem.getImagedata());
            itemRepository.save(dataForupdate);
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

    public void deleteItem(String itemcode){
        try {
            itemRepository.deleteById(itemcode);
        }catch(BusinessException e){
            throw new BusinessException(CommonConstant.STATUS_CODE_400,
                    CommonConstant.ERR_INTERNAL_SERVER,
                    CommonConstant.ERR_INTERNAL);
        }
    }

}