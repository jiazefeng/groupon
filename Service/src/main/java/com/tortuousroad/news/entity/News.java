package com.tortuousroad.news.entity;

import com.tortuousroad.framework.base.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class News extends BaseEntity {

    @Getter
    @Setter
    private String title;

    @Getter
    @Setter
    private String content;

    @Getter
    @Setter
    private String newimgurl;

    @Getter
    @Setter
    private Date createdate;

    @Getter
    @Setter
    private String publisher;

    @Getter
    @Setter
    private Date pubdate;

    @Getter
    @Setter
    private String newsource;

}