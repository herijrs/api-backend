package com.heri.apicommon.service;

import com.heri.apicommon.model.entity.User;

public interface InnerUserService{

    /**
     * 数据库中查找是否分配给用户 ak sk
     * @param accessKey
     * @return
     */
    User getInvokeUser(String accessKey);

}
