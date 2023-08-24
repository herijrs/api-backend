package com.heri.apicommon.constant;

/**
 * 用户常量
 *
 * @author heri
 */
public interface UserConstant {

    /**
     * 用户登录态键
     */
    String USER_LOGIN_STATE = "userLoginState";

    /**
     * 系统用户 id（虚拟用户）
     */
    long SYSTEM_USER_ID = 0;

    //  region 权限

    /**
     * 默认权限
     */
    String DEFAULT_ROLE = "user";

    /**
     * 管理员权限
     */
    String ADMIN_ROLE = "admin";

    /**
     * 被封号
     */
    String BAN_ROLE = "ban";

    //下面用于JWT存登录用户信息和解析JWT的信息
    String ID="id";

    /**
     * 用户昵称
     */
    String USERNAME="userName";

    /**
     * 用户头像
     */
    String USERAVATAR="userAvatar";

    /**
     * 用户简介
     */
    String USERPROFILE="userProfile";

    /**
     * 用户角色：user/admin/ban
     */
    String USERROLE="userRole";

    // endregion
}
