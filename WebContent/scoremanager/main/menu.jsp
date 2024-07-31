<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html lang="ja">
	<head>
	    <meta charset="UTF-8">
	    <title>メニュー</title>
	    <style>
			/* メニュー全体のスタイル */
			.menu {
			    display: flex;
			    justify-content: center; /* 中央揃え */
			    width: 800px;
			    margin-top: 10px;
			    flex-direction: row; /* 横並びにする */
			    background-color: #f4f4f4; /* 明るいグレー背景 */
			    border-radius: 8px; /* 角を丸くする */
			    box-shadow: 0 4px 8px rgba(0,0,0,0.2); /* 影を付ける */
			    padding: 5px; /* 内側の余白を小さくする */
			    align-items: center; /* アイテムを中央に揃える */
			}

			/* メニューアイテムのスタイル */
			.menu-item {
			    margin: 10px;
			    padding: 10px 20px;
			    border-radius: 5px;
			    text-decoration: none;
			    color: #333;
			    transition: background-color 0.3s ease;
			    text-align: center; /* テキストを中央に揃える */
			}

			.menu-item a {
			    display: block;
			    padding: 10px;
			    background-color: #f4f4f4; /* メニューの背景色 */
			    text-decoration: none; /* 下線を消す */
			    color: #333; /* テキストの色 */
			    font-size: 14px; /* フォントサイズ */
			    font-weight: 400; /* フォントの太さ */
			}

			/* メニューアイテムのホバースタイル */
			.menu-item:hover {
			    background-color: #007bff; /* ホバー時の背景色 */
			    color: #fff; /* ホバー時のテキスト色 */
			    transform: scale(1.05); /* 少し拡大する */
			}

			.menu-item a:hover {
			    background-color: #ddd; /* マウスオーバー時の背景色 */
			}
	    </style>
	</head>

	<body>
	    <c:import url="/common/base.jsp">
	        <c:param name="title">
	            <h2 class="page-title">メニュー</h2>
	        </c:param>

	        <c:param name="content">
	            <!-- メニュー -->
	            <div class="menu">
	                <div class="menu-item student-management">
	                    <a href="StudentList.action">学生管理</a>
	                </div>
	                <div class="menu-item score-management">
	                    <a href="TestList.action">成績管理</a>
	                </div>
	                <div class="menu-item subject-management">
	                    <a href="SubjectList.action">科目管理</a>
	                </div>
	            </div>
	        </c:param>
	    </c:import>
	</body>
</html>
