<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
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
</head>
<body>
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

    <!-- ${param.title}, ${param.scripts}, ${param.content} を挿入 -->
    ${param.title}
    ${param.scripts}
    ${param.content}

</body>
</html>
