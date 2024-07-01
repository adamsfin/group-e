package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subject;
import bean.Teacher;
import dao.SubjectDao;
import tool.Action;

public class SubjectUpdateAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");

//		科目コードを受け取る
		String cd = req.getParameter("cd");
//		String id = (String)session.getAttribute("id");

		SubjectDao subjectDao = new SubjectDao();

//		科目の詳細情報を取得
		Subject subject = subjectDao.get(cd, teacher.getSchool());

		// リクエストにデータをセット
		session.setAttribute("subject", subject);
		//JSPへフォワード
		req.getRequestDispatcher("subject/subject_update.jsp").forward(req, res);
	}

}
