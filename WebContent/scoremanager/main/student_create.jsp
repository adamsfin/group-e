<%-- 学生登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@page import="java.util.List,java.time.LocalDate" %>

<% @SuppressWarnings("unchecked")
	List<String> classNum = (List<String>)session.getAttribute("class_num_set");
	LocalDate date = LocalDate.now(); %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生管理/新規登録</title>
</head>
<body>
    <c:import url="/common/base.jsp">
        <c:param name="title">
            <h1 class="toptitle"><span class="highlight">得点管理システム</span></h1>
        </c:param>
    </c:import>

    <%--サイドバー --%>
<link rel="stylesheet" type="text/css" href="styles.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.sidebar .score-gakusei-link').click(function() {
        $('.sidebar .score-gakusei-link .sub-menu').toggle();
    });

    $('.sidebar .score-seiseki-link').click(function() {
        $('.sidebar .score-seiseki-link .sub-menu').toggle();
    });

    $('.sidebar .score-kamoku-link').click(function() {
        $('.sidebar .score-kamoku-link .sub-menu').toggle();
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
            <li class="score-gakusei-link"><a href="#">学生管理</a>
                <ul class="sub-menu" style="display: none;">
                	<li><a href="StudentList.action">学生一覧</a></li>
                    <li><a href="StudentCreate.action">学生登録</a></li>

                </ul>
            </li>
            <li class="score-seiseki-link"><a href="#">成績管理</a>
                <ul class="sub-menu" style="display: none;">
                    <li><a href="TestRegist.action">成績登録</a></li>
                    <li><a href="TestList.action">成績参照</a></li>
                </ul>
            </li>
            <li class="score-kamoku-link"><a href="#">科目管理</a>
                <ul class="sub-menu" style="display: none;">
                	<li><a href="SubjectList.action">科目一覧</a></li>
                    <li><a href="SubjectCreate.action">科目登録</a></li>

                </ul>
            </li>
        </ul>
    </div>
</div>

    <div class="container">
        <!-- メインコンテンツ -->
        <div class="main-content">
            <section class="me-4">
                <form action="StudentCreateExecute.action" method="post">
                    <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                        <div class="col-4">
                            <label class="form-label" for="student-entYear">入学年度</label>
	                        <select  class="form-control" id="student-entYear" name="entYear">
	                        	<option value="0">--------
	                        	<% for (int year=date.getYear()-10;year<=date.getYear()+10;year++) { %>
	                        		<option value=<%= year %>><%= year %>
	                        	<% } %>
	                        </select>
	                        <div class="entYear_error">${year_error}</div>
                        </div>
                        <div class="col-4">
                            <label class="form-label" for="student-id">学生番号</label>
                            <input type="text" class="form-control" id="student-id" name="id" maxlength="10" required>
                            <div class="no_error">${no_error}</div>
                        </div>
                        <div class="col-4">
                            <label class="form-label" for="student-name">氏名</label>
                            <input type="text" class="form-control" id="student-name" name="name" maxlength="10" required>
                        </div>
                        <div class="col-4">
                            <label class="form-label" for="student-classNum">クラス</label>
                        	<select class="form-control" id="student-classNum" name="classNum" maxlength="3">
                        		<% for (String cNum:classNum) { %>
                        		<option value=<%= cNum %>><%= cNum %>
                        		<% } %>
                        	</select>
                        </div>
                        <div class="col-2 text-center">
                            <button class="btn btn-secondary" id="filter-button">登録</button>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>

    <!-- フッター -->
    <footer>
        <p>@ 2024 TIC</p>
        <p>大原学園</p>
    </footer>
</body>
</html>
