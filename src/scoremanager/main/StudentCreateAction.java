package scoremanager.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.ClassNumDao;
import tool.Action;

public class StudentCreateAction extends Action{

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        // 現在のセッションを取得
        HttpSession session = req.getSession();

        // セッションから現在ログイン中の教師の情報を取得
        // 'user' 属性には教師の情報が格納されていることを前提としています
        Teacher teacher = (Teacher) session.getAttribute("user");

        // クラス番号の情報を取得するためのDAOインスタンスを生成
        ClassNumDao cNumDao = new ClassNumDao();

        // DBからデータ取得
        // ログインユーザーの学校コードを基に、クラス番号の一覧を取得するメソッドを呼び出します
        // `filter` メソッドには学校コードが渡され、該当するクラス番号のリストが返されます
        List<String> list = cNumDao.filter(teacher.getSchool());

        // 取得したクラス番号のリストをセッション属性 'class_num_set' にセットします
        // このデータは JSP ページで利用され、クラス番号の選択肢として表示されます
        session.setAttribute("class_num_set", list);

        // JSP ページにフォワードします
        // 'student/student_registration.jsp' という JSP にリクエストを転送し、学生の登録フォームを表示します
        req.getRequestDispatcher("student_create.jsp").forward(req, res);
    }
}
