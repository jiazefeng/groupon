<#import "/macro/search.ftl" as search_macro/>
<body>
	<script type="text/javascript" src="${ctx}/js/news.js"></script>
	<script type="text/javascript">
		function addNews() {
			$('#news_edit_dialog').dialog({
				title: '添加新闻',
				closed: false,
				modal: true,
				cache: false,
				href: '${ctx}/news/edit/0',
				onLoad: function() {
					initNewsDetailCKEditor();
				}
			});
		}

		function updateNews() {
			var selectedNews = $("#newsListGrid").datagrid("getSelected");
			if (selectedNews) {
				$('#news_edit_dialog').dialog({
					title: '编辑新闻',
					closed: false,
					modal: true,
					cache: false,
					href: '${ctx}/news/edit/' + selectedNews.id,
					onLoad: function() {
                        initNewsDetailCKEditor();
					}
				});
			} else {
				Messager.Prompt("温馨提示", "请先选择新闻");
			}
		}

		function initNewsDetailCKEditor() {
			var editor = $('#content').ckeditor({filebrowserUploadUrl:'${ctx}/image/ckeuploadfile?module=news'}).editor;
			editor.on("instanceReady", function() {
			});
		}

	</script>
	<#--查询条件-->
	<@search_macro.search2 gridId="productListGrid">
		<div style="margin-bottom:5px;">
			<label>新闻标题:</label>
			<input name="search_title" type="text" value='${search_title}' />

			<label>发布人:</label>
            <input name="search_publisher" type="text" value='${search_publisher}' />

            <label>发布时间:</label>
            <input name="search_pubdate" type="text" value='${search_pubdate}' class="easyui-datetimebox"/>
        </div>

	</@search_macro.search2>

	<#--商品列表-->
	<div id="tb" style="padding:1px;height:auto">
		<div style="margin-bottom:1px">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" onclick="addNews();" plain="true" title="添加商品">添加新闻</a>
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-edit" onclick="updateNews();" plain="true" title="修改商品">修改新闻</a>
		</div>
	</div>
	<table id="newsListGrid" class="easyui-datagrid" title="新闻列表" pagination="true" rownumbers="true" idField="id"
			data-options="singleSelect:true,url:'${ctx}/news/getNewsList',method:'post',toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
                <th field="title">标题</th>
                <th field="publisher">发布人</th>
                <th field="pubdate" formatter="Formatter.DateTimeFormatter">发布时间</th>
                <th field="newsource">来源</th>
				<th field="routerCall" hidden="true"></th>
			</tr>
		</thead>
	</table>

	<#--商品编辑对话框-->
	<div id="news_edit_dialog" class="easyui-dialog" style="width:1024px;height:462px;" data-options="closed:true,maximizable:true"></div>

</body>