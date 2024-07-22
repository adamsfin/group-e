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
        <section class="mo-4">
            <h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">学生管理</h2>
            <div class="my-2 text-end px-4">
                <a href="StudentCreate.action">新規登録</a>
            </div>
            <form method="get">
                <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                    <div class="col-4">
                        <label class="form-label" for="student-f1-select">入学年度</label>
                        <select class="form-select" id="student-f1-select" name="f1">
                            <option value="0">--------</option>
                            <c:forEach var="year" items="${ent_year_set}">
                                <%-- 現在のyearと選択されていたf1が一致していた場合selectedを追記 --%>
                                <option value="${year}" <c:if test="${year==f1}">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-4">
                        <label class="form-label" for="student-f2-select">クラス</label>
                        <select class="form-select" id="student-f2-select" name="f2">
                            <option value="0">--------</option>
                            <c:forEach var="num" items="${class_num_set}">
                                <%-- 現在numと選択されていたがf2が一致していた場合selectedを追記 --%>
                                <option value="${num}" <c:if test="${num==f2}">selected</c:if>>${num}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-2 form-check text-center">
                        <label class="form-check-label" for="student-f3-check">在学中
                            <%-- パラメーターf3が存在している場合checkboxを追記 --%>
                            <input class="from-check-input" type="checkbox"
                            id="student-f3-check" name="f3" value="t"
                            <c:if test="${!empty f3}">checked</c:if> />
                        </label>
                    </div>
                    <div class="col-2 text-center">
                        <button class="btn btn-secondary" id="filter-button">絞込み</button>
                    </div>
                    <div class="mt-2 text-warning">${errors.get("f1")}</div>
                </div>
            </form>
            <c:choose>
                <c:when test="${students.size()>0}">
                    <div>検索結果:${students.size()}件</div>
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
                        <c:forEach var="student" items="${students}">
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
                                <td><a href="StudentUpdate.action?no=${student.no}">変更</a></td>
                                <td><a href="SetudenDelete.action?no=${student.no}">削除</a></td>
                            </tr>
                        </c:forEach>
                    </table>
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
                </c:when>
                <c:otherwise>
                    <div>学生情報が存在しませんでした</div>
                </c:otherwise>
            </c:choose>
        </section>
    </c:param>
</c:import>

