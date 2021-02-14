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

            <!-- 消息接收模块 -->
            <div role="tabpanel" class="tab-pane active" id="blog">

                <div class="check-div form-inline">
                    <a href="${pageContext.request.contextPath}/new/emptyNews.do">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal">清空消息</button>
                    </a>
                </div>

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                            消息
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty blogNewList}">
                            您没有收到任何消息
                        </c:if>
                        <c:if test="${!empty blogNewList}">
                            <c:forEach items="${blogNewList}" var="blog">
                                <c:if test="${blog.newRead == '0'}">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                            您的文章《${blog.title}》审核不通过，已被驳回，驳回原因是：${blog.bhMessage}
                                        </div>

                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <a href="${pageContext.request.contextPath}/turnToRead/.do?id=${blog.id}">
                                                <button class="btn btn-success btn-xs" data-toggle="modal">设为已读</button>
                                            </a>
                                        </div>

                                    </div>
                                </c:if>
                                <c:if test="${blog.newRead == '1'}">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                            您的文章《${blog.title}》已通过审核，快去查看吧~
                                        </div>

                                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                            <a href="${pageContext.request.contextPath}/turnToRead/.do?id=${blog.id}">
                                                <button class="btn btn-success btn-xs" data-toggle="modal">设为已读</button>
                                            </a>
                                        </div>

                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
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

        /*let len = ${blogSendList};
        for(var i=1;i<len;i++){
            $("#leftId").val(i);
        }*/


    })
</script>

</body>

</html>