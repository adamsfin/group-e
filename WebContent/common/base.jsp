<%-- 共通部分JSP --%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>

<body>

${param.title}
${param.scripts}
${param.content}

<!-- 教師の名前を表示 -->
<div class="header-right">
  <span>${user.name}&nbsp;様&nbsp;&nbsp;&nbsp;</span>
  <a href="/group-e/scoremanager/main/logout.jsp">ログアウト</a>
</div>
</body>
</html>
