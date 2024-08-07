<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<c:import url="/common/base.login.jsp">
    <c:param name="title">
        <h2 class="login-title">ログイン</h2>
    </c:param>

    <c:param name="content">
        <style>
            /* ログイン画面のスタイル */
            .login {
                width: 570px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 15px;
                margin-bottom: 20px;
                padding: 18px 30px 20px;
                background-color: #ffffff;
                border: 0.5px solid #ccc;
                border-radius: 5px;
            }

            .login-title {
                text-align: center;
                margin: 17px 0 0;
                font-size: 28px;
            }


            label[for="id"],
            label[for="password"] {
                margin: 5px 0 5px;
            }

            input[name="id"],
            input[name="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 5px;
                border: 0.5px solid #ccc;
                border-radius: 4px;
            }

            label[for="chk_d_ps"] {
                display: block;
                text-align: center;
                margin: 8px 0 12px;
            }

            input[name="login"] {
                display: block;
                margin: auto;
                width: 35%;
                padding: 10px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 6px;
                cursor: pointer;
            }

            input[name="login"]:hover {
                background-color: #0064FF;
            }

            .login p {
            	text-align: center;
            	margin: 0;
            	font-size: 15px;
            	color: red;
            }
        </style>

        <div class="login">
            <c:if test="${!empty loginerr_msg}">
                <p>${loginerr_msg}</p>
            </c:if>
            <form action="LoginExecute.action" method="post">
                <label for="id">ＩＤ</label>
                <input type="text" name="id" value="${id}" placeholder="半角でご入力ください" pattern="^[0-9A-Za-z]+$" title="半角英数字" required="required">
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
