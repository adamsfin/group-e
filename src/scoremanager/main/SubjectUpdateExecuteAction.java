package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectUpdateExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		SubjectDao subjectDao = new SubjectDao();
		Subject subject = (Subject)session.getAttribute("subject");

		subject.setName(req.getParameter("name"));
		subject.setCd(req.getParameter("cd"));

		boolean bool = subjectDao.save(subject);

		if (bool == true) {
			//JSPへフォワード
			req.getRequestDispatcher("subject/subject_update_done.jsp").forward(req, res);
		}
	}

}
