<#import "macro/common.ftl" as common>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/style/banner.css">
    <script>
        function addCart() {
        <#if username??>
        <#--${ctx}/settlement/${deal.skuId}-->
            window.location = ctx + '/cart';
        <#else >
            window.location = ctx + '/login';
        </#if>
        }
    </script>
</head>
<body>
<!--特效容器-->
<div class="banner comWidth clearfix" id="banner">
    <!--大图片-->
    <div class="pic banner_bar banner_big">
        <ul class="imgBox">
            <li class="first"><img src="${ctx}/images/banner/a1.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a2.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a3.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a4.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a5.png" alt="图片"></li>
        </ul>
    </div>

    <!--按钮-->
    <div class="but">
        <ul>
            <li class="first"></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>

    <!--图片导航-->
    <div class="picnav">
        <ul>
            <li class="first"><img src="${ctx}/images/banner/a1.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a2.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a3.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a4.png" alt="图片"></li>
            <li><img src="${ctx}/images/banner/a5.png" alt="图片"></li>
        </ul>
    </div>
</div>
<#if indexCategoryDealDTOs??>
    <#list indexCategoryDealDTOs as dto>
    <div class="shopTit comWidth">
        <span class="icon"></span>
        <h3>${dto.category.name}</h3>
        <a href="${ctx}/category/${dto.category.urlName}" class="more">更多&gt;&gt;</a>
    </div>
    <div class="shopList comWidth clearfix">
        <div class="leftArea">
            <div class="banner_bar banner_sm">
                <ul class="imgBox">
                    <li><a href="#"><img src="images/zaozao/20180109215945.jpg" alt="banner"></a></li>
                <#--<li><a href="#"><img src="images/banner/banner_sm_02.jpg" alt="banner"></a></li>-->
                </ul>
            <#--<div class="imgNum">-->
            <#--<a href="#" class="active"></a><a href="#"></a><a href="#"></a><a href="#"></a>-->
            <#--</div>-->
            </div>
        </div>
        <div class="rightArea">
            <#if dto.first?exists>
                <div class="shopList_top clearfix">
                    <#list dto.first as deal>
                        <div class="shop_item">
                            <div class="shop_img">
                                <a href="${ctx}/item/${deal.skuId}"><img
                                        src="${helper.getDealImageUrlForIndexDeal1List(deal)}" alt=""></a>
                            </div>
                            <h3>${deal.dealTitle}</h3>
                            <p><@common.formatPrice deal.dealPrice/></p>
                        <#--<p>${deal.dealPrice}</p>-->
                        </div>
                    </#list>
                </div>
            </#if>
            <#if dto.second?exists>
                <div class="shopList_sm clearfix">
                    <#list dto.second as deal>
                        <div class="shopItem_sm">
                            <div class="shopItem_smImg">
                                <a href="${ctx}/item/${deal.skuId}"><img
                                        src="${helper.getDealImageUrlForIndexDeal2List(deal)}" alt=""></a>
                            </div>
                            <div class="shopItem_text">
                                <p>${deal.dealTitle}</p>
                                <h3><@common.formatPrice deal.dealPrice/></h3>
                            </div>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
    </#list>
</#if>
<script src="${ctx}/js/pic.js"></script>
</body>
</html>