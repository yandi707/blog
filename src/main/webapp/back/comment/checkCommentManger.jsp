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


            <!-- 浏览者评论模块 -->
            <div role="tabpanel" class="tab-pane active" id="comment">

                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-2 ">
                            评论ID
                        </div>
                        <div class="col-xs-2">
                            昵称
                        </div>
                        <div class="col-xs-2">
                            内容 & 时间
                        </div>
                        <div class="col-xs-2">
                            邮箱
                        </div>
                        <div class="col-xs-2">
                            评论博文
                        </div>
                        <div class="col-xs-2">
                            操作
                        </div>
                    </div>

                    <div class="tablebody">
                        <c:if test="${empty checkCommentList}">
                            Null Message for more comments.
                        </c:if>
                        <c:if test="${!empty checkCommentList}">
                            <c:forEach items="${checkCommentList}" var="comment">
                                <div class="row">
                                    <div class="col-xs-2 ">
                                            ${comment.id}
                                    </div>
                                    <div class="col-xs-2">
                                            ${comment.name}
                                    </div>
                                    <div class="col-xs-2" title="${comment.commentDate}">
                                            ${comment.content}
                                    </div>
                                    <div class="col-xs-2">
                                            ${comment.email}
                                    </div>
                                    <div class="col-xs-2">
                                        <a href="${pageContext.request.contextPath}/blog/.do?id=${comment.blog_id}">
                                                ${comment.blogTitle}
                                        </a>
                                    </div>
                                    <div class="col-xs-2">
                                        <button class="btn btn-success btn-xs" data-toggle="modal"
                                                data-target="#sendCommentEmail">
                                            发送邮件
                                        </button>
                                        <a href="${pageContext.request.contextPath}/passComment/pass/.do?id=${comment.id}">
                                            <button class="btn btn-success btn-xs" data-toggle="modal">通过</button>
                                        </a>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal"
                                                data-target="#deleteComment">
                                            删除
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>

                <!--弹出发送邮件窗口-->
                <div class="modal fade" id="sendCommentEmail" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h5 class="modal-title">向评论者发送邮件</h5>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">评论ID：</label>
                                            <div class="col-xs-8 ">
                                                <input type="number" class="form-control input-sm duiqi"
                                                       name="commentId"
                                                       placeholder="评论ID *" id="commentId" required
                                                       data-validation-required-message="Please enter comment id.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">邮件标题：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi"
                                                       name="commentEmailSubject"
                                                       placeholder="邮件标题 *" id="commentEmailSubject" required
                                                       data-validation-required-message="Please enter email subject.">
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-xs-3 control-label">邮件内容：</label>
                                            <div class="col-xs-8 ">
                                                <textarea type="text" class="form-control input-sm duiqi"
                                                          name="commentEmailMessage"
                                                          placeholder="邮件内容 *" id="commentEmailMessage" required
                                                          data-validation-required-message="Please enter email content."></textarea>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendCommentEmailBtn" class="btn btn-xs btn-green"
                                           type="button" name="sendCommentEmailBtn" value="发 送"/>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <!--弹出删除评论警告窗口-->
                <div class="modal fade" id="deleteComment" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">

                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">提示</h4>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;确定要删除该评论？输入评论ID确认：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input id="deleteCommentId" name="deleteCommentId" type="number">
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendCommentDeleteBtn" class="btn  btn-xs btn-danger"
                                           type="button" name="sendCommentDeleteBtn" value="删 除"/>
                                </div>
                            </form>


                        </div>

                    </div>
                </div>

                <!--弹出回复评论内容窗口-->
                <div class="modal fade" id="sendCommentReply" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">

                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">回复评论</h4>
                            </div>

                            <form class="form-horizontal">
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入回复的评论ID：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="replyCommentId" name="replyCommentId" type="number"/><br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;输入回复的内容：<br><br>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea id="replyContent" name="replyContent" type="text"></textarea>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    <input id="sendCommentReplyBtn" class="btn  btn-xs btn-danger"
                                           type="button" name="sendCommentReplyBtn" value="确 定"/>
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


<%-- 提交发送邮件 --%>
<script>
    $(function () {
        $("#sendCommentEmailBtn").click(function () {

            var commentId = $("#commentId").val();
            var subject = $("#commentEmailSubject").val();
            var message = $("#commentEmailMessage").val();

            var url = "${pageContext.request.contextPath}/sendCommentEmail.do";
            var email = {
                commentId: commentId,
                subject: subject,
                message: message
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(email),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("向评论者发送邮件成功！");
                        window.location.href = "${pageContext.request.contextPath}/checkComment/checkCommentList.do";
                    } else if (result === false) {
                        alert("向评论者发送邮件失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交删除评论 --%>
<script>
    $(function () {
        $("#sendCommentDeleteBtn").click(function () {

            var id = $("#deleteCommentId").val();
            var url = "${pageContext.request.contextPath}/deleteCommentById.do";
            var comment = {
                id: id
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(comment),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("删除评论成功！");
                        window.location.href = "${pageContext.request.contextPath}/checkComment/checkCommentList.do";
                    } else if (result === false) {
                        alert("删除评论失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交回复评论 --%>
<script>
    $(function () {
        $("#sendCommentReplyBtn").click(function () {

            var content = $("#replyContent").val();
            var commentId = $("#replyCommentId").val();

            var url = "${pageContext.request.contextPath}/replyComment.do";

            var reply = {
                content: content,
                commentId: commentId
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(reply),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("回复评论成功！");
                        window.location.href = "${pageContext.request.contextPath}/checkComment/checkCommentList.do";
                    } else if (result === false) {
                        alert("回复评论失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>
<%-- 提交删除回复 --%>
<script>
    $(function () {
        $("#sendReplyDeleteBtn").click(function () {

            var id = $("#deleteReplyId").val();
            var url = "${pageContext.request.contextPath}/deleteReplyById.do";
            var reply = {
                id: id
            };

            $.ajax({
                url: url,
                contentType: "application/json",
                type: "POST",
                data: JSON.stringify(reply),
                dataType: "JSON",
                success: function (result) {
                    if (result === true) {
                        alert("删除回复成功！");
                        window.location.href = "${pageContext.request.contextPath}/checkComment/checkCommentList.do";
                    } else if (result === false) {
                        alert("删除回复失败！");
                        location.reload();
                    }
                }
            })

        })
    })
</script>

</body>

</html>