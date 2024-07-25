<%-- 成績参照JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:import url="/common/base.jsp">
	<c:param name="title">
		<h1 class="toptitle">得点管理システム</h1>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
    <h2 class="centered-heading">成績参照</h2>

		<div class="test_search_form">
			<div>科目情報</div>
			<form action="TestList.action" method="post">
				<label for="f1">入学年度</label>
				<select name="f1">
					<option value="0">--------</option>
					<c:forEach var="year" items="${entYearSet}">
						<option value="${year}"<c:if test="${inputVal.year==year}"> selected</c:if>>${year}</option>
					</c:forEach>
				</select>
				<label for="f2">クラス</label>
				<select name="f2">
					<option value="">--------</option>
					<c:forEach var="num" items="${classNumSet}">
						<option value="${num}"<c:if test="${inputVal.num==num}"> selected</c:if>>${num}</option>
					</c:forEach>
				</select>
				<label for="f3">科目</label>
				<select name="f3">
					<option value="">--------</option>
					<c:forEach var="subject" items="${subjects}">
						<option value="${subject.cd}"<c:if test="${inputVal.subject==subject.cd}"> selected</c:if>>${subject.name}</option>
					</c:forEach>
				</select>
				<input type="hidden" name="sub_flag" value="1">
				<input type="submit" value="検索">
			</form>
			<div class="input_val_error">${inputVal_error}</div>

			<div>学生情報</div>
			<form action="TestList.action" method="post">
				<label for="f4">学生番号</label>
				<input type="text" name="f4" value="${inputNo}" placeholder="学生番号を入力してください">
				<input type="hidden" name="stu_flag" value="1">
				<input type="submit" value="検索">
			</form>
		</div>

		<c:if test="${empty testListSub && empty testListStu && empty none_list}">
			<p>科目情報を選択または学生情報を入力して検索ボタンをクリックしてください</p>
		</c:if>

		<c:if test="${!empty testListStu}"><jsp:include page="test_list_student.jsp"/></c:if>
		<c:if test="${!empty testListSub}"><jsp:include page="test_list_subject.jsp"/></c:if>


		<div class="none_list_error">${none_list}</div>
		<a href="Menu.action">メニュー</a>
	</c:param>


</c:import>