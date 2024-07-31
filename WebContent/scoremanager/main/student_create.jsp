<%-- 学生登録JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@page import="java.util.List,java.time.LocalDate" %>

<%
	@SuppressWarnings("unchecked")
	List<String> classNum = (List<String>)session.getAttribute("class_num_set");
	LocalDate date = LocalDate.now();
%>

<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2 class="page-title">学生情報登録</h2>
	</c:param>

	<c:param name="content">
		<!-- メインコンテンツ -->
		<div class="contents">

			<section class="me-4">

				<form action="StudentCreateExecute.action" method="post">
					<div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">

						<div class="col-4">
							<label class="form-label" for="student-entYear">入学年度</label>
							<select  class="form-control" id="student-entYear" name="entYear">
								<option value="0">--------
								<% for (int year=date.getYear()-10;year<=date.getYear()+10;year++) { %>
									<option value=<%= year %>><%= year %>
								<% } %>
							</select>
							<div class="entYear_error">${year_error}</div>
						</div>

						<div class="col-4">
							<label class="form-label" for="student-id">学生番号</label>
							<input type="text" class="form-control" id="student-no" name="no" value="${no}" maxlength="10" placeholder="学生番号を入力してください" required>
							<div class="no_error">${no_error}</div>
						</div>

						<div class="col-4">
							<label class="form-label" for="student-name">氏名</label>
							<input type="text" class="form-control" id="student-name" name="name" value="${name}" maxlength="10" placeholder="氏名を入力してください" required>
						</div>

						<div class="col-4">
							<label class="form-label" for="student-classNum">クラス</label>
							<select class="form-control" id="student-classNum" name="classNum">
								<% for (String cNum:classNum) { %>
									<option value=<%= cNum %>><%= cNum %>
								<% } %>
							</select>
						</div>

						<div class="col-2 text-center">
							<button class="btn btn-secondary" id="filter-button">登録</button>
						</div>
					</div>
				</form>
				<a href="StudentList.action">戻る</a>
			</section>
		</div>
	</c:param>

</c:import>
