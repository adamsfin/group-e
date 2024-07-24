<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">得点管理システム</h1>
    </c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
	    <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 st_management">科目登録</h2>

		<!-- 科目追加フォーム -->
	    <h2>科目追加</h2>
	    <form action="SubjectCreateExecute.action" method="get">
	        <label for="cd">科目コード</label>
	        <input type="text" name="cd" value="${inputVal.cd}" placeholder="科目コードを入力して下さい" maxlength="3" required>
	        <div class="inputCd_error">${cd_error}</div>

	   		<label for="name">科目名</label>
	      	<input type="text" name="name" value="${inputVal.name}" placeholder="科目名を入力して下さい" maxlength="20" required>
	        <input type="submit" value="登録">
	    </form>
	    <a href="SubjectList.action">戻る</a>
	</c:param>

</c:import>