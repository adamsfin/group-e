<%-- 成績管理JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- リクエストの文字エンコーディングを設定 --%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.kyoutuu.jsp">

    <c:param name="scripts"></c:param>

    <c:param name="content">
        <%-- ログアウトメッセージとリンク --%>
    	<h2>ログアウト</h2>
    	<div>ログアウトしました</div>
    	<a href="../Login.action">ログイン</a>
	</c:param>
</c:import>
