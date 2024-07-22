<%-- 科目変更JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 文字化けの対策 --%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
	<c:param name="title">
		<h1 class="toptitle">得点管理システム</h1>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">
		<section class="mo-4">
			<h2>科目情報変更</h2>
			<form action ="/group-e/scoremanager.main.SubjectUpdateExecute.action" method="post">
				<div class="d-flex flex-column border mx-3 mb-3 py-2 px-4 align-items-start rounded" id="filter">
				<%-- 科目コード表示 --%>
				<div class="mb-3">
				<label class="form-label" for="cd">科目コード</label>
				<span id="cd">${subject.cd}</span>
				<input type="hidden" id="cd" name="cd" value="${subject.cd}">
				</div>
				<%-- 科目名入力 --%>
				<div class="mb-3">
				<label class="form-label" for="name">科目名</label>
				<input type="text" id="name" name="name" placeholder="科目名を入力してください" required class="form-control" value="${subject.name}">
				</div>
				<%-- 変更ボタン --%>
				<div class="mb-3 text-center">
				<button type="submit" class="btn btn-secondary" id="filter-button">変更</button>
				</div>
				<div class="mt-2 text-warning">${errors.get("f1")}</div>
				</div>
			</form>

			<%-- 戻るリンク --%>
			<div>
				<a href="subject_list.jsp">戻る</a>
			</div>
		</section>
	</c:param>
</c:import>
