package com.heri.apicommon.service;

import com.heri.apicommon.model.entity.InterfaceInfo;

/**
* @author heri
* @description 针对表【interface_info】的数据库操作Service
* @createDate 2023-04-10 18:08:39
*/
public interface InnerInterfaceInfoService{

    /**
     * 数据库中查找模拟接口是否存在
     * @param path
     * @param method
     * @return
     */
    InterfaceInfo getInterfaceInfo(String path, String method);

}
