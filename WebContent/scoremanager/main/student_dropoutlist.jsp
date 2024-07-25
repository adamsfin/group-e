<%-- 学生一覧JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">得点管理システム</h1>
    </c:param>

    <c:param name="scripts"></c:param>

    <c:param name="content">

    <%--サイドバー --%>
<link rel="stylesheet" type="text/css" href="styles.css">
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

<div class="container">
<!-- メニュー見出し -->
<h2 class="h3">メニュー</h2>
    <!-- サイドバー -->
    <div class="sidebar">
        <ul>
        <li><a href="menu.jsp">メニュー</a></li>
            <li class="score-gakusei-link"><a href="#">学生管理</a>
                <ul class="sub-menu" style="display: none;">
                	<li><a href="StudentList.action">学生一覧</a></li>
                    <li><a href="StudentCreate.action">学生登録</a></li>
                </ul>
            </li>
            <li class="score-seiseki-link"><a href="#">成績管理</a>
                <ul class="sub-menu" style="display: none;">
                    <li><a href="TestRegist.action">成績登録</a></li>
                    <li><a href="TestList.action">成績参照</a></li>
                </ul>
            </li>
            <li class="score-kamoku-link"><a href="#">科目管理</a>
                <ul class="sub-menu" style="display: none;">
                	<li><a href="SubjectList.action">科目一覧</a></li>
                    <li><a href="SubjectCreate.action">科目登録</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
        <section class="mo-4">
            <h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">退学者一覧</h2>
            <c:choose>
                <c:when test="${do_students.size()>0}">
                    <div>検索結果:${do_students.size()}件</div>
                    <table class="table table-hover">
                        <tr>
                            <th>入学年度</th>
                            <th>学生番号</th>
                            <th>氏名</th>
                            <th>クラス</th>
                            <th class="text-center">在学中</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <c:forEach var="student" items="${do_students}">
                            <tr>
                                <td>${student.entYear}</td>
                                <td>${student.no}</td>
                                <td>${student.name}</td>
                                <td>${student.classNum}</td>
                                <td class="text-center">
                                    <%-- 在学フラグがたっている場合[〇]それ以外は[×]を表示 --%>
                                    <c:choose>
                                      <c:when test="${student.isAttend()}">
                                        〇
                                      </c:when>
                                      <c:otherwise>
                                        ×
                                      </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

<script type="text/javascript">
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
                </c:when>
                <c:otherwise>
                    <div>学生情報が存在しませんでした</div>
                </c:otherwise>
            </c:choose>
        </section>
    </c:param>
</c:import>

