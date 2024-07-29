<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 st_management">科目情報削除</h2>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">

		<!-- 科目追加フォーム -->
		<div class="subject">
			<p>「${subject.name}(${subject.cd})」を削除してもよろしいですか</p>
			<form action="SubjectDeleteExecute.action" method="get">
				<input type="hidden" name="cd" value="${subject.cd}">
				<input type="submit" class="sub-button" style="background-color: #ff0044;" value="削除">
			</form>
			<a href="SubjectList.action">戻る</a>
		</div>
	</c:param>

</c:import>
