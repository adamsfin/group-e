<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String errorMg = (String)session.getAttribute("error"); %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h3>遷移先確認ページです。</h3>
<form action="tester2" method="get">
<%--input type="text" name="name"--%>
<input type="submit">
</form>
<a href="./scoremanager/main/StudentList.action">リスト</a>
<a href="./scoremanager/main/StudentCreate.action">クリエイト</a>
<a href="tester_StudentCreateAction">クリエイト2</a>
<a href="scoremanager.Login.action">ログイン</a>
<a href="./scoremanager/main/TestRegist.action">成績出力テスト</a>
<a href="./scoremanager/main/TestList.action">成績参照</a>
<a href="./scoremanager/main/SubjectList.action">科目参照</a>

<% if (errorMg!=null) { %>
    <p class="error-message"><%= errorMg %></p>
<% } %>
</body>
</html>
