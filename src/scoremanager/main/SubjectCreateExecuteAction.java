package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDao;
import tool.Action;
import tool.Util;

public class SubjectCreateExecuteAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String
			cd = request.getParameter("cd"),
			name = request.getParameter("name");
		if (cd.length()!=3) {
			request.setAttribute("cd_error", "科目コードは3文字で入力してください");
		} else {
			Util util = new Util();
			SubjectDao subjectDao = new SubjectDao();
			if ((subjectDao.get(cd, util.getUser(request).getSchool())) != null) {
				request.setAttribute("cd_error", "科目コードが重複しています");
			} else {
				Subject subject = new Subject();
				subject.setCd(cd);
				subject.setName(name);
				subject.setSchool(util.getUser(request).getSchool());
				subjectDao.save(subject);
				request.getRequestDispatcher("subject_create_done.jsp").forward(request, response);
				return;
			}
		}
		request.setAttribute("cd", cd);
		request.setAttribute("name", name);
		request.getRequestDispatcher("subject_create.jsp").forward(request, response);;
	}
}
