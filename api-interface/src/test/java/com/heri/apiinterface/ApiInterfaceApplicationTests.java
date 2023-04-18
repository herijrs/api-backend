package com.heri.apiinterface;

import com.heri.apiclientsdk.client.ApiClient;
import com.heri.apiclientsdk.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class ApiInterfaceApplicationTests {

    @Resource
    private ApiClient apiClient;

    @Test
    void contextLoads() {
        String heri = apiClient.getNameByGet("heri");
        User user = new User();
        user.setUserName("heripi");
        String result = apiClient.getUserNameByPost(user);
        System.out.println(heri);
        System.out.println(result);

    }

}
