package scoremanager.main;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDao;
import scoremanager.Util;
import tool.Action;

public class SubjectUpdateExecuteAction extends Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String
			cd = request.getParameter("cd"),
			name = request.getParameter("name");
		SubjectDao subjectDao = new SubjectDao();
		Util util = new Util();
		if ((subjectDao.get(cd, util.getUser(request).getSchool()))!=null) {
			Subject subject = new Subject();
			subject.setCd(cd);
			subject.setName(name);
			subject.setSchool(util.getUser(request).getSchool());
			subjectDao.save(subject);
			request.getRequestDispatcher("subject_update_done.jsp").forward(request, response);
		} else {
			request.setAttribute("subject_error", "科目が存在していません");
			request.setAttribute("inputVal", new HashMap<String, String>(){{
				put("cd", cd);
				put("name", name);
			}});
			request.getRequestDispatcher("subject_update.jsp");
		}
	}

}
