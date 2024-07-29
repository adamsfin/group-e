<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.kyoutuu.jsp">
	<c:param name="title">
		<h3>エラーが発生しました</h3>
	</c:param>
	<c:param name="scripts"></c:param>

	<c:param name="content">
		<c:choose>
			<c:when test="${empty user}">
				<div>未ログイン状態です。下記リンクからログインを行ってください。</div>
			<a href="scoremanager/Login.action">ログイン</a>
			</c:when>
			<c:otherwise>
				<div>下記リンクより、メニューへ戻ってください。</div>
				<a href="scoremanager/main/Menu.action">メニューに戻る</a>
			</c:otherwise>
		</c:choose>
	</c:param>
</c:import>
