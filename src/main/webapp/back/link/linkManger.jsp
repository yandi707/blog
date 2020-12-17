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

            <!-- 友情链接管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="link">

                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addLink">添加链接</button>
                    </div>
                </div>

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            链接ID
                        </div>
                        <div class="col-xs-2">
                            链接名称
                        </div>
                        <div class="col-xs-2">
                            链接URL
                        </div>
                        <div class="col-xs-2">
                            排序号
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">

                        <c:if test="${empty linkList}">
                            Null Message for more link.
                        </c:if>
                        <c:if test="${!empty linkList}">
                            <c:forEach items="${linkList}" var="link">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${link.id}
                                    </div>
                                    <div class="col-xs-2">
                                            ${link.linkName}
                                    </div>
                                    <div class="col-xs-2">
                                            ${link.linkUrl}
                                    </div>
                                    <div class="col-xs-2">
                                            ${link.orderNum}
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#modifyLink">
                                            修 改
                                        </button>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteLink">
                                            删 除
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                    </div>
                </div>

                <!--弹出添加链接窗口-->
                <div class="modal fade" id="addLink" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">添加链接</h4>
                            </div>

                            <form class="form-horizontal">

                                <div class="modal-body">

                                    <div class="container-fluid">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">链接名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="addLinkName"
                                                       placeholder="链接名称 *" id="addLinkName" required
                                                       data-validation-required-message="Please enter link name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">链接URL：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" name="addLinkUrl"
                                                       placeholder="链接URL *" id="addLinkUrl" required
                                                       data-validation-required-message="Please enter link url.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="linkOrderNum"
                                                       placeholder="排序号 *" id="addLinkOrderNum" required
                                                       data-validation-required-message="Please enter link order num.">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消
                                        </button>
                                        <input id="addLinkCommit" class="btn btn-xs btn-green"
                                               type="button" name="addLinkCommit" value="添 加"/>
                                    </div>


                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <!--弹出修改链接窗口-->
                <div class="modal fade" id="modifyLink" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改链接</h4>
                            </div>
                            <form class="form-horizontal">

                                <div class="modal-body">

                                    <div class="container-fluid">

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">链接ID：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="modifyLinkId"
                                                       placeholder="链接ID *" id="modifyLinkId" required
                                                       data-validation-required-message="Please enter link id.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">链接名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyLinkName"
                                                       placeholder="链接名称 *" id="modifyLinkName" required
                                                       data-validation-required-message="Please enter link name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">链接URL：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyLinkUrl"
                                                       placeholder="链接URL *" id="modifyLinkUrl" required
                                                       data-validation-required-message="Please enter link url.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="modifyLinkOrderNum"
                                                       placeholder="排序号 *" id="modifyLinkOrderNum" required
                                                       data-validation-required-message="Please enter link order num.">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消
                                        </button>
                                        <input id="modifyLinkCommit" class="btn btn-xs btn-green"
                                               type="button" name="modifyLinkCommit" value="修 改"/>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--弹出删除链接警告窗口-->
                <div class="modal fade" id="deleteLink" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteLinkById.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除此链接请输入链接ID确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteLinkId" name="deleteLinkId" type="number">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input class="btn  btn-xs btn-danger" type="submit" value="确认删除"/>
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
<%-- 添加链接 --%>
<script>
    $(function () {
        $("#addLinkCommit").click(function () {

            var linkName = $("#addLinkName").val();
            var linkUrl = $("#addLinkUrl").val();
            var linkOrderNum = $("#addLinkOrderNum").val();

            var url = "${pageContext.request.contextPath}/addLink.do";

            var link = {
                linkName: linkName,
                linkUrl: linkUrl,
                orderNum: linkOrderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(link),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("添加链接成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("添加链接失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 修改链接 --%>
<script>
    $(function () {
        $("#modifyLinkCommit").click(function () {

            var id = $("#modifyLinkId").val();
            var linkName = $("#modifyLinkName").val();
            var linkUrl = $("#modifyLinkUrl").val();
            var linkOrderNum = $("#modifyLinkOrderNum").val();

            var url = "${pageContext.request.contextPath}/modifyLink.do";

            var link = {
                id: id,
                linkName: linkName,
                linkUrl: linkUrl,
                orderNum: linkOrderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(link),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("修改链接成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改链接失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>

</body>

</html>