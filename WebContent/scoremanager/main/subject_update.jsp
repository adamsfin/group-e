<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<head>
	<style>
		.contents {
			width: 700px;
			margin-left: 380px;
			display: flex;
		    flex-direction: column;
		}

		input[type="submit"] {
			width: 60px;
		    padding: 8px 0;
		    background-color: #007bff;
		    border: none;
		    color: white;
		    border-radius: 5px;
		    cursor: pointer;
		    margin-top: 9px;
		}

		input[type="submit"]:hover {
			background-color: #0056b3;
		}

		.contents a {
			margin-bottom: 10px;
		}
	</style>
</head>

<body>
	<c:import url="/common/base.jsp">
		<c:param name="title">
			<h2 class="page-title">科目情報変更</h2>
		</c:param>

		<c:param name="scripts"></c:param>

		<c:param name="content">

			<!-- 科目編集フォーム -->
			<div class="contents">
				<form action="SubjectUpdateExecute.action" method="get">
					<label for="cd">科目コード</label>
					<input type="hidden" name="code" value="${code}">
					<div>${code}</div>
					<div class="subject_error">${subject_error}</div>

					<label for="name">科目名</label>
					<input type="text" class="form-control" name="name" value="${name}" placeholder="科目名を入力して下さい" maxlength="20" required>
					<input type="submit" value="変更">
				</form>
				<a href="SubjectList.action">戻る</a>
			</div>
		</c:param>

	</c:import>
</body>