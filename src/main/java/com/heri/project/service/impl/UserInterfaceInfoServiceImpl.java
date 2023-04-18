package com.heri.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.heri.apicommon.model.entity.UserInterfaceInfo;
import com.heri.project.common.ErrorCode;
import com.heri.project.exception.BusinessException;
import com.heri.project.mapper.UserInterfaceInfoMapper;
import com.heri.project.service.UserInterfaceInfoService;
import org.springframework.stereotype.Service;


/**
* @author heri
* @description 针对表【user_interface_info(用户调用接口关系)】的数据库操作Service实现
* @createDate 2023-04-13 18:44:50
*/
@Service
public class UserInterfaceInfoServiceImpl extends ServiceImpl<UserInterfaceInfoMapper, UserInterfaceInfo>
    implements UserInterfaceInfoService {
    @Override
    public void validUserInterfaceInfo(UserInterfaceInfo userInterfaceInfo, boolean add) {

        if (userInterfaceInfo == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Long userId = userInterfaceInfo.getUserId();
        Long interfaceInfoId = userInterfaceInfo.getInterfaceInfoId();


        // 创建时，所有参数必须非空
        if (add) {
            if (userId <= 0 || interfaceInfoId <= 0) {
                throw new BusinessException(ErrorCode.PARAMS_ERROR,"接口或用户不存在");
            }
        }
        if (userInterfaceInfo.getLeftNum() < 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "剩余次数不能小于0");
        }
    }


}




