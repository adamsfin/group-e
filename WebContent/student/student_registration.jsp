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
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <c:import url="/common/base.jsp">
        <c:param name="title">
            <h1 class="toptitle"><span class="highlight">得点管理システム</span></h1>
        </c:param>
    </c:import>

    <div class="container">
        <!-- メインコンテンツ -->
        <div class="main-content">
            <section class="me-4">
                <h2 class="subtitle">学生情報登録</h2>
                <form action="scoremanager.main.StudentCreateExecute.action" method="post">
                    <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                        <div class="col-4">
                            <label class="form-label" for="student-entYear">入学年度</label>
	                        <select  class="form-control" id="student-entYear" name="entYear">
	                        	<option value="not_year">--------
	                        	<% for (int year=date.getYear()-10;year<=date.getYear()+10;year++) { %>
	                        		<option value=<%= year %>><%= year %>
	                        	<% } %>
	                        </select>
                        </div>
                        <div class="col-4">
                            <label class="form-label" for="student-id">学生番号</label>
                            <input type="text" class="form-control" id="student-id" name="id" required>
                        </div>
                        <div class="col-4">
                            <label class="form-label" for="student-name">氏名</label>
                            <input type="text" class="form-control" id="student-name" name="name" required>
                        </div>
                        <div class="col-4">
                            <label class="form-label" for="student-classNum">クラス</label>
                        	<select class="form-control" id="student-classNum" name="classNum">
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
