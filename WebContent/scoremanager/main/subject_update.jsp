<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">科目追加</h1>
    </c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
	    <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 st_management">科目登録</h2>

		<!-- 科目追加フォーム -->
	    <h2>科目追加</h2>

	    <c:if test="${!empty inputVal}"><c:set var="cd" value="${inputVal.cd}"/> </c:if>

	    <form action="SubjectUpdateExecute.action" method="get">
	        <label for="cd">科目コード</label>
	        <input type="hidden" name="cd" value="${cd}">
	        <div>${cd}</div>
	        <div class="subject_error">${subject_error}</div>

	   		<label for="name">科目名</label>
	      	<input type="text" name="name" value="${inputVal.name}" placeholder="科目名を入力して下さい" required>
	        <input type="submit" value="変更">
	    </form>
	    <a href="SubjectList.action">戻る</a>
	</c:param>

</c:import>
