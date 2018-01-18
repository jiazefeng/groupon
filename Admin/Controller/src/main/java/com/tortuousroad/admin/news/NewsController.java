package com.tortuousroad.admin.news;

import com.tortuousroad.admin.base.controller.AjaxResult;
import com.tortuousroad.admin.base.controller.BaseAdminController;
import com.tortuousroad.framework.common.page.PagingResult;
import com.tortuousroad.framework.common.search.Search;
import com.tortuousroad.news.entity.News;
import com.tortuousroad.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by Jiazefeng on 2018/1/16.
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController extends BaseAdminController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/index")
    public String newsList() {
        return "/news/NewsList";
    }

    @RequestMapping(value = "/getNewsList", method = RequestMethod.POST)
    @ResponseBody
    public PagingResult<News> getNewsList(Search search) {
        PagingResult<News> newsPagingResult = newsService.getNewsList(search);
        return newsPagingResult;
    }

    /**
     * 新闻编辑页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editNewsWithoutHeaderAndFooter(@PathVariable Long id, Model model) {
        if (id != 0) {// 修改商品
            News news = newsService.getById(id);
            model.addAttribute("news", news);
        }
        return "/news/news_edit";
    }

    /**
     * 新建/保存新闻信息
     *
     * @return
     */
    @RequestMapping(value = "/saveOrUpdateNews", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveOrUpdateNews(News news, String newsContent, MultipartFile newsImgFile) {
        Long newsId = news.getId();
        news.setContent(newsContent);
        if (null == news || 0 == newsId) {//新建新闻
            //复制商品时不用必须上传图片,所以可能会出现dealImgFile为空但是imageId不为空
            byte[] newsImgBytes = null;
            if (newsImgFile.isEmpty() && newsImgFile.getSize() <= 0) {
                return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_ERROR, "请选择商品图片");
            }
            boolean saveNewsSuccess = false;
            try {
                newsImgBytes = newsImgFile.getBytes();
                saveNewsSuccess = newsService.saveNews(news, newsImgBytes);
            } catch (IOException e) {
                return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_ERROR, "新闻保存失败, 读取图片错误");
            }
            if (saveNewsSuccess) {
                return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_SUCCESS, "新闻保存成功");
            } else {
                return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_ERROR, "新闻保存失败");
            }
        } else {//更新商品
            byte[] newsImgBytes = null;
            if (!newsImgFile.isEmpty() && newsImgFile.getSize() > 0) {
                try {
                    newsImgBytes = newsImgFile.getBytes();
                } catch (IOException e) {
                    return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_ERROR, "新闻更新失败, 读取图片错误");
                }
            }
            boolean updateNewsSuccess = newsService.updateNews(news, newsImgBytes);
            if (updateNewsSuccess) {
                return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_SUCCESS, "新闻更新成功");
            } else {
                return new AjaxResult(AjaxResult.AJAX_STATUS_CODE_ERROR, "新闻更新失败");
            }
        }
    }
}
