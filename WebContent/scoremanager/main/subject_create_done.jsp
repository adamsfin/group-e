<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">科目追加完了</h1>
    </c:param>
</c:import>



<div class="container">
    <!-- メニュー見出し -->
    <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 st_management">科目登録</h2>
    <!-- サイドバー -->
    <div class="sidebar">
        <ul>
            <li><a href="/group-e/main/menu.jsp">メニュー</a></li>
            <li class="score-gakusei-link"><a href="#">学生</a>
                <ul class="sub-menu" style="display: none;">
                    <li><a href="/group-e/student/student_list.jsp">学生管理</a></li>
                    <li><a href="/group-e/student/student_registration.jsp">学生登録</a></li>
                    <li><a href="/group-e/student/student_update.jsp">学生変更</a></li>
                </ul>
            </li>
            <li class="score-seiseki-link"><a href="#">成績</a>
                <ul class="sub-menu" style="display: none;">
                    <li><a href="/group-e/subject_manage.jsp">成績管理</a></li>
                    <li><a href="/group-e/subject_manage.jsp">成績登録</a></li>
                    <li><a href="/group-e/subject_manage.jsp">成績参照</a></li>
                </ul>
            </li>
            <li class="score-kamoku-link"><a href="#">科目</a>
                <ul class="sub-menu" style="display: none;">
                    <li><a href="subject_list.jsp">科目管理</a></li>
                    <li><a href="subject_list.jsp">科目一覧</a></li>
                    <li><a href="subject_create.jsp">科目登録</a></li>
                </ul>
            </li>
        </ul>
    </div>

   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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

    function loadSubjects() {
        var subjects = JSON.parse(localStorage.getItem("subjects")) || [];
        var table = document.getElementById("subjectTable");
        subjects.forEach(function(subject) {
            var newRow = table.insertRow();
            var cell1 = newRow.insertCell(0);
            var cell2 = newRow.insertCell(1);
            var cell3 = newRow.insertCell(2);
            var cell4 = newRow.insertCell(3);

            cell1.innerHTML = subject.entYear;
            cell2.innerHTML = subject.classNum;
            cell3.innerHTML = subject.subjectName;
            cell4.innerHTML = '<a href="#">変更</a> <a href="#">削除</a>';
        });
    }

    window.onload = loadSubjects;
</script>

<h2>科目情報登録</h2>
<label><p>登録が完了しました</p></label>
<li><a href="/group-e/main/menu.jsp">戻る</a></li>
<li><a href="/group-e/subject/subject_list.jsp">科目一覧リンク</a></li>

