package com.tortuousroad.admin.security.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tortuousroad.framework.base.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;

/**
 * 后台用户
 */
public class AdminUser extends BaseEntity {

    //用户名称
    @Getter
    @Setter
    private String name;

    //用户密码
    @Getter
    @Setter
    private String password;

    //最后登录时间
    @Getter
    @Setter
    private Date createTime;

    // 最后登录ip
    @Getter
    @Setter
    private Date updateTime;
    //用户姓名
    @Getter
    @Setter
    private String userName;
    //用户手机
    @Getter
    @Setter
    private String phoneNum;
    //用户头像URL
    @Getter
    @Setter
    private String logoUrl;
    //身份证正面URL
    @Getter
    @Setter
    private String zIdcardUrl;

    //身份证反面URL
    @Getter
    @Setter
    private String fIdcardUrl;
    //状态
    @Getter
    @Setter
    private String state;
    //拥有能访问的资源
    @Getter
    @Setter
    private List<AdminUserRole> adminUserRoles = new ArrayList<>();

}
