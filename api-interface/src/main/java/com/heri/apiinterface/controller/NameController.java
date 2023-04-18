package com.heri.apiinterface.controller;

import com.heri.apiclientsdk.model.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 *
 */
@RestController()
@RequestMapping("/name")
public class NameController {

    @GetMapping("/get")
    public String getNameByGet(String name){
        return "get 你的名字是"+name;
    }

    @PostMapping("/post")
    public String getNameByPost(@RequestParam String name){
        return "post 你的名字是"+name;
    }

    @PostMapping("/user")
    public String getUserNameByPost(@RequestBody User user, HttpServletRequest request){
//        String accessKey = request.getHeader("accessKey");
//        String nonce = request.getHeader("nonce");
//        String timeStamp = request.getHeader("timeStamp");
//        String sign = request.getHeader("sign");
//        String body = request.getHeader("body");
//        if(!accessKey.equals("heri")){
//            throw new RuntimeException("无权限");
//        }
//        if(Long.parseLong(nonce) >10000)
//            throw new RuntimeException("无权限");
//        String serveSign = SignUtils.getSign(body,"abcdefg");
//        if(!sign.equals(serveSign)){
//            throw new RuntimeException("无权限");
//        }

        String result =  "post 你的名字是 "+user.getUserName() +" "+user;

        return result;
    }


}
