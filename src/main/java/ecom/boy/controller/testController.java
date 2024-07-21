package ecom.boy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/v1")
public class testController {
    @GetMapping("/getText")
    public String getAllPersons() {
        return "Test kick off project";
    }
}
