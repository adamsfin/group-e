<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">科目追加</h1>
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
                    <li><a href="/group-e/subject_list.jsp">科目管理</a></li>
                    <li><a href="/group-e/subject_list.jsp">科目一覧</a></li>
                    <li><a href="/group-e/subject_list.jsp">科目登録</a></li>
                </ul>
            </li>
        </ul>
    </div>

<!-- 科目追加フォーム -->
    <h2>科目追加</h2>
    <form action="scoremanager.main.SubjectCreateExecute.action" method="post">
        <label for="subjectName">科目名:</label>
        <input type="text" id="subjectName" value="" placeholder="科目名を入力して下さい" name="subjectName" required><br>

   		<label class="form-label" for="school_name">科目コード:</label>
      	<input type="text" id="subject-school_Name" value="" placeholder="科目コードを入力して下さい"name="school_Name" required>
                    <button type="submit">追加</button>

    </form>
    <a href="/group-e/subject/subject_list.jsp">戻る</a>

