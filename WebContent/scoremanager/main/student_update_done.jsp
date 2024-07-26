<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2>学生情報変更</h2>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<p>変更が完了しました</p>
		<a href="StudentUpdate.action">戻る</a>
		<a href="StudentList.action">学生一覧</a>
	</c:param>

</c:import>