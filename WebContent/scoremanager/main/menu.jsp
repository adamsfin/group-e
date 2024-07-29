<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>メニュー</title>
    <style>
		/* 全体のスタイル */
		html, body {
		    height: 100%; /* ビューポートの高さを100%に設定 */
		    margin: 0; /* デフォルトの余白を削除 */
		}

		/* メインコンテンツのスタイル */
		.main-content {
		    padding-bottom: 60px; /* フッターの高さ分だけ余白を確保 */
		}

		/* サイドバー全体のスタイル */
		.sidebar {
		    width: 250px;
		    background-color: #f8f9fa;
		    padding: 15px;
		    border-radius: 4px;
		    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
		    margin-right: 20px; /* サイドバーとメインコンテンツの間隔 */
		    float: left; /* 左側に浮かせる */
		}

		/* サイドバーのリストスタイル */
		.sidebar ul {
		    list-style-type: none;
		    padding: 0;
		}

		.sidebar li {
		    margin-bottom: 10px;
		}

		.sidebar li a {
		    text-decoration: none;
		    color: #333;
		    font-size: 16px;
		}

		/* サイドバーのサブメニュー */
		.sidebar .sub-menu {
		    list-style-type: none;
		    padding: 0;
		    display: none;
		    margin-left: 20px;
		}

		.sidebar .sub-menu li {
		    margin-bottom: 5px;
		}

		.sidebar .sub-menu li a {
		    color: #007bff;
		    font-size: 14px;
		}

		.sidebar .sub-menu li a:hover {
		    text-decoration: underline;
		}

		/* メニュー全体のスタイル */
		.menu {
		    display: flex;
		    flex-direction: row; /* 横並びにする */
		    background-color: #f4f4f4; /* 明るいグレー背景 */
		    border-radius: 8px; /* 角を丸くする */
		    box-shadow: 0 4px 8px rgba(0,0,0,0.2); /* 影を付ける */
		    padding: 5px; /* 内側の余白を小さくする */
		    justify-content: space-around; /* アイテム間のスペースを均等に配置 */
		    align-items: center; /* アイテムを中央に揃える */
		}

		/* メニューアイテムのスタイル */
		.menu-item {
		    padding: 5px 15px; /* 内側の余白 (上下5px, 左右15px) */
		    border-radius: 4px; /* 角を丸くする */
		    transition: background-color 0.3s, color 0.3s, transform 0.3s; /* ホバー時のアニメーション */
		    text-align: center; /* テキストを中央に揃える */
		}

		.menu-item a {
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

		/* メニューアイテムのアクティブスタイル */
		.menu-item.active {
		    background-color: #0056b3; /* アクティブ時の背景色 */
		    color: #fff; /* アクティブ時のテキスト色 */
		}

		/* フッターのスタイル */
		footer {
		    text-align: center; /* テキストを中央に揃える */
		    padding: 10px; /* 内側の余白 */
		    background-color: #fff; /* 背景色 */
		    border-top: 1px solid #ddd; /* 上部のボーダー */
		    position: fixed; /* ページの下部に固定 */
		    bottom: 0; /* 下端に配置 */
		    width: 100%; /* 幅を100%に設定 */
		}


    </style>
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
</head>
<body>
    <c:import url="/common/base.kyoutuu.jsp">
        <c:param name="title">
            <h2>メニュー</h2>
        </c:param>

        <c:param name="content">
            <c:if test="${!empty user}">
                <div class="container">
                    <!-- サイドバー -->
                    <div class="sidebar">
                        <ul>
                            <li><a href="Menu.action">メニュー</a></li>
                            <li class="score-gakusei-link"><a href="#">学生管理</a>
                                <ul class="sub-menu">
                                    <li><a href="StudentList.action">学生一覧</a></li>
                                    <li><a href="StudentCreate.action">学生登録</a></li>
                                    <li><a href="StudentDropOutList.action">退学者一覧</a></li>
                                </ul>
                            </li>
                            <li class="score-seiseki-link"><a href="#">成績管理</a>
                                <ul class="sub-menu">
                                    <li><a href="TestRegist.action">成績登録</a></li>
                                    <li><a href="TestList.action">成績参照</a></li>
                                </ul>
                            </li>
                            <li class="score-kamoku-link"><a href="#">科目管理</a>
                                <ul class="sub-menu">
                                    <li><a href="SubjectList.action">科目一覧</a></li>
                                    <li><a href="SubjectCreate.action">科目登録</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </c:if>

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
