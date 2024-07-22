<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">科目追加完了</h1>
    </c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<h2>科目情報変更</h2>
		<p>変更が完了しました</p>
		<a href="SubjectUpdate.action">戻る</a>
		<a href="SubjectList.action">科目一覧リンク</a>
	</c:param>

</c:import>