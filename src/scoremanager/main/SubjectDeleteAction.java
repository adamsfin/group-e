package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDao;
import tool.Action;
import tool.Util;

public class SubjectDeleteAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SubjectDao dao = new SubjectDao();
		Util util = new Util();

		req.setAttribute("subject", dao.get(req.getParameter("cd"), util.getUser(req).getSchool()));

		req.getRequestDispatcher("subject_delete.jsp").forward(req, res);
	}

}
