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
		HttpSession session = req.getSession();
		TeacherDao teacherDao = new TeacherDao();
		Teacher teacher = teacherDao.login(req.getParameter("id"), req.getParameter("password"));


		if (teacher==null) {
//			System.out.println("ssssss");
			req.setAttribute("loginerr_msg", "ログインに失敗しました。IDまたはパスワードが正しくありません。");
			req.getRequestDispatcher("login.jsp").forward(req, res);
		}

		else {
//			System.out.println("sss");


			session.setAttribute("user", teacher);


			req.getRequestDispatcher("/main/menu.jsp").forward(req,res);
		}



	}

}
