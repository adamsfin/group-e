<%-- 学生一覧JSP --%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<head>
	<style>
		.num {
			margin-top: 15px;
		}

		section {
			margin-left: 10px;
		}
	</style>
</head>


<body>
	<c:import url="/common/base.jsp">
		<c:param name="title">
			<h2 class="page-title">退学者一覧</h2>
		</c:param>

		<c:param name="scripts">
			<script type="text/javascript">
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
		</c:param>

		<c:param name="content">
			<div class="contents">
				<section class="mo-4">
					<c:choose>
						<c:when test="${do_students.size()>0}">
							<div class="num">件数:${do_students.size()}件</div>

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

								<c:forEach var="student" items="${do_students}">
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
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</table>

						</c:when>

						<c:otherwise>
							<div>学生情報が存在しませんでした</div>
						</c:otherwise>

					</c:choose>
				</section>
			</div>
		</c:param>

	</c:import>
</body>
