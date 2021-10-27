package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    
    // 주소로 들어가면 get인 이것만 표시된다.
    @GetMapping(value = "/")
    public User aaa() {
        System.out.print("들어오긴하나??");
        User user = new User();
        user.setAge(3);
        user.setName("김영민");
        return user;
    }

    
    // post는 주소로 접근할 수 없다.
    @PostMapping(value = "/")
    public User bbbb() {
        System.out.print("POST??");
        User user = new User();
        user.setAge(242);
        user.setName("김영민22");
        return user;
    }

    @PostMapping(value = "/add/")
    public String postAdd (@RequestParam(value = "input") String input) {
        System.out.print("postAdd??" + input);
        
        return "success";
    }

    // @GetMapping(value = "/")
    // public String kkk() {
    // System.out.print("들어오긴하나??");
    // User user = new User();
    // user.setAge(3);
    // user.setName("김영민");
    // String result = user.getName() + " " + user.getAge();
    // return result;
    // }

}
