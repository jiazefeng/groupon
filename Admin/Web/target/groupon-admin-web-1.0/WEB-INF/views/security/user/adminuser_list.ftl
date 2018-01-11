<#import "/macro/search.ftl" as search_macro/>
<body>
<script type="text/javascript">
    function formatUserName(value, row) {
        if (row.userStatus == 0) {
            return '<span style="color:red;">' + value + '</span>';
        } else {
            return value;
        }
    }

    var passwordValue = '';

    function changePasswordTrStatus(type) {
        $('#passwordTr').show();
        $('#resetPasswordSwitch').show();
        $("#resetPasswordCheck").removeAttr("checked")
        passwordValue = $('#password').val();
        if (1 == type) {
            $('#resetPasswordSwitch').hide();
        } else if (2 == type) {
            $('#passwordTr').hide();
        }
    }

    function resetPassword() {
        if ($("#resetPasswordCheck").attr("checked") == "checked") {
            $('#passwordTr').show();
            $('#password').val('');
        } else {
            $('#passwordTr').hide();
            $('#password').val(passwordValue);
        }
    }
    //图片添加路径
    function img1Formatter(value, row) {
        if (value) {
            return '<img src="' + value + '" style="width:80px;height: 50px">';
        }else {
            return '<img src="${ctx}/images/ic1.png" style="width:80px;height: 50px">';
        }
    }
    function img2Formatter(value, row) {
        if (value) {
            return '<img src="' + value + '" style="width:80px;height: 50px">';
        }else {
            return '<img src="${ctx}/images/ic2.png" style="width:80px;height: 50px">';
        }
    }
</script>

<@search_macro.search2 gridId="userGrid">
<label>最后登录日期</label><input class="easyui-datebox" style="width:100px">
到<input class="easyui-datebox" style="width:100px">
<label>用户名</label><input name="search_userName">
</@search_macro.search2>

<div id="tb" style="padding:1px;height:auto">
    <div style="margin-bottom:1px">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add"
           onclick="changePasswordTrStatus(1);Dialog.OpenNew('userDialog', '新建用户', 'userForm')" plain="true">新建</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit"
           onclick="Dialog.OpenEdit('userGrid', 'userDialog', '修改用户信息', 'userForm');changePasswordTrStatus(2)"
           plain="true">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove"
           onclick="Submit.FormDeleteSubmit('userForm', 'userGrid', '${ctx}/security/adminuser/deleteAdminUser')"
           plain="true" title="将用户状态置为无效">禁用</a>
    </div>
</div>
<table id="userGrid" class="easyui-datagrid" title="用户列表"  pagination="true" rownumbers="true" fitColumns="true" idField="id"
       data-options="autoRowHeight:true,singleSelect:true,collapsible:true,url:'${ctx}/security/adminuser/listAdminUser',method:'post',toolbar:'#tb'">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th field="name" formatter="formatUserName">用户名</th>
        <th field="userName">用户姓名</th>
        <th field="phoneNum">用户手机</th>
        <th field="zidcardUrl" style="width: 80px;height: 50px;" formatter="img1Formatter">身份证-正面</th>
        <th field="fidcardUrl" style="width: 80px;height: 50px;" formatter="img2Formatter">身份证-反面</th>
        <th field="createTime" align="right" formatter="Formatter.DateTimeFormatter">创建时间</th>
        <th field="roleId" data-options="hidden:true">角色ID</th>
    </tr>
    </thead>
</table>


<div id="userDialog" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true"
     buttons="#dlg-buttons">
    <div class="ftitle">用户信息</div>
    <form id="userForm" name="userForm" method="post" novalidate>
        <input id="id" name="id" type="hidden">
        <table>
            <tr>
                <td><label>用户名</label></td>
                <td><input id="name" name="name" class="easyui-validatebox" required="true"></td>
            </tr>
            <tr id="resetPasswordSwitch">
                <td><label>重置密码</label></td>
                <td><input id="resetPasswordCheck" name="resetPasswordCheck" type="checkbox" onclick="resetPassword()">
                </td>
            </tr>
            <tr id="passwordTr">
                <td><label>密码</label></td>
                <td><input id="password" name="password" class="easyui-validatebox" required="true"></td>
            </tr>
        </table>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
       onclick="javascript:Submit.FormSubmit('userForm', 'userDialog', 'userGrid', '${ctx}/security/adminuser/addEditAdminUser')">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:Dialog.Close('userDialog')">取消</a>
</div>

</body>