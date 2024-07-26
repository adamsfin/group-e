<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2>メニュー</h2>
	</c:param>

	<c:param name="content">
		<!-- メニュー -->
		<div class="menu">
			<div class="menu-item student-management">
				<a href="StudentList.action">学生管理</a>
			</div>
			<div class="menu-item score-management">
				成績管理
				<a href="TestRegist.action">成績登録</a>
				<a href="TestList.action">成績参照</a>
			</div>
			<div class="menu-item subject-management">
				<a href="SubjectList.action">科目管理</a>
			</div>
		</div>
	</c:param>
</c:import>
