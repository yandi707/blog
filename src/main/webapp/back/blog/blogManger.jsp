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

            <!-- 博文管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="blog">

                <div class="check-div form-inline">
                    <a href="${pageContext.request.contextPath}/add/compose.do">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal">添加博客</button>
                    </a>
                </div>

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">
                            博客ID
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            标题
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            简介
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            状态
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty blogSendList}">
                            Null Message for more blogs.
                        </c:if>
                        <c:if test="${!empty blogSendList}">
                            <c:forEach items="${blogSendList}" var="blog">
                                <div class="row">
                                    <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                                ${blog.id}
                                        </div>
                                        <div id="topAD" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button"
                                             data-toggle="collapse" data-parent="#accordion" href="#collapseSystem"
                                             aria-expanded="true" aria-controls="collapseOne">
                                            <span id="topA"
                                                  class="glyphicon">${blog.title}</span>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${blog.summary}</div>
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${blog.shType}</div>
                                    </a>

                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <a href="${pageContext.request.contextPath}/turnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">修改</button>
                                        </a>

                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteSource">删除
                                        </button>

                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty blogSendList}">
                            Null Message for more blogs.
                        </c:if>
                        <c:if test="${!empty blogSendList}">
                            <c:forEach items="${blogSendList}" var="blog">
                                <div class="row">
                                    <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                                ${blog.id}
                                        </div>
                                        <div id="topAdD" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button"
                                             data-toggle="collapse" data-parent="#accordion" href="#collapseSystem"
                                             aria-expanded="true" aria-controls="collapseOne">
                                            <span id="topdA"
                                                  class="glyphicon">${blog.title}</span>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${blog.summary}</div>

                                    </a>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${blog.shType}</div>

                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <a href="${pageContext.request.contextPath}/turnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">修改</button>
                                        </a>

                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteSource">删除
                                        </button>

                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                </div>

                <!--弹出删除博客警告窗口-->
                <div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="hint">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteBlogByTitle.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        删除该博文，评论也将一并删除。请输入博客标题确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteTitle" name="deleteTitle" type="text">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input class="btn btn-xs btn-danger" type="submit" value="确定删除"/>
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

</body>

</html>