
<%-- 学生一覧JSP --%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- 文字化けの対策 --%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
	<c:param name="title">
		<h2 class="page-title">学生情報変更</h2>
	</c:param>

	<c:param name="scripts"></c:param>

	<c:param name="content">

		<div class="contents">

			<section class="mo-4">
				<form action ="StudentUpdateExecute.action" method="post">
					<div class="d-flex flex-column border mx-3 mb-3 py-2 px-4 align-items-start rounded" id="filter">
						<div class="mb-3">
							<label class="form-label" for="ent_year">入学年度</label>
							<span id="ent_year">${ent_year}</span>
							<input type="hidden" id="ent_year" name="ent_year" value="${ent_year}">
						</div>
						<div class="mb-3">
							<label class="form-label" for="student_id">学生番号</label>
							<span id="student_id_display">${no}</span>
							<input type="hidden" id="student_no" name="no" value="${no}">
						</div>
						<div class="mb-3">
							<label class="form-label" for="name">氏名</label>
							<input type="text" id="name" name="name" placeholder="氏名を入力してください" maxlength="10" required class="form-control" value="${name}">
						</div>
						<div class="mb-3">
							<label class="form-label" for="classnum">クラス</label>
							<select id="class_num" name="class_num" class="form-select">
								<c:forEach var="num" items="${class_num_set}">
									<option value="${num}"<c:if test="${num==cNum}"> selected</c:if>>${num}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-3 form-check">
							<input class="form-check-input" type="checkbox" id="is_attend" name="is_attend" value="true" <c:if test="${!empty attend}">checked</c:if> />
							<label class="form-check-label ms-2" for="isattend">在学中</label>
						</div>
						<div class="mb-3 text-center">
							<button type="submit" class="btn btn-secondary" id="filter-button">変更</button>
						</div>
						<div class="mt-2 text-warning">${errors.get("f1")}</div>
					</div>
				</form>

				<!-- 戻るリンク -->
				<div>
					<a href="StudentList.action">戻る</a>
				</div>
			</section>
		</div>

	</c:param>
</c:import>
