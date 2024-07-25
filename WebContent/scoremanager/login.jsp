<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<c:import url="/common/base.jsp">
	<c:param name="title">
		<h1 class="toptitle">得点管理システム</h1>

	</c:param>

	<c:param name="content">
		<c:if test="${!empty loginerr_msg}">
			<p>${loginerr_msg}</p>
		</c:if>
		<div class="login">
			<form action="LoginExecute.action" method="post">
				<h3 class="login-title">ログイン</h3>
				<label for="id">ＩＤ</label>
				<input type="text" name="id" placeholder="半角でご入力ください" pattern="^[0-9A-Za-z]+$" title="半角英数字" required="required">
				<label for="password">パスワード</label>
				<input type="password" name="password" placeholder="20文字以内の半角英数字でご入力ください" pattern="^[0-9A-Za-z]{1,20}$" title="20文字以内の半角英数字" required="required">
				<label for="chk_d_ps">パスワードを表示 <input type="checkbox" name="chk_d_ps" onchange="togglePasswordVisibility()"></label>
				<input type="submit" name="login" value="ログイン">
			</form>
		</div>
	</c:param>

	<c:param name="scripts">
		<script>
			function togglePasswordVisibility() {
				let passwordInput = document.getElementsByName("password");
				let passwordCheckbox = document.getElementsByName("chk_d_ps");

				if (passwordCheckbox[0].checked) {
					passwordInput[0].type = "text";
				} else {
					passwordInput[0].type = "password";
				}
			}
		</script>
	</c:param>

</c:import>
<!-- フッター -->
<footer>
    <p>© 2024 TIC<br>大原学園</p>
</footer>
