package scoremanager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDao;
import tool.Action;

public class LoginExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		TeacherDao teacherDao = new TeacherDao();
		Teacher teacher = teacherDao.login(req.getParameter("id"), req.getParameter("password"));

		if (teacher==null) {
			// ログインに失敗した場合のエラーメッセージと、入力したIDをリクエスト属性に設定する
			req.setAttribute("loginerr_msg", "ログインに失敗しました。IDまたはパスワードが正しくありません。");
			req.setAttribute("id", req.getParameter("id"));
			// 再度login.jspにリクエストをフォワードする
			req.getRequestDispatcher("login.jsp").forward(req, res);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("user", teacher);

			res.sendRedirect("main/Menu.action");
		}

	}

}
