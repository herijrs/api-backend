package com.heri.apiinterface;


import com.heri.apiclientsdk.client.ApiClient;
import com.heri.apiclientsdk.model.User;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        String accessKey = "heri";
        String secretKey = "abcdefg";
        ApiClient client = new ApiClient(accessKey,secretKey);
        String result1 = client.getNameByGet("heri");
        String result2 = client.getNameByPost("heri");
        User user = new User();
        user.setUserName("heri");
        String result3 = client.getUserNameByPost(user);
        System.out.println(result1);
        System.out.println(result2);
        System.out.println(result3);

    }
}
