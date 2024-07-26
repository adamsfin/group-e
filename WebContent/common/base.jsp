<%-- 共通部分JSP --%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<title>得点管理システム</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	</head>

	<header>
		<h1 class="toptitle">
			<span class="highlight">得点管理システム</span>
		</h1>
		<c:if test="${!empty user}">
			<!-- 教師の名前を表示 -->
			<div class="header-right">
				<span>${user.name}&nbsp;様&nbsp;&nbsp;&nbsp;</span>
				<a href="Logout.action">ログアウト</a>
			</div>
		</c:if>
	</header>

	<body>

		<c:if test="${!empty user}">
			<%--サイドバー --%>
			<div class="container">
				<link rel="stylesheet" type="text/css" href="styles.css">
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
				$(document).ready(function() {
					$('.sidebar .score-gakusei-link').click(function() {
						$('.sidebar .score-gakusei-link .sub-menu').toggle();
					});
					$('.sidebar .score-seiseki-link').click(function() {
						$('.sidebar .score-seiseki-link .sub-menu').toggle();
					});
					$('.sidebar .score-kamoku-link').click(function() {
						$('.sidebar .score-kamoku-link .sub-menu').toggle();
					});
				});
				</script>

				<div class="sidebar">
					<ul>
					<li><a href="Menu.action">メニュー</a></li>
						<li class="score-gakusei-link"><a href="#">学生管理</a>
							<ul class="sub-menu" style="display: none;">
								<li><a href="StudentList.action">学生一覧</a></li>
								<li><a href="StudentCreate.action">学生登録</a></li>
								<li><a href="StudentDropOutList.action">退学者一覧</a></li>
							</ul>
						</li>
						<li class="score-seiseki-link"><a href="#">成績管理</a>
							<ul class="sub-menu" style="display: none;">
								<li><a href="TestRegist.action">成績登録</a></li>
								<li><a href="TestList.action">成績参照</a></li>
							</ul>
						</li>
						<li class="score-kamoku-link"><a href="#">科目管理</a>
							<ul class="sub-menu" style="display: none;">
								<li><a href="SubjectList.action">科目一覧</a></li>
								<li><a href="SubjectCreate.action">科目登録</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</c:if>

		${param.title}
		${param.scripts}
		${param.content}

	</body>

	<!-- フッター -->
	<footer>
		<p>@ 2024 TIC</p>
		<p>大原学園</p>
	</footer>

</html>
