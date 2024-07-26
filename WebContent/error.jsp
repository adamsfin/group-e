<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.kyoutuu.jsp">
	<c:param name="title">
		<h3>エラーが発生しました</h3>
	</c:param>
	<c:param name="scripts"></c:param>

	<c:param name="content">
		<h1>下のリンクより、お戻りください</h1>
		<a href="scoremanager/main/Menu.action">メニューに戻る</a>
	</c:param>
</c:import>