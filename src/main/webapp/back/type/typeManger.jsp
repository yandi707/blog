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

            <!-- 博文类别模块 -->
            <div role="tabpanel" class="tab-pane active" id="blogType">
                <div class="check-div form-inline">
                    <div class="col-xs-3">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addBlogType">添加类型
                        </button>
                    </div>
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            类型ID
                        </div>
                        <div class="col-xs-2">
                            类型名称
                        </div>
                        <div class="col-xs-2">
                            类型排序号
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty blogTypeList}">
                            Null Message for more blogTypes.
                        </c:if>
                        <c:if test="${!empty blogTypeList}">
                            <c:forEach items="${blogTypeList}" var="blogType">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${blogType.id}
                                    </div>
                                    <div class="col-xs-2">
                                            ${blogType.typeName}
                                    </div>
                                    <div class="col-xs-2">
                                            ${blogType.orderNum}
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#reviseBlogType">
                                            修改
                                        </button>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteBlogType">
                                            删除
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                </div>

                <!--弹出添加类型窗口-->
                <div class="modal fade" id="addBlogType" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">添加类型</h4>
                            </div>

                            <form class="form-horizontal">

                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">类型名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" name="typeName"
                                                       placeholder="博文类型 *" id="typeName" required
                                                       data-validation-required-message="Please enter blog type name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi" name="orderNum"
                                                       placeholder="博文排序号 *" id="orderNum" required
                                                       data-validation-required-message="Please enter blog type order number.">
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="blogTypeCommit" class="btn btn-xs btn-green"
                                           type="button" name="blogTypeCommit" value="添加"/>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
                <!--弹出修改类型窗口-->
                <div class="modal fade" id="reviseBlogType" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">修改博客类型</h4>
                            </div>
                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">类型ID：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi" name="modifyId"
                                                       placeholder="类型ID *" id="modifyId" required
                                                       data-validation-required-message="Please enter blog type id.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">类型名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="modifyTypeName"
                                                       placeholder="类型名称 *" id="modifyTypeName" required
                                                       data-validation-required-message="Please enter blog type name.">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-xs-3 control-label">排序号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="modifyOrderNum"
                                                       placeholder="排序号 *" id="modifyOrderNum" required
                                                       data-validation-required-message="Please enter blog type order num.">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="modifyBlogTypeCommit" class="btn btn-xs btn-green"
                                           type="button" name="blogTypeCommit" value="修 改"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--弹出删除用户警告窗口-->
                <div class="modal fade" id="deleteBlogType" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteBlogTypeByName.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        删除此类型，博文也将一并删除。请输入类型名称确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteBlogTypeName" name="deleteBlogTypeName" type="text">
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

<%-- 添加博客类型 --%>
<script>
    $(function () {
        $("#blogTypeCommit").click(function () {

            var typeName = $("#typeName").val();
            var orderNum = $("#orderNum").val();

            var url = "${pageContext.request.contextPath}/addBlogType.do";
            var blogType = {
                typeName: typeName,
                orderNum: orderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blogType),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("添加博客类型成功！");
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("添加博客类型失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 修改博客类型 --%>
<script>
    $(function () {
        $("#modifyBlogTypeCommit").click(function () {

            var modifyId = $("#modifyId").val();
            var modifyTypeName = $("#modifyTypeName").val();
            var modifyOrderNum = $("#modifyOrderNum").val();

            var url = "${pageContext.request.contextPath}/modifyBlogType.do";
            var blogType = {
                id: modifyId,
                typeName: modifyTypeName,
                orderNum: modifyOrderNum
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(blogType),
                dataType: "JSON",
                success: function (result) {
                    alert("修改博客类型成功！");
                    if (result === true) {
                        window.location.href = "${pageContext.request.contextPath}/admin/manage.do";
                    } else if (result === false) {
                        alert("修改博客类型失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>


</body>

</html>