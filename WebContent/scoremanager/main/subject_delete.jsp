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
		    background-color: #ff0044;
		    border: none;
		    color: white;
		    border-radius: 5px;
		    cursor: pointer;
		    margin-top: 9px;
		}

		input[type="submit"]:hover {
			background-color: #db0f46;
		}

		.contents a {
			margin-top: 10px;
		}
	</style>
</head>

<body>
	<c:import url="/common/base.jsp">
		<c:param name="title">
			<h2 class="page-title">科目情報削除</h2>
		</c:param>

		<c:param name="scripts"></c:param>

		<c:param name="content">

			<!-- 科目追加フォーム -->
			<div class="contents">
				<p>「${subject.name}(${subject.cd})」を削除してもよろしいですか</p>
				<form action="SubjectDeleteExecute.action" method="get">
					<input type="hidden" name="cd" value="${subject.cd}">
					<input type="submit" value="削除">
				</form>
				<a href="SubjectList.action">戻る</a>
			</div>
		</c:param>

	</c:import>
</body>