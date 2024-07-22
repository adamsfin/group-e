package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDao;
import scoremanager.Util;
import tool.Action;

public class SubjectDeleteExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SubjectDao dao = new SubjectDao();
		Util util = new Util();
		dao.delete(dao.get(req.getParameter("cd"), util.getUser(req).getSchool()));
		req.getRequestDispatcher("subject_delete_done.jsp").forward(req, res);
	}

}
