package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectDeleteExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		SubjectDao subjectDao = new SubjectDao();
		Subject subject = (Subject)session.getAttribute("subject");

		boolean bool = subjectDao.delete(subject);

		if (bool == true) {
			//JSPへフォワード
			req.getRequestDispatcher("subject/subject_delete_done.jsp").forward(req, res);
		}
	}

}
