<%-- 成績管理JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2>成績管理</h2>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">

		<div class="searchform">
		<form action="TestRegist.action" method="post">
			<div>
				<label class="form-label" for="test-f1-select">入学年度</label>
				<select name="f1">
					<option value="0">--------</option>
					<c:forEach var="year" items="${entYearSet}">
						<option value="${year}"<c:if test="${inputVal.year==year}"> selected</c:if>>${year}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<label class="form-label" for="test-f2-select">クラス</label>
				<select name="f2">
					<option value="">--------</option>
					<c:forEach var="num" items="${classNumSet}">
						<option value="${num}"<c:if test="${inputVal.num==num}"> selected</c:if>>${num}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<label class="form-label" for="test-f3-select">科目</label>
				<select name="f3">
					<option value="">--------</option>
					<c:forEach var="subject" items="${subjects}">
						<option value="${subject.cd}"<c:if test="${inputVal.subject==subject.cd}"> selected</c:if>>${subject.name}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<label class="form-label" for="test-f4-select">回数</label>
				<select name="f4">
					<option value="0">--------</option>
					<c:forEach var="no" begin="1" end="2">
						<option value="${no}"<c:if test="${inputVal.no==no}"> selected</c:if>>${no}</option>
					</c:forEach>
				</select>
			</div>
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