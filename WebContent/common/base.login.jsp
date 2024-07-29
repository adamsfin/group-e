<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<title>得点管理システム</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	</head>
	<body>
		<header>
			<h1 class="toptitle">
				<span class="highlight">得点管理システム</span>
			</h1>
			<c:if test="${!empty user}">
				<!-- 教師の名前を表示 -->
				<div class="header-right">
					<span>${user.name}&nbsp;様&nbsp;&nbsp;&nbsp;</span>
					<a href="${pageContext.request.contextPath}/Logout.action">ログアウト</a>
				</div>
			</c:if>
		</header>

		<!-- メインコンテンツ -->
		${param.title}
		${param.scripts}
		${param.content}

		<!-- フッター -->
		<footer>
			<p>@ 2024 TIC</p>
			<p>大原学園</p>
		</footer>
	</body>
</html>
