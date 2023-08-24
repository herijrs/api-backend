package com.heri.apiinterface.controller;

import com.heri.apiclientsdk.model.User;
import com.heri.apicommon.common.BaseResponse;
import com.heri.apicommon.common.ErrorCode;
import com.heri.apicommon.common.ResultUtils;
import com.heri.apicommon.exception.ThrowUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 *
 */
@RestController()
@RequestMapping("/api/name")
public class NameController {

    /**
     * 测试能否通过get调用接口
     */
    @GetMapping("/get")
    public BaseResponse<String> getNameByGet(String name, HttpServletRequest request) {
        System.out.println(request.getHeader("yupi"));
        return ResultUtils.success("GET 你的名字是" + name);
    }
    /**
     * 测试能否通过post字符串参数来调用接口
     */
    @PostMapping("/post")
    public BaseResponse<String> getNameByPost(@RequestParam String name) {

        return ResultUtils.success("POST 你的名字是" + name);
    }
    /**
     * 测试接口，测试是否能调用JSON格式的参数的接口
     *
     * @param user Re-Api-client-sdk的User类
     */
    @PostMapping("/user")
    public BaseResponse<String> getUsernameByPost(@RequestBody User user) {
        ThrowUtils.throwIf(user==null, ErrorCode.PARAMS_ERROR);
        return ResultUtils.success("NameControl: POST 用户名字是" + user.getUserName()) ;
    }

}
