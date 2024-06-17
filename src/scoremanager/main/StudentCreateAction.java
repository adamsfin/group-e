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
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");

		ClassNumDao cNumDao = new ClassNumDao();

		//DBからデータ取得 3
		// ログインユーザーの学校コードをもとにクラス番号の一覧を取得
		List<String> list = cNumDao.filter(teacher.getSchool());

		// リクエストにデータをセット
		session.setAttribute("class_num_set", list);
		//JSPへフォワード 7
		req.getRequestDispatcher("student/student_registration.jsp").forward(req, res);
	}

}
