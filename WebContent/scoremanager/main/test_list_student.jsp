<%@page import="java.util.List, bean.TestListStudent"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>


<div class="student_name">氏名：${student.name}(${student.no})</div>

<c:if test="${testListStu!=null}">

	<table>
		<tr class="list_header">
			<th>科目名</th><th>科目コード</th><th>回数</th><th>点数</th>
		</tr>
		<c:forEach var="test" items="${testListStu}">
			<tr>
				<td>${test.subjectName}</td>
				<td>${test.subjectCd}</td>
				<td>${test.num}</td>
				<td>${test.point}</td>
			</tr>
		</c:forEach>
	</table>

</c:if>