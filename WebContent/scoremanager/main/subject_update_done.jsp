<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>科目情報変更</title>
    <!-- CSSをここに直接記述 -->
    <style>
        /* 基本スタイルのリセット */
        a {
            text-decoration: none; /* 下線を消す */
            color: #007BFF; /* リンクの色を青にする */
            font-weight: bold; /* 文字を太字にする */
            padding: 8px 12px; /* 内側の余白を追加 */
            border-radius: 4px; /* 角を丸くする */
            display: inline-block; /* ボックスとして表示 */
            transition: background-color 0.3s, color 0.3s; /* ホバー時のアニメーションを追加 */
        }

        /* ホバー時のスタイル */
        a:hover {
            background-color: #f0f0f0; /* 背景色を変更 */
            color: #0056b3; /* テキスト色を変更 */
            text-decoration: underline; /* 下線を追加 */
        }

        /* フォーカス時のスタイル（アクセシビリティのため） */
        a:focus {
            outline: 2px solid #0056b3; /* フォーカス時のアウトラインを追加 */
            outline-offset: 2px; /* アウトラインとリンクの間隔を調整 */
        }
    </style>
</head>
<body>
    <c:import url="/common/base.kyoutuu.jsp">
        <c:param name="title">
            <h2>科目情報変更</h2>
        </c:param>

        <c:param name="scripts"></c:param>

        <c:param name="content">
            <p>変更が完了しました</p>
            <a href="SubjectUpdate.action">戻る</a>
            <a href="SubjectList.action">科目一覧</a>
        </c:param>
    </c:import>
</body>
</html>
