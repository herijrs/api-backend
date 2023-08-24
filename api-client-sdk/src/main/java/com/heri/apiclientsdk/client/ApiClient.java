package com.heri.apiclientsdk.client;

import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.URLUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.heri.apiclientsdk.model.APIHeaderConstant;
import com.heri.apiclientsdk.model.User;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

import static com.heri.apiclientsdk.utils.SignUtils.getSign;

@Slf4j
public class ApiClient {

    private static  String GATEWAY_HOST = "http://localhost:8090";

    private String accessKey;
    private String secretKey;

    public ApiClient(String accessKey, String secretKey) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
    }

    public void setGateway_Host(String gatewayHost) {
        GATEWAY_HOST = gatewayHost;
    }

    /**
     * 生成新的请求头，里面包含accessKey，并且为了安全，使用签名密钥
     * @param body 调用接口所需要的原参数
     * @param method 调用接口所需要的method
     * @return 新的请求头
     */
    private Map<String, String> getHeaderMap(long id,String body, String method,String path,String url) {
        Map<String, String> hashMap = new HashMap<>();
        hashMap.put(APIHeaderConstant.ACCESSKEY, accessKey);
        // 接口ID
        hashMap.put(APIHeaderConstant.API_ID, String.valueOf(id));
        // 一定不能直接发送
        // hashMap.put("secretKey", secretKey);
        // 只能一次请求只能调用一次接口，用后请求作废
        hashMap.put(APIHeaderConstant.NONCE, RandomUtil.randomNumbers(4));
        // 请求一定时间内有效
        hashMap.put(APIHeaderConstant.TIMESTAMP, String.valueOf(System.currentTimeMillis() / 1000));
        // 签名
        hashMap.put(APIHeaderConstant.SIGN, getSign(body, secretKey));
        // 处理参数中文问题
        body = URLUtil.encode(body, CharsetUtil.CHARSET_UTF_8);
        hashMap.put(APIHeaderConstant.BODY, body);
        // 下面这三个是寻找调用接口的关键
        hashMap.put(APIHeaderConstant.METHOD, method);
        hashMap.put(APIHeaderConstant.PATH,path);
        hashMap.put(APIHeaderConstant.URL,url);
        return hashMap;
    }


    /**
     * 支持调用任意接口，把请求导向网关
     * @param params 接口参数
     * @param url 接口地址
     * @param method 接口使用方法
     * @return 接口调用结果
     */
    public String invokeInterface(long id,String params, String url, String method,String path)  {
        String result;
        log.info("SDK正在转发至GATEWAY_HOST:{}",GATEWAY_HOST);
        try(
                HttpResponse httpResponse = HttpRequest.post(GATEWAY_HOST + path)
                        // 处理中文编码
                        .header("Accept-Charset", CharsetUtil.UTF_8)
                        .addHeaders(getHeaderMap(id,params, method,path,url))
                        .body(params)
                        .execute())
        {
            String body = httpResponse.body();
            result=JSONUtil.formatJsonStr(body);
        }
        log.info("SDK调用接口完成，响应数据：{}",result);
        return result;
    }


    private Map<String,String> getHeaderMap(String body){
        Map<String,String> map = new HashMap<>();
        map.put("accessKey",accessKey);
        map.put("nonce", RandomUtil.randomNumbers(4));
        map.put("body",body);
        map.put("timestamp",String.valueOf(System.currentTimeMillis() / 1000));
        map.put("sign",getSign(body,secretKey));
        return map;
    }

    public String getNameByGet(String name){
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("name", name);
        String result = HttpUtil.get(GATEWAY_HOST+"/api/name/", paramMap);
        System.out.println(result);
        return result;
    }

    public String getNameByPost(String name){
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("name", name);
        String result = HttpUtil.post(GATEWAY_HOST+"/api/name/", paramMap);
        System.out.println(result);
        return result;
    }


    public String getUserNameByPost(User user){
        String json = JSONUtil.toJsonStr(user);
        HttpResponse response = HttpRequest.post(GATEWAY_HOST+"/api/name/user")
                .addHeaders(getHeaderMap(json))
                .body(json)
                .execute();
        System.out.println(response.getStatus());
        System.out.println(response.body());
        return response.body();
    }
}
