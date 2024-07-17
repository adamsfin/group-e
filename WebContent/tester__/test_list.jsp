<%-- 学生一覧JSP --%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Student"%>
<%@page import="bean.Subject, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">得点管理システム</h1>
    </c:param>

    <c:param name="scripts"></c:param>

    <c:param name="content">
        <section class="mo-4">
            <h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">成績管理</h2>
            <div class="my-2 text-end px-4 signup">
                <a href="student_registration.jsp">新規登録</a>
            </div>

            <%-- サイドバー --%>
            <link rel="stylesheet" type="text/css" href="styles.css">
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('.sidebar .score-gakusei-link').click(function () {
                        $('.sidebar .score-gakusei-link .sub-menu').toggle();
                    });

                    $('.sidebar .score-seiseki-link').click(function () {
                        $('.sidebar .score-seiseki-link .sub-menu').toggle();
                    });

                    $('.sidebar .score-kamoku-link').click(function () {
                        $('.sidebar .score-kamoku-link .sub-menu').toggle();
                    });
                });
            </script>
            <div class="container">
                <!-- サイドバー -->
                <div class="sidebar">
                    <ul>
                        <li><a href="/group-e/main/menu.jsp">メニュー</a></li>
                        <li class="score-gakusei-link"><a href="#">学生</a>
                            <ul class="sub-menu" style="display: none;">
                                <li><a href="/group-e/student/student_list.jsp">学生管理</a></li>
                                <li><a href="/group-e/student/student_registration.jsp">学生登録</a></li>
                                <li><a href="#">成績管理</a></li>
                            </ul>
                        </li>
                        <li class="score-seiseki-link"><a href="#">成績</a>
                            <ul class="sub-menu" style="display: none;">
                                <li><a href="#">成績管理</a></li>
                                <li><a href="#">成績登録</a></li>
                                <li><a href="#">成績参照</a></li>
                            </ul>
                        </li>
                        <li class="score-kamoku-link"><a href="#">科目</a>
                            <ul class="sub-menu" style="display: none;">
                                <li><a href="#">科目管理</a></li>
                                <li><a href="#">科目一覧</a></li>
                                <li><a href="#">科目登録</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <form method="get" action="/group-e_kanai/tester__/studentsearchservlet">
                <div class="row border mx-3 mb-3 py-2 align-items-center rounded" id="filter">
                   <div class="col-3">
					    <label class="form-label" for="student-f1-select">入学年度</label>
					    <select class="form-select" id="student-f1-select" name="f1">
					        <%
					            // 学生リストから入学年度の一覧を取得
					            List<Integer> entYearList = new ArrayList<>();
					            for (Student student : (List<Student>) request.getAttribute("studentList")) {
					                entYearList.add(student.getEntYear());
					            }


					            // 入学年度の一覧を選択肢として表示
					            for (int entYear : entYearList) {
					        %>
					        <option value="<%= entYear %>"
					            <%-- リクエストパラメータ f1 がある場合、それと一致する場合に選択状態にする --%>
					            <% if (request.getParameter("f1") != null && request.getParameter("f1").equals(entYear)) { %>
					                selected
					            <% } %>
					        ><%= entYear %></option>
					        <%
					            }
					            // 学生リストが空の場合はメッセージを表示
					            if (entYearList.isEmpty()) {
					        %>
					        <option value="">学生リストが空です</option>
					        <%
					            }
					        %>
					    </select>
					</div>


                    <div class="col-3">
					    <label class="form-label" for="student-f2-select">クラス</label>
					    <select class="form-select" id="student-f2-select" name="f2">
					        <%
					            List<String> classNumList = new ArrayList<>();
					            List<Student> studentList = (List<Student>) request.getAttribute("studentList");
					            if (studentList != null) {
					                for (Student student : studentList) {
					                    classNumList.add(student.getClassNum());
					                }
					            }

					            for (String classNum : classNumList) {
					        %>
					        <option value="<%= classNum %>"
					            <%-- リクエストパラメータ f2 がある場合、それと一致する場合に選択状態にする --%>
					            <% if (request.getParameter("f2") != null && request.getParameter("f2").equals(classNum)) { %>
					                selected
					            <% } %>
					        ><%= classNum %></option>
					        <%
					            }
					            if (classNumList.isEmpty()) {
					        %>
					        <option value="">学生リストが空です</option>
					        <%
					            }
					        %>
					    </select>
					</div>
                    <div class="col-3">
					    <label class="form-label" for="subject-select">科目</label>
					    <select class="form-select" id="subject-select" name="f3">
					        <%-- データベースから科目リストを取得し、それを選択肢として表示 --%>
					        <%
					            // 正しい属性名 "list" を使用して科目リストを取得する
					            List<Subject> list = (List<Subject>) request.getAttribute("list");
					            if (list != null && !list.isEmpty()) {
					                for (Subject subject : list) {
					        %>
					        <option value="<%= subject.getCd() %>"
					            <%-- f3 という名前のリクエストパラメータがある場合、それと一致する場合に選択状態にする --%>
					            <% if (request.getParameter("f3") != null && request.getParameter("f3").equals(subject.getCd())) { %>
					                selected
					            <% } %>
					        ><%= subject.getName() %></option>
					        <%
					                }
					            } else {
					        %>
					        <option value="">科目リストが空です</option>
					        <%
					            }
					        %>
					    </select>
					</div>

                    <!-- 絞り込みボタンやその他のフォーム項目は既存のものを利用 -->

                    <div class="col-2 text-center">
                        <button type="submit" class="btn btn-secondary" id="search-button">絞込み</button>
                    </div>

                </div>
            </form>

            <!-- 学生番号の検索フォーム -->
             <form method="get" action="/group-e_kanai/tester__/studentsearchservlet">
                <div class="row border mx-3 mb-3 py-2 align-items-center rounded">
               <div class="col-3">
					<label class="form-label" for="student-f3-select">学生番号</label>
					<select class="form-select" id="student-f3-select" name="f5">
					<%
										            List<String> NOList = new ArrayList<>();
										            List<Student> List = (List<Student>) request.getAttribute("studentList");
										            if (studentList != null) {
										                for (Student student : studentList) {
										                    NOList.add(student.getNo());
										                }
										            }

										            for (String No : NOList) {
										        %>
					<option value="<%= No %>"
					<%-- リクエストパラメータ f3 がある場合、それと一致する場合に選択状態にする --%>
					<% if (request.getParameter("f1") != null && request.getParameter("f1").equals(No)) { %>
										                selected
					<% } %>
					><%= No %></option>
					<%
										            }
										            if (NOList.isEmpty()) {
										        %>
					<option value="">学生リストが空です</option>
					<%
										            }
										        %>
					</select>
					</div>

                     <div class="col-2 text-center">
                        <button type="submit" class="btn btn-secondary" id="search-button">絞込み</button>
                    </div>
                </div>
            </form>

            <c:choose>
                <c:when test="${not empty tests}">
                    <div>検索結果: ${tests.size()}件</div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>入学年度</th>
                                <th>クラス</th>
                                <th>学生番号</th>
                                <th>氏名</th>
                                <th>得点</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="test" items="${tests}">
                                <tr>
                                    <td>${test.entYear}</td>
                                    <td>${test.classNum}</td>
                                    <td>${test.student.no}</td>
                                    <td>${test.subject.name}</td>
                                    <td>${test.point}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div>学生情報が存在しませんでした</div>
                </c:otherwise>
            </c:choose>
        </section>
    </c:param>
</c:import>

