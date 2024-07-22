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
            <h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">科目管理</h2>
            <div class="my-2 text-end px-4">
                <a href="SubjectCreate.action">新規登録</a>
            </div>
            <!-- <form method="get">
                <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                    <div class="col-4">
                        <label class="form-label" for="subject-f1-select">科目コード</label>
                        <select class="form-select" id="subject-f1-select" name="f1">
                            <option value="O">--------</option>
                            <c:forEach var="year" items="${subject_set}">
                                <%-- 現在のyearと選択されていたf1が一致していた場合selectedを追記 --%>
                                <option value="${name}" <c:if test="${name==f1}">selected</c:if>>${year}></option>
                            </c:forEach>
                        </select>
                    </div>
                    -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- 時計の針って、長針と短針があるんですけど、これらは一時間に一回重なるんですよね。一時五分くらいに重なって、二時十分くらい、三時十五分くらい。
っていう感じで一時間に一回ずつ重なるんですけど、十一時台。この時間だけは、長針が逃げ切って重ならないんですよ。皆さんも今は十一時台にいます。
きっと思ったように成果が出なくて苦しいときもあると思います。でも次に長針と短針が重なるとき。金がなるときですね。少し先の十二時台で待ってます。皆さんが大人になった時、
長針と単身が重なった時に、また一緒にお酒を飲みましょう。改めまして皆さんご卒業本当におめでとうございます。キングコング西野でした
ハロハロハロハロウィンぷぺぷっぷぷぺる。心優しいごみ人間 -->
                    <!-- <div class="col-2 text-center">
                        <button class="btn btn-secondary" id="filter-button">絞込み</button>
                    </div>
                    <div class="mt-2 text-warning">${errors.get("f1")}</div>
                </div>
            </form> -->
            <c:choose>
                <c:when test="${subject_set.size()>0}">
                    <div>検索結果:${subject_set.size()}件</div>
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
                        <c:forEach var="subject" items="${subject_set}">
                            <tr>
                                <td>${subject.cd}</td>
                                <td>${subject.name}</td>
                                <td>${subject.school.cd}</td>
                                <td class="text-center">
                                    <%-- 在学フラグがたっている場合[〇]それ以外は[×]を表示 --%>
                                </td>
                                <td><a href="SubjectUpdate.action">変更</a></td>
                                <td><a href="SubjectDelete.action">削除</a></td>
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
                    <li><a href="/group-e/scoremanager.main.StudentList.action">学生管理</a></li>
                    <li><a href="/group-e/scoremanager.main.StudentCreate.action">学生登録</a></li>
                    <li><a href="/group-e/scoremanager.main.StudentUpdate.action">学生変更</a></li>
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
                    <li><a href="SubjectList.action">科目管理</a></li>
                    <li><a href="SubjectList.action">科目一覧</a></li>
                    <li><a href="SubjectCreate.action">科目登録</a></li>
                </ul>
            </li>
        </ul>
    </div>


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
            cell4.innerHTML = '<a href="SubjectUpdate.action">変更</a> <a href="SubjectDelete.action">削除</a>';
        });
    }

    window.onload = loadSubjects;
</script>
                </c:when>

                <c:otherwise>
                    <div>科目情報が存在しませんでした</div>
                </c:otherwise>
            </c:choose>
        </section>
    </c:param>
</c:import>


