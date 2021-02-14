
<%@ page language="java" pageEncoding="UTF-8" %>
<!-- 左侧菜单栏目块 -->
<div class="leftMeun" id="leftMeun">

    <div id="logoDiv">
        <p id="logoP"><img id="logo" alt="TCGR后台管理系统" src="/static/img/blogger/logo.png"></p>
    </div>

    <div id="personInfor">
        <p id="blogger">yandi</p>
        <p><span>1337991430@qq.com</span></p>
        <p>
            <a href="${pageContext.request.contextPath}/back/login.jsp">退出登录</a>
        </p>
    </div>

    <div class="meun-title">博客</div>

    <%-- 博文管理 --%>
    <div class="meun-item " aria-controls="sour" role="tab">
        <a href="${pageContext.request.contextPath}/my/getOneselfList.do"> <img src="/static/img/blogger/icon_source.png">博文管理</a>
    </div>

    <%-- 博文类别管理 --%>
    <div class="meun-item " aria-controls="user" role="tab">
        <a href="${pageContext.request.contextPath}/wz/typeList.do"><img src="/static/img/blogger/icon_user_grey.png">博文类别</a>
    </div>

    <%-- 博文发布管理 --%>
    <%-- <div class="meun-item meun-item-active" href="#blogSendManger" aria-controls="sour" role="tab" data-toggle="tab">
         <span id="jumpSendManger"><img src="../static/img/blogger/icon_source.png">博文发布管理</span>
     </div>--%>
    <div class="meun-item " aria-controls="sour" role="tab">
        <a href="${pageContext.request.contextPath}/send/sendList.do"><img src="/static/img/blogger/icon_source.png">文章审核</a>
    </div>

    <div class="meun-title">评论</div>

    <%-- 评论管理 --%>
    <div class="meun-item " aria-controls="sour" role="tab">
        <a href="${pageContext.request.contextPath}/pl/commentList.do"> <img src="/static/img/blogger/icon_change_grey.png">浏览者评论</a>
    </div>

    <%-- 回复评论 --%>
    <div class="meun-item" aria-controls="user" role="tab" >
        <a href="${pageContext.request.contextPath}/hf/replyList.do"><img src="/static/img/blogger/icon_user_grey.png">回复评论</a>
    </div>
    <%--审核评论--%>
    <div class="meun-item " aria-controls="sour" role="tab">
        <a href="${pageContext.request.contextPath}/checkComment/checkCommentList.do"> <img src="/static/img/blogger/icon_change_grey.png">评论审核</a>
    </div>

    <div class="meun-title">第三方</div>

    <%-- 友情链接 --%>
    <div class="meun-item" aria-controls="user" role="tab" >
        <a href="${pageContext.request.contextPath}/lj/linkList.do"> <img src="/static/img/blogger/icon_link_grey.png">友情链接</a>
    </div>

    <div class="meun-title">个人</div>

    <%-- 消息接收 --%>
    <div class="meun-item" aria-controls="user" role="tab">
        <a href="${pageContext.request.contextPath}/new/newList.do"> <img src="/static/img/blogger/icon_chara_grey.png">消息接收(<span id="newNumber"></span>)</a>
    </div>
    <%-- 个人信息 --%>
    <div class="meun-item" aria-controls="user" role="tab">
        <a href="${pageContext.request.contextPath}/gr/informationList.do"> <img src="/static/img/blogger/icon_chara_grey.png">个人信息</a>

    </div>

</div>
<head>
    <script src="../static/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/new/newNumber.do",
                type:"GET",
                success:function (res) {
                    document.getElementById("newNumber").innerHTML = res;
                }
            })
        })
    </script>
</head>
