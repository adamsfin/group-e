package scoremanager.main;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import bean.Test;
import dao.SubjectDao;
import dao.TestDao;
import scoremanager.Util;
import tool.Action;

public class TestRegistAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getParameter("flag")!=null) {
			String
				num = request.getParameter("f2"),
				subject = request.getParameter("f3");
			Integer
				year = Integer.parseInt(request.getParameter("f1")),
				no = Integer.parseInt(request.getParameter("f4"));

			request.setAttribute("inputVal",
				new HashMap<String, String>() {{
					put("year", year.toString());
					put("subject", subject);
					put("num", num);
					put("no", no.toString());
				}}
			);

			if (year==0 || no==0 || num.equals("") || subject.equals("")) {
				request.setAttribute("input_val_error", "入学年度とクラスと科目と回数を選択してください");

			} else {

				HttpSession session = request.getSession();
				Teacher user = (Teacher)session.getAttribute("user");
				SubjectDao subjectDao = new SubjectDao();
				TestDao testDao = new TestDao();

				List<Test> list = testDao.filter(
						year, num, subjectDao.get(subject, user.getSchool()), user.getSchool(), no);

				if (list==null)
					request.setAttribute("none_list", "該当する学生情報がありません");
				else
					session.setAttribute("tests", list);
			}

		}
		setRequestData(request, response);
		request.getRequestDispatcher("test_regist.jsp").forward(request, response);

	}

	private void setRequestData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Util util = new Util();
		util.setEntYearSet(request);
		util.setClassNumSet(request);
		util.setSubjects(request);
	}

}
