package com.tortuousroad.news.service;

import com.tortuousroad.common.constant.GlobalConstant;
import com.tortuousroad.framework.common.page.PagingResult;
import com.tortuousroad.framework.common.search.Search;
import com.tortuousroad.framework.util.DateUtil;
import com.tortuousroad.framework.util.image.ImageUtil;
import com.tortuousroad.groupon.deal.constant.DealConstant;
import com.tortuousroad.news.dao.NewsMapper;
import com.tortuousroad.news.entity.News;
import com.tortuousroad.support.image.entity.ImageInfo;
import com.tortuousroad.support.image.service.ImageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Jiazefeng on 2018/1/16.
 */
@Service
public class NewsService {
    private static final Logger logger = LoggerFactory.getLogger(NewsService.class);
    @Autowired
    private NewsMapper newsMapper;
    @Autowired
    private ImageService imageService;

    public PagingResult<News> getNewsList(Search search) {
        if (search == null) {
            return null;
        }
        PagingResult<News> pageNews = newsMapper.getPageNews(search);
        return pageNews;
    }

    public News getById(Long id) {
        if (id == null) {
            return new News();
        }
        News news = newsMapper.getById(id);
        return news;
    }

    public boolean saveNews(News news, byte[] newsImgBytes) {
        if (news == null) {
            return false;
        }
        if (null != newsImgBytes && newsImgBytes.length > 0) {
            Long imageId = uploadDealImage(newsImgBytes);
            if (null == imageId || 0 == imageId) {
                logger.info("保存新闻图片失败!");
                return false;
            }
            String imagePath = getObjectImageUrl(imageId, DealConstant.PICTURE_MODULE_NEWS, 1);
            news.setNewimgurl(imagePath);
        }
        if (null == news.getPubdate()) {//如果发布时间为空
            news.setPubdate(DateUtil.getDefaultDateTime());
        }
        news.setCreatedate(new Date());
        int effectRows = newsMapper.saveNews(news);
        if (0 == effectRows) {
            logger.info("新建新闻, 新闻信息保存失败!");
            return false;
        }
        return true;
    }

    /**
     * 上传商品图片
     *
     * @param imgBytes 图片数据
     * @return
     */
    public Long uploadDealImage(byte[] imgBytes) {
        FileOutputStream fos = null;
        long imgId = 0;
        try {
            String sourceFileAbsolutePath = "";// 图片文件绝对路径
            String sourceFileRelativePath = "";// 图片文件相对路径
            ImageInfo image = new ImageInfo();// 将图片信息存入数据库
            imgId = imageService.addImage(image);
            if (imgId > 0) {
                sourceFileAbsolutePath = ImageUtil.getImageSourceFileAbsolutePath(imgId);
                sourceFileRelativePath = ImageUtil.getImageSourceFileRelativePath(imgId);
                File sourceFileDir = new File(sourceFileAbsolutePath).getParentFile();// 将图片写入硬盘
                if (!sourceFileDir.exists()) {// 若图片源文件夹不存在则新建
                    sourceFileDir.mkdirs();
                }
                fos = new FileOutputStream(sourceFileAbsolutePath);
                fos.write(imgBytes);
                fos.flush();
                logger.info("上传商品图片[id=" + imgId + "]到目录：" + sourceFileAbsolutePath);
                ImageUtil.generateImage(DealConstant.PICTURE_MODULE_NEWS, imgId, sourceFileAbsolutePath);//生成各个尺寸的图片
                HashMap<String, String> imageInfo = ImageUtil.getBaseInfo(sourceFileAbsolutePath);// 完善图片信息
                image.setId(imgId);
                image.setHeight(Integer.valueOf(imageInfo.get("Height")));
                image.setWidth(Integer.valueOf(imageInfo.get("Width")));
                image.setSourcePath(sourceFileRelativePath);
                imageService.updateImage(image);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                }
            }
        }
        return imgId;
    }

    /**
     * 获取图片URL
     *
     * @param imageId           图片ID
     * @param moduleName        模块名称，如：deal
     * @param imageConfigNumber 详见image.properties
     * @return
     */
    protected String getObjectImageUrl(long imageId, String moduleName, int imageConfigNumber) {
        return ImageUtil.getImageUrl(GlobalConstant.IMAGE_DOMAIN + "/images/", imageId, moduleName, imageConfigNumber);
    }

    public boolean updateNews(News news, byte[] newsImgBytes) {
        if (news == null) {
            return false;
        }
        if (null != newsImgBytes && newsImgBytes.length > 0) {
            Long imageId = uploadDealImage(newsImgBytes);
            if (null == imageId || 0 == imageId) {
                logger.info("保存新闻图片失败!");
                return false;
            }
            String imagePath = getObjectImageUrl(imageId, DealConstant.PICTURE_MODULE_NEWS, 1);
            news.setNewimgurl(imagePath);
        }
        if (null == news.getPubdate()) {//如果发布时间为空
            news.setPubdate(DateUtil.getDefaultDateTime());
        }
        int effectRows = newsMapper.updateById(news);
        if (0 == effectRows) {
            logger.info("更新新闻[id={}]信息失败!", news.getId());
            return false;
        }
        return true;
    }
}
