<%@page contentType="text/html" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stephanie's Blog</title>

    <!-- Bootstrap Core CSS -->
    <link href="../static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional fonts for this theme -->
    <link href="../static/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this theme -->
    <link href="../static/css/clean-blog.min.css" rel="stylesheet">

    <!-- Temporary navbar container fix until Bootstrap 4 is patched -->
    <style>
        .navbar-toggler {
            z-index: 1;
        }

        @media (max-width: 576px) {
            nav > .container {
                width: 100%;
            }
        }
    </style>

</head>

<body>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-toggleable-md navbar-light" id="mainNav">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsivze" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu <i class="fa fa-bars"></i>
        </button>
        <a class="navbar-brand page-scroll" href="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5">
            check the weather ;)</a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="index.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll"
                       href="${pageContext.request.contextPath}/defaultBlogType.do">TYPES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${pageContext.request.contextPath}/about.do">BLOGGER</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="../fore/contact.jsp">CONTACT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="../fore/search.jsp">SEARCH</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="../back/login.jsp">LOGIN</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<header class="intro-header" style="background-image: url('/static/img/home-bg.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <div class="site-heading">
                    <h1>Stephanie's Blog</h1>
                    <span class="subheading">基于SSM框架的个人博客系统</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
            <c:if test="${empty blogList}">
                Null Message for more blog.
            </c:if>
            <c:if test="${!empty blogList}">
                <c:forEach items="${blogList}" var="blog">
                    <div class="post-preview">
                        <a href="${pageContext.request.contextPath}/blog/.do?id=${blog.id}">
                            <h2 class="post-title">
                                    ${blog.title}
                            </h2>
                            <br>
                            <h3 class="post-subtitle">
                                    ${blog.summary}
                            </h3>
                        </a>
                        <p class="post-meta">Posted by <a href="${pageContext.request.contextPath}/about.do">Stephanie</a> ${blog.releaseDate}</p>
                    </div>
                    <hr>
                </c:forEach>

                <!-- Pager -->
                <div class="clearfix">
                    <a class="btn btn-secondary float-right" href="${pageContext.request.contextPath}/setPage.do">More
                        Blogs
                        &rarr;</a>
                </div>
            </c:if>
        </div>
    </div>
</div>

<hr>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <ul class="list-inline text-center">
                    <li class="list-inline-item">
                        <a href="https://blog.csdn.net/Stephanie17395">
    <span class="fa-stack fa-lg">
    <i class="fa fa-circle fa-stack-2x"></i>
    <i class="fa fa-stack-1x fa-inverse">C</i>
    </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://www.zhihu.com/people/stephanie7396/activities">
    <span class="fa-stack fa-lg">
    <i class="fa fa-circle fa-stack-2x"></i>
    <i class="fa fa-stack-1x fa-inverse">知</i>
    </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://github.com/StephaineWYT">
    <span class="fa-stack fa-lg">
    <i class="fa fa-circle fa-stack-2x"></i>
    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
    </span>
                        </a>
                    </li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; all rights reserved 2019. Stephanie Went</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery Version 3.1.1 -->
<script src="../static/lib/jquery/jquery.js"></script>

<!-- Tether -->
<script src="../static/lib/tether/tether.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../static/lib/bootstrap/js/bootstrap.min.js"></script>

<!-- Theme JavaScript -->
<script src="../static/js/clean-blog.min.js"></script>

</body>

</html>
