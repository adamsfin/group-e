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
