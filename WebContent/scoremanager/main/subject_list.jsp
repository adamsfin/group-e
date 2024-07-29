<%-- 学生一覧JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:import url="/common/base.kyoutuu.jsp">
    <c:param name="title">
		<div class="my-2 text-end px-4">
			<a href="SubjectCreate.action">新規登録</a>
		</div>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">

		<!-- メインコンテンツ -->
		<table class="table table-hover">
			<tr>
				<th>科目コード</th>
				<th>科目名</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<c:forEach var="subject" items="${subjects}">
				<tr>
					<td>${subject.cd}</td>
					<td>${subject.name}</td>
					<td class="text-center">
					</td>
					<td><a href="SubjectUpdate.action?cd=${subject.cd}">変更</a></td>
					<td><a href="SubjectDelete.action?cd=${subject.cd}">削除</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:param>

</c:import>