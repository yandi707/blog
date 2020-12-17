<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="ch">

<head>
    <title>个人博客后台管理系统</title>

    <link href="../../static/css/blogger/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../static/css/blogger/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/blogger/slide.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/blogger/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/blogger/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/blogger/jquery.nouislider.css">
</head>

<body>

<div id="wrap">
    <%@ include file="/public/left.jsp" %>

    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">

        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>

        <div class="tab-content">
            <!-- 个人信息管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="info">
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            用户名
                        </div>
                        <div class="col-xs-2">
                            邮箱
                        </div>
                        <div class="col-xs-2">
                            地址
                        </div>
                        <div class="col-xs-2">
                            电话
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">
                        <c:if test="${empty blogger}">
                            Null Message for blogger.
                        </c:if>
                        <c:if test="${!empty blogger}">
                            <div class="row">
                                <div class="col-xs-2 ">
                                        ${blogger.username}
                                </div>
                                <div class="col-xs-2">
                                        ${blogger.email}
                                </div>
                                <div class="col-xs-2">
                                        ${blogger.address}
                                </div>
                                <div class="col-xs-2">
                                        ${blogger.phone}
                                </div>
                                <div class="col-xs-2">
                                    <button class="btn btn-success btn-xs" data-toggle="modal"
                                            data-target="#modifyBloggerInfo">
                                        修改
                                    </button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <!--弹出修改信息窗口-->
                <div class="modal fade" id="modifyBloggerInfo" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改信息</h4>
                            </div>
                            <form class="form-horizontal">

                                <div class="modal-body">

                                    <div class="container-fluid">

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">用户名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerName"
                                                       placeholder="用户名 *" id="modifyBloggerName" required
                                                       data-validation-required-message="Please enter blogger name.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">邮箱：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerEmail"
                                                       placeholder="邮箱 *" id="modifyBloggerEmail" required
                                                       data-validation-required-message="Please enter blogger email.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerAddress"
                                                       placeholder="地址 *" id="modifyBloggerAddress" required
                                                       data-validation-required-message="Please enter blogger address.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">手机号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyBloggerPhone"
                                                       placeholder="手机号 *" id="modifyBloggerPhone" required
                                                       data-validation-required-message="Please enter blogger phone.">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消
                                        </button>
                                        <input id="modifyBloggerInfoCommit" class="btn btn-xs btn-green"
                                               type="button" name="modifyBloggerInfoCommit" value="修 改"/>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<script src="../../static/js/blogger/jquery.nouislider.js"></script>
<script src="../../static/js/blogger/jquery.min.js"></script>
<script src="../../static/js/blogger/bootstrap.min.js"></script>
<script src="../../static/js/blogger/respond.min.js"></script>
<script>
    $(function () {
        $(".meun-item").click(function () {
            $(".meun-item").removeClass("meun-item-active");
            $(this).addClass("meun-item-active");
            var itmeObj = $(".meun-item").find("img");
            itmeObj.each(function () {
                var items = $(this).attr("src");
                items = items.replace("_grey.png", ".png");
                items = items.replace(".png", "_grey.png")
                $(this).attr("src", items);
            });
            var attrObj = $(this).find("img").attr("src");
            ;
            attrObj = attrObj.replace("_grey.png", ".png");
            $(this).find("img").attr("src", attrObj);
        });
        $("#topAD").click(function () {
            $("#topA").toggleClass(" glyphicon-triangle-right");
            $("#topA").toggleClass(" glyphicon-triangle-bottom");
        });
        $("#topBD").click(function () {
            $("#topB").toggleClass(" glyphicon-triangle-right");
            $("#topB").toggleClass(" glyphicon-triangle-bottom");
        });
        $("#topCD").click(function () {
            $("#topC").toggleClass(" glyphicon-triangle-right");
            $("#topC").toggleClass(" glyphicon-triangle-bottom");
        });
        $(".toggle-btn").click(function () {
            $("#leftMeun").toggleClass("show");
            $("#rightContent").toggleClass("pd0px");
        })
        $("#topBlogSendManger").click(function () {
            $("#BlogSendM").toggleClass(" glyphicon-triangle-right");
            $("#BlogSendM").toggleClass(" glyphicon-triangle-bottom");
        });
    })
</script>

<%-- 修改信息 --%>
<script>
    $(function () {
        $("#modifyBloggerInfoCommit").click(function () {

            var username = $("#modifyBloggerName").val();
            var email = $("#modifyBloggerEmail").val();
            var address = $("#modifyBloggerAddress").val();
            var phone = $("#modifyBloggerPhone").val();

            var url = "${pageContext.request.contextPath}/admin/modifyBloggerInfo.do";

            var blogger = {
                username: username,
                email: email,
                address: address,
                phone: phone
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blogger),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("修改信息成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改信息失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>



</body>

</html>