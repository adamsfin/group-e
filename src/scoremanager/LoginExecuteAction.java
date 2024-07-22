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

		TeacherDao teachDao = new TeacherDao();
		Teacher teach = teachDao.login(req.getParameter("id"), req.getParameter("password"));

		if (teach==null) {
			req.setAttribute("loginerr_msg", "ログインに失敗しました。IDまたはパスワードが正しくありません。");
			req.getRequestDispatcher("login.jsp").forward(req, res);
		} else {
			HttpSession sessi = req.getSession();
			sessi.setAttribute("user", teach);
			res.sendRedirect("main.Menu.action");
		}

	}

}
