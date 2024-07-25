<%-- 成績管理JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    	<h2>成績管理</h2>
	    <div class="searchform">
		<form action="TestRegist.action" method="post">
			<select name="year">
				<option value="0">--------</option>
				<c:forEach var="year" items="${entYearSet}">
					<option value="${year}"<c:if test="${inputVal.year==year}"> selected</c:if>>${year}</option>
				</c:forEach>
			</select>
			<select name="num">
				<option value="">--------</option>
				<c:forEach var="num" items="${classNumSet}">
					<option value="${num}"<c:if test="${inputVal.num==num}"> selected</c:if>>${num}</option>
				</c:forEach>
			</select>
			<select name="subject">
				<option value="">--------</option>
				<c:forEach var="subject" items="${subjects}">
					<option value="${subject.cd}"<c:if test="${inputVal.subject==subject.cd}"> selected</c:if>>${subject.name}</option>
				</c:forEach>
			</select>
			<select name="no">
				<option value="0">--------</option>
				<c:forEach var="no" begin="1" end="2">
					<option value="${no}"<c:if test="${inputVal.no==no}"> selected</c:if>>${no}</option>
				</c:forEach>
			</select>
			<input type="hidden" name="flag" value="1">
			<input type="submit" value="検索">
		</form>
		</div>

		<p>${input_val_error}${none_list}</p>

		<c:if test="${!empty tests}">
			<p>科目：${tests.get(0).subject.name}(${tests.get(0).no}回)</p>

			<form action="TestRegistExecute.action" method="post">
				<table>
					<tr>
						<th>入学年度</th><th>クラス</th><th>学生番号</th><th>氏名</th><th>点数</th>
					</tr>
					<c:forEach var="test" items="${tests}">
						<tr>
							<td>${test.student.entYear}</td>
							<td>${test.classNum}</td>
							<td>${test.student.no}</td>
							<td>${test.student.name}</td>
							<td><input type="number" name="${test.student.no}_point" value="${test.point}"></td>
							<c:set var="point_err" value="${test.student.no}_point_error"/>
							<td>${requestScope[point_err]}</td>
						</tr>
					</c:forEach>
				</table>
				<input type="submit" value="登録して終了">
			</form>

		</c:if>
	</c:param>

</c:import>