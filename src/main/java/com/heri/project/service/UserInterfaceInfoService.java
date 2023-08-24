package com.heri.project.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.heri.apicommon.model.entity.UserInterfaceInfo;
import com.heri.project.model.dto.userInterfaceInfo.UserInterfaceInfoQueryRequest;

import java.util.List;

/**
* @author heri
* @description 针对表【user_interface_info(用户调用接口关系)】的数据库操作Service
* @createDate 2023-04-13 18:44:50
*/
public interface UserInterfaceInfoService extends IService<UserInterfaceInfo> {


    void validUserInterfaceInfo(UserInterfaceInfo userInterfaceInfo, boolean add);

    QueryWrapper<UserInterfaceInfo> getQueryWrapper(UserInterfaceInfoQueryRequest userInterfaceInfoQueryRequest);

    List<UserInterfaceInfo> listTopInvokeInterfaceInfo(int limit);

    Boolean addUserInterface(UserInterfaceInfo userInterfaceInfo);


}
