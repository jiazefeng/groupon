package com.tortuousroad.news.dao;


import java.util.List;

import com.tortuousroad.framework.common.page.PagingResult;
import com.tortuousroad.framework.common.persistence.BaseMybatisDAO;
import com.tortuousroad.framework.common.search.Search;
import com.tortuousroad.news.entity.News;
import org.springframework.stereotype.Repository;

@Repository
public class NewsMapper extends BaseMybatisDAO {
    private final String MAPPER_NAMESPACE = "com.tortuousroad.news.entity.NewsMapper";

    /**
     * 分页获取
     *
     * @param search
     * @return
     */
    public PagingResult<News> getPageNews(Search search) {
        return this.findForPage(MAPPER_NAMESPACE + ".countPageNews", MAPPER_NAMESPACE + ".selectPageNews", search);
    }

    public News getById(Long id) {
        if (id == null) {
            return new News();
        }
        return this.findOne(MAPPER_NAMESPACE + ".selectByPrimaryKey", id);
    }

    public int saveNews(News news) {
        return this.save(MAPPER_NAMESPACE + ".insertSelective", news);
    }

    public int updateById(News news) {
        return this.update(MAPPER_NAMESPACE + ".updateByPrimaryKeySelective", news);
    }
}