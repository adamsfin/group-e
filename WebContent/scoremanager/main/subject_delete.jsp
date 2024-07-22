<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">科目情報削除</h1>
    </c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
	    <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 st_management">科目情報削除</h2>

		<!-- 科目追加フォーム -->
	    <p>「${subject.name}(${subject.cd})」を削除してもよろしいですか</p>
	    <form action="SubjectCreateExecute.action" method="get">
	        <label for="cd">科目コード</label>
	        <input type="hidden" name="cd" value="${subject.cd}">
	        <input type="submit" value="削除">
	    </form>
	    <a href="SubjectList.action">戻る</a>
	</c:param>

</c:import>
