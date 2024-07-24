<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:import url="/common/base.jsp">
    <c:param name="title">
        <h1 class="toptitle">科目管理システム</h1>
    </c:param>
    <c:param name="scripts">
        <script type="text/javascript">
            $(function(){
                $("#test-submit-button").click(function(){
                    $("#test-form").submit();
                });

                let input = $("input[type='number']");
                input.on("keydown",function(e){
                    let n = input.length;
                    if (e.which == 13){
                        e.preventDefault();
                        let index = input.index(this);
                        let nextIndex = index + 1;
                        if (nextIndex < n) {
                            input[nextIndex].focus();
                            input[nextIndex].select();
                        } else {
                            input[index].blur();
                        }
                    }
                });
            });
        </script>
    </c:param>
    <c:param name="content">
        <section class="me-4">
            <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4">成績管理</h2>

            <form method="get">
                <div class="form-row">
                    <label class="form-label" for="test-f1-select">入学年度</label>
                    <select class="form-select" id="test-f1-select" name="f1">
                        <option value="0">-------</option>
                        <c:forEach var="year" items="${ent_year_set}">
                            <option value="${year}" <c:if test="${year==f1}">selected</c:if>>${year}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-row">
                    <label class="form-label" for="test-f2-select">クラス</label>
                    <select class="form-select" id="test-f2-select" name="f2">
                        <option value="0">-------</option>
                        <c:forEach var="num" items="${ent_num_set}">
                            <option value="${num}" <c:if test="${num==f2}">selected</c:if>>${num}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-row">
                    <label class="form-label" for="test-f3-select">科目</label>
                    <select class="form-select" id="test-f3-select" name="f3">
                        <option value="0">-------</option>
                        <c:forEach var="subject" items="${subjects}">
                            <option value="${subject.cd}" <c:if test="${subject.cd==f3}">selected</c:if>>${subject.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-row">
                    <label class="form-label" for="test-f4-select">回数</label>
                    <select class="form-select" id="test-f4-select" name="f4">
                        <option value="0">-------</option>
                        <c:forEach var="num" items="${num_set}">
                            <option value="${num}" <c:if test="${num==f4}">selected</c:if>>${num}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-row text-center">
                    <button class="btn btn-secondary" id="filter-button">検索</button>
                </div>
                <div class="mt-2 text-warning">${errors.get("filter")}</div>
            </form>
            <c:choose>
                <c:when test="${tests.size()>0}">
                    <c:if test="${!empty done}">
                        <div class="bg-success bg-opacity-50 text-center">
                            <p>${done}</p>
                        </div>
                    </c:if>
                    <form method="post" id="test-form" action="TestRegistExecute.action">
                        <div>科目:${subject.name} (${num}回)</div>
                        <table class="table table-hover">
                            <tr>
                                <th>入学年度</th>
                                <th>クラス</th>
                                <th>学生番号</th>
                                <th>氏名</th>
                                <th>点数</th>
                                <th class="text-center">削除</th>
                            </tr>
                            <c:forEach var="test" items="${tests}">
                                <tr>
                                    <td>${test.student.entYear}</td>
                                    <td>${test.student.classNum}</td>
                                    <td>${test.student.no}</td>
                                    <td>${test.student.name}</td>
                                    <td>
                                        <input type="number" name="point_${test.student.no}"
                                            <c:choose>
                                                <c:when test="${input_points.containsKey(test.student.no)}">
                                                    value="${input_points.get(test.student.no)}"
                                                </c:when>
                                                <c:otherwise>
                                                    value="${test.point != -1 ? test.point : ''}"
                                                </c:otherwise>
                                            </c:choose> />
                                        <div class="mt-2 text-warning">${errors.get(test.student.no)}</div>
                                        <input type="hidden" name="student_no_set[]" value="${test.student.no}">
                                    </td>
                                    <td class="text-center">
                                        <input class="form-check-input" type="checkbox" name="delete_${test.student.no}">
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <input type="hidden" id="test-subject-cd-hidden" name="subject_cd" value="${subject.cd}"/>
                        <input type="hidden" id="test-num-hidden" name="num" value="${num}"/>
                        <input type="hidden" id="test-f1-hidden" name="f1" value="${f1}"/>
                        <input type="hidden" id="test-f2-hidden" name="f2" value="${f2}"/>
                        <input type="hidden" id="test-f3-hidden" name="f3" value="${f3}"/>
                        <input type="hidden" id="test-f4-hidden" name="f4" value="${f4}"/>
                        <div class="mt-3">
                            <input class="btn btn-primary" type="submit" value="登録して再度入力" name="continue">
                            <input class="btn btn-secondary" type="submit" value="登録して終了" name="end">
                        </div>
                    </form>
                </c:when>
                <c:when test="${tests.size()==0}">
                    <div>学生情報が存在しませんでした</div>
                </c:when>
            </c:choose>
        </section>
    </c:param>
</c:import>
