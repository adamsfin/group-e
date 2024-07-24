<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">得点管理システム</h1>
    </c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<h2>成績管理</h2>
		<p>登録が完了しました</p>
		<a href="TestRegist.action">戻る</a>
		<a href="TestList.action">成績参照</a>
	</c:param>

</c:import>