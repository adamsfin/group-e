<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.kyoutuu.jsp">
	<c:param name="title">
		<h3>エラーが発生しました</h3>
	</c:param>
	<c:param name="scripts"></c:param>

	<c:param name="content">
		<h2>ログアウトされました。</h2>
		<h2>サイド下のリンクよりログインし直してください</h2>
		<a href="scoremanager/login.jsp">ログインする</a>
	</c:param>
</c:import>
