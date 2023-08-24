package com.heri.apicommon.service;

import com.heri.apicommon.model.entity.InterfaceInfo;

/**
* @author heri
* @description 针对表【interface_info】的数据库操作Service
* @createDate 2023-04-10 18:08:39
*/
public interface InnerInterfaceInfoService{

    /**
     * 从数据库中查询模拟接口是否存在（请求路径、请求方法、请求参数）
     *
     * @return InterfaceInfo 接口信息
     */
    InterfaceInfo getInterfaceInfo(long id,String url, String method,String path);


}
