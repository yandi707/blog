<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="ch">

<head>
    <title>个人博客后台管理系统</title>
    <script src="../static/js/blogger/jquery.min.js"></script>
    <script src="../static/js/blogger/bootstrap.min.js"></script>
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
    <script src="../static/js/blogger/respond.min.js"></script>
    <link href="../static/css/blogger/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/common.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/slide.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/blogger/jquery.nouislider.css">
</head>

<body>

<div id="wrap">



    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">

        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>

        <div class="tab-content">

            <!-- 博文发布管理模块 -->
            <div role="tabpanel" class="tab-pane" id="blogSendManger">

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">
                            博客ID
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            标题
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                            简介
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">
                        <c:if test="${empty blogList}">
                            Null Message for more blogs.
                        </c:if>
                        <c:if test="${!empty blogList}">
                            <c:forEach items="${blogList}" var="blog">
                                <div class="row">
                                    <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}">
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                                ${blog.id}
                                        </div>
                                        <div id="topBlogSendManger" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button"
                                             data-toggle="collapse" data-parent="#accordion" href="#collapseSystem"
                                             aria-expanded="true" aria-controls="collapseOne">
                                            <span id="topBlogSendM"
                                                  class="glyphicon">${blog.title}</span>
                                        </div>
                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">${blog.summary}</div>
                                    </a>

                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <a href="${pageContext.request.contextPath}/turnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">查看</button>
                                        </a>

                                        <a href="${pageContext.request.contextPath}/turnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">通过</button>
                                        </a>

                                        <a href="${pageContext.request.contextPath}/turnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">驳回</button>
                                        </a>

                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteSourceTwo">删除
                                        </button>

                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                </div>

            </div>

</div>

    </div>

</div>



</body>

</html>