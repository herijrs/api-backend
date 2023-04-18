package com.heri.project.model.dto.interfaceInfo;

import lombok.Data;

import java.io.Serializable;

/**
 * 创建请求
 *
 * @TableName product
 */
@Data
public class InterfaceInfoInvokeRequest implements Serializable {

    private Long id;

    private String userRequestParams;

    private static final long serialVersionUID = 1L;

}