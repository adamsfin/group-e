<%-- 成績管理JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- リクエストの文字エンコーディングを設定 --%>
<% request.setCharacterEncoding("UTF-8"); %>

<style>
	div {
	    width: 800px;
	    margin-left: auto;
	    margin-right: auto;
	    margin-top: 10px;
	}

	h2 {
		background-color: #DDDDDD;
		font-size: 28px;
		padding: 8px 24px;
		text-align: left;
	}
</style>

<c:import url="/common/base.login.jsp">

    <c:param name="scripts"></c:param>

    <c:param name="content">
    	<div>
	        <%-- ログアウトメッセージとリンク --%>
	        <h2>ログアウト</h2>
	    	<p>ログアウトしました</p>
	    	<p></p>
	    	<a href="../Login.action">ログイン</a>
	    </div>
	</c:param>
</c:import>
