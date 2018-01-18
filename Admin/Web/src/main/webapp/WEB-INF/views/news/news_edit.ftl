<#import "/macro/common.ftl" as common_macro/>

<style type="text/css">
    .td1 {
        width: 100px;
        text-align: right;
        white-space: nowrap;
    }

    .td2 {
        text-align: left;
    }
</style>
<table>
    <tr>
        <td>
        <#--新闻编辑表单-->
            <form id="edit_news_form" method="post" enctype="multipart/form-data" style="border:1px solid black;">
                <input id="id" name="id" value="<#if news??>${news.id}<#else>0</#if>" type="hidden"/>
                <table>
                    <tr>
                        <td class="td1">
                            <label>新闻标题：</label>
                        </td>
                        <td class="td2" colspan="3">
                            <input id="title" name="title" class="easyui-validatebox" data-options="required:true"
                                   style="width:98%" value="${news.title!}"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="td1"><label>新闻图片：</label></td>
                        <td class="td2">
                            <input type="file" name="newsImgFile" id="newsImgFile" style="display:inline"/>
                        </td>
                        <td class="td1">
                            <label>新闻来源：</label>
                        </td>
                        <td class="td2">
                            <input id="newsource" name="newsource" class="easyui-validatebox"
                                   data-options="required:true" value="${news.newsource!}"/>
                        </td>

                    </tr>

                    <tr>
                        <td class="td1">
                            <label>新闻发布时间：</label>
                        </td>
                        <td class="td2">
                            <input id="pubdate" name="pubdate" type="text"
                                   value="${(news.pubdate?string("yyyy-MM-dd HH:mm:ss"))!}" class="easyui-datetimebox"/>
                        </td>

                        <td class="td1">
                            <label>新闻发布人：</label>
                        </td>
                        <td class="td2">
                            <input id="publisher" name="publisher" type="text" value="${news.publisher!}"
                                   data-options="required:true"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="td1"><label>新闻描述：</label></td>
                        <td class="td2" colspan="3">
                            <input name="newsContent" type="hidden"/>
                            <textarea id="content" rows="5" style="width:100%">${news.content!}</textarea>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" align="center">
                            <div id="dlg-buttons">
                                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
                                   onclick="saveOrUpdateNews()">保存</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
        <td valign="top">
        <#if news.newimgurl??>
            <img src="${news.newimgurl}" style="border:1px solid black;"/>
        </#if>
        </td>
    </tr>
</table>