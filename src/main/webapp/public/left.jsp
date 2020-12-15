
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
    <div class="meun-item meun-item" href="#blog" aria-controls="sour" role="tab" data-toggle="tab">
        <img src="/static/img/blogger/icon_source.png">博文管理
    </div>

    <%-- 博文类别管理 --%>
    <div class="meun-item" href="#blogType" aria-controls="user" role="tab" data-toggle="tab">
        <img src="/static/img/blogger/icon_user_grey.png">博文类别
    </div>

    <%-- 博文发布管理 --%>
    <%-- <div class="meun-item meun-item-active" href="#blogSendManger" aria-controls="sour" role="tab" data-toggle="tab">
         <span id="jumpSendManger"><img src="../static/img/blogger/icon_source.png">博文发布管理</span>
     </div>--%>
    <div class="meun-item meun-item-active" aria-controls="sour" role="tab">
        <a href="${pageContext.request.contextPath}/send/sendList.do"><img src="/static/img/blogger/icon_source.png">博文发布管理</a>
    </div>

    <div class="meun-title">评论</div>

    <%-- 评论管理 --%>
    <div class="meun-item" href="#comment" aria-controls="user" role="tab" data-toggle="tab">
        <img src="/static/img/blogger/icon_change_grey.png">浏览者评论
    </div>

    <%-- 回复评论 --%>
    <div class="meun-item" href="#reply" aria-controls="user" role="tab" data-toggle="tab">
        <img src="/static/img/blogger/icon_user_grey.png">回复评论
    </div>

    <div class="meun-title">第三方</div>

    <%-- 友情链接 --%>
    <div class="meun-item" href="#link" aria-controls="user" role="tab" data-toggle="tab">
        <img src="/static/img/blogger/icon_link_grey.png">友情链接
    </div>

    <div class="meun-title">个人</div>

    <%-- 个人信息 --%>
    <div class="meun-item" href="#info" aria-controls="user" role="tab" data-toggle="tab">
        <img src="/static/img/blogger/icon_chara_grey.png">个人信息
    </div>

</div>

