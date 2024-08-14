package ecom.boy.service;

import ecom.boy.Constant.CommonConstant;
import ecom.boy.model.persistence.*;
import ecom.boy.repository.*;
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
public class LandingService {
    @Autowired
    ItemRepository itemRepository;

    public List<ECBBestselllandingdto> getBestSellerLanding(){
        List<Map<String, Object>> results = itemRepository.getBestsellLanding();
        return  results.stream()
                .map(t -> new ECBBestselllandingdto(
                        (String) t.get("itemname"),
                        (String) t.get("itemcode"),
                        (String) t.get("imagedata")))
                .collect(Collectors.toList());
    }

    public List<ECBBestselllandingdto> getItemOrderLanding(){
        List<Map<String, Object>> results = itemRepository.getItemOrderLanding();
        return  results.stream()
                .map(t -> new ECBBestselllandingdto(
                        (String) t.get("itemname"),
                        (String) t.get("itemcode"),
                        (String) t.get("imagedata")))
                .collect(Collectors.toList());
    }
}
