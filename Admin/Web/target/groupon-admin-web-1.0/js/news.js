function saveOrUpdateNews() {
    Submit.FormSubmit("edit_news_form", "news_edit_dialog", "newsListGrid", ctx + "/news/saveOrUpdateNews", null, function () {
        // 新闻描述
        $("input[name='newsContent']").val($('#content').ckeditor().editor.getData());
    });
    // $('#edit_news_form').form('submit', {
    //     url: ctx + "/news/saveOrUpdateNews",
    //     // onSubmit: function () {
    //     //     $.messager.progress({
    //     //         title: '提示',
    //     //         text: '数据处理中，请稍后....'
    //     //     });
    //     //     return true;
    //     // },
    //     success: function (data) {
    //         // $.messager.progress('close');
    //         // var data = eval('(' + data + ')');  // change the JSON string to javascript object
    //         console.log(data);
    //         if (data.statusCode == 0) {
    //             $.messager.show({
    //                 title: '成功',
    //                 msg: data.message,
    //                 timeout: 1000 * 2,
    //                 style: {
    //                     right: '',
    //                     top: document.body.scrollTop + document.documentElement.scrollTop,
    //                     bottom: ''
    //                 }
    //             });
    //             setTimeout(
    //                 function () {
    //                     $('#news_edit_dialog').dialog("close",true);
    //                     $("#newsListGrid").tree("reload");
    //                 },
    //                 1000 * 1
    //             );
    //         } else {
    //             $.messager.show({
    //                 title: '失败',
    //                 msg: data.message,
    //                 timeout: 1000 * 5
    //             });
    //         }
    //     }
    // });
    $('#news_edit_dialog').dialog("close",true);
    $( '#newsListGrid').datagrid( 'reload');
}