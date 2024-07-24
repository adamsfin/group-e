<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">得点管理システム</h1>
    </c:param>
</c:import>

<%--サイドバー --%>
<link rel="stylesheet" type="text/css" href="styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

    $('.sidebar .score-seiseki-link').click(function() {
        $('.sidebar .score-seiseki-link .sub-menu').toggle();
    });

});
</script>

<div class="container">
<!-- メニュー見出し -->
<h2 class="h3">メニュー</h2>
    <!-- サイドバー -->
    <div class="sidebar">
        <ul>
        <li><a href="menu.jsp">メニュー</a></li>
            <li class="score-gakusei-link">
            	<a href="StudentList.action">学生管理</a>
            </li>
            <li class="score-seiseki-link"><a href="#">成績</a>
                <ul class="sub-menu" style="display: none;">
                	<li><a href="#">成績管理</a></li>
                    <li><a href="TestRegist.action">成績登録</a></li>
                    <li><a href="TestList.action">成績参照</a></li>
                </ul>
            </li>
            <li class="score-kamoku-link">
            	<a href="SubjectList.action">科目管理</a>
            </li>
        </ul>
    </div>
</div>



    <!-- メニュー -->
    <div class="menu">
        <div class="menu-item student-management">
            <a href="StudentList.action">学生管理</a>
        </div>
        <div class="menu-item score-management">
            <a href="TestList.action">成績管理</a>
        </div>
        <div class="menu-item subject-management">
            <a href="SubjectList.action">科目管理</a>
        </div>
    </div>

<!-- フッター -->
<footer>
    <p>© 2024 TIC 大原学園</p>
</footer>
