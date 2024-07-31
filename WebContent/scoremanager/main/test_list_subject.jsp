<%@page import="java.util.List, bean.TestListSubject"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<div class="subject_name">科目：${subject.name}(${subject.cd})</div>

<%
	@SuppressWarnings("unchecked")
	List<TestListSubject> list = (List<TestListSubject>)request.getAttribute("testListSub");
%>

<table class="table table-hover">
	<tr class="list_header">
		<th>入学年度</th><th>クラス</th><th>学生番号</th><th>氏名</th><th>１回</th><th>２回</th>
	</tr>

	<% for (TestListSubject test : list) { %>
		<tr>
			<td><%= test.getEntYear() %></td>
			<td><%= test.getClassNum() %></td>
			<td><%= test.getStudentNo() %></td>
			<td><%= test.getStudentName() %></td>
			<td><%= test.getPoints().get(1) == null ? "-" : test.getPoint(1) %></td>
			<td><%= test.getPoints().get(2) == null ? "-" : test.getPoint(2) %></td>
		</tr>
	<% } %>
</table>