<%-- 成績参照JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<head>
	<style>
		.test_search_form form {
			margin-bottom: 10px;
		}

		input[type="submit"] {
			margin-top: 10px;
		    padding: 10px;
		    background-color: #007bff;
		    color: #ffffff;
		    border: none;
		    border-radius: 6px;
		    cursor: pointer;
		}

		input[type="submit"]:hover {
			background-color: #0056b3;
		}

	</style>
</head>

<body>
	<c:import url="/common/base.jsp">
		<c:param name="title">
			<h2 class="page-title">成績参照</h2>
		</c:param>

		<c:param name="scripts"></c:param>

		<c:param name="content">

			<div class="contents">
				<div class="test_search_form">
					<form action="TestList.action" method="post" id="filter">
						<div>科目情報</div>
						<label for="f1">入学年度</label>
						<select name="f1">
							<option value="0">--------</option>
							<c:forEach var="year" items="${entYearSet}">
								<option value="${year}"<c:if test="${ent_year==year}"> selected</c:if>>${year}</option>
							</c:forEach>
						</select>
						<label for="f2">クラス</label>
						<select name="f2">
							<option value="">--------</option>
							<c:forEach var="num" items="${classNumSet}">
								<option value="${num}"<c:if test="${cNum==num}"> selected</c:if>>${num}</option>
							</c:forEach>
						</select>
						<label for="f3">科目</label>
						<select name="f3">
							<option value="">--------</option>
							<c:forEach var="subject" items="${subjects}">
								<option value="${subject.cd}"<c:if test="${subCd==subject.cd}"> selected</c:if>>${subject.name}</option>
							</c:forEach>
						</select>
						<input type="hidden" name="f" value="sj">
						<input type="submit" value="検索">
					</form>
					<div class="input_val_error">${inputVal_error}</div>

					<form action="TestList.action" method="post" id="filter">
						<div>学生情報</div>
						<label for="f4">学生番号</label>
						<input type="text" name="f4" value="${f4}" placeholder="学生番号を入力してください" required>
						<input type="hidden" name="f" value="st">
						<input type="submit" value="検索">
					</form>
				</div>

				<c:if test="${empty testListSub && empty testListStu && empty none_list}">
					<p>科目情報を選択または学生情報を入力して検索ボタンをクリックしてください</p>
				</c:if>

				<c:if test="${!empty testListStu}"><jsp:include page="test_list_student.jsp"/></c:if>
				<c:if test="${!empty testListSub}"><jsp:include page="test_list_subject.jsp"/></c:if>

				<div class="none_list_error">${none_list}</div>
			</div>

		</c:param>

	</c:import>
</body>