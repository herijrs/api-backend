package com.heri.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.heri.apicommon.model.entity.InterfaceInfo;

/**
* @author heri
* @description 针对表【interface_info】的数据库操作Service
* @createDate 2023-04-10 18:08:39
*/
public interface InterfaceInfoService extends IService<InterfaceInfo> {
    void validInterfaceInfo(InterfaceInfo interfaceInfo, boolean add);

}
