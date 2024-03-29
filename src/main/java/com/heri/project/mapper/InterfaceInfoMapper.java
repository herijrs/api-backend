package com.heri.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.heri.apicommon.model.entity.InterfaceInfo;

import java.util.Date;
import java.util.List;

/**
* @author heri
* @description 针对表【interface_info】的数据库操作Mapper
* @createDate 2023-04-10 18:08:39
* @Entity com.heri.project.model.entity.InterfaceInfo
*/
public interface InterfaceInfoMapper extends BaseMapper<InterfaceInfo> {
    /**
     * 查询接口列表，排除已经删除的，接口开启的，
     * 要求：更新时间大于10天小于30天内的
     */
    List<InterfaceInfo> listInterfaceInfoWithDelete(Date tenDaysAgoDate);

}




