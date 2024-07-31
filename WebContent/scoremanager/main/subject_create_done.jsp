<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2 class="page-title">科目情報登録</h2>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<div class="contents">
			<p>登録が完了しました</p>
			<a href="SubjectCreate.action">戻る</a>
			<a href="SubjectList.action">科目一覧</a>
		</div>
	</c:param>
</c:import>