<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html lang="ch">

<head>
    <title>个人博客后台管理系统</title>
    <link href="/static/css/blogger/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/static/css/blogger/common.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/blogger/slide.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/blogger/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/blogger/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/blogger/jquery.nouislider.css">
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

            <%-- 分界线 --%>
            <!-- 博文发布管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="blogSendManger">

                <%--<div class="check-div form-inline">
                    <a href="${pageContext.request.contextPath}/add/compose.do">
                        <button class="btn btn-yellow btn-xs" data-toggle="modal">添加博客</button>
                    </a>
                </div>--%>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">
                            文章ID
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
                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1" id="blogId">
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
                                        <a href="${pageContext.request.contextPath}/send/sendTurnToEdit/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">查看</button>
                                        </a>

                                        <a href="${pageContext.request.contextPath}/send/pass/.do?id=${blog.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">通过</button>
                                        </a>

                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#bhReason" data-whatever="${blog.id}">驳回
                                        </button>

                                        <%--<button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteSourceTwo">删除
                                        </button>--%>

                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                </div>

                <!--弹出删除博客警告窗口-->
                <div class="modal fade" id="deleteSourceTwo" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="hintTwo">提示</h4>
                            </div>

                            <form action="${pageContext.request.contextPath}/deleteBlogByTitle.do" method="post">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        删除该博文，评论也将一并删除。请输入博客标题确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteTitleTwo" name="deleteTitle" type="text">
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

                    <!--驳回发送消息-->
                    <div class="modal fade" id="bhReason" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="hintthree">驳回</h4>
                                    </div>

                                    <form action="${pageContext.request.contextPath}/send/bhOperate.do" method="post">
                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                请输入您的驳回理由：<br><br>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input id="bhId" name="bhId" type="hidden" value="">
                                                <input id="bhMessage" name="bhMessage" type="text">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input class="btn btn-xs btn-danger" type="submit" value="驳回" id="bh"/>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>

            </div>







            </div>

        </div>

    </div>

</div>

<script src="/static/js/blogger/jquery.nouislider.js"></script>
<script src="/static/js/blogger/jquery.min.js"></script>
<script src="/static/js/blogger/bootstrap.min.js"></script>
<script src="/static/js/blogger/respond.min.js"></script>
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



    $('#bhReason').on('show.bs.modal', function (event) {
        $("textarea[name = refuseTextareaContext]").innerHTML = "";
        var btnThis = $(event.relatedTarget); //触发事件的按钮
        var modal = $(this);  //当前模态框
        var modalId = btnThis.data('whatever');   //解析出data-id的内容
        currentDataId = btnThis.closest('tr').find('td').eq(0).text();//获取某一列的内容eq后面表示列数
        //$("#aa").val(currentDataId);
        console.log(modalId);
        $("#bhId").val(modalId);
    });



</script>

</body>

</html>