package scoremanager.main;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Test;
import dao.SubjectDao;
import dao.TestDao;
import tool.Action;
import tool.Page;

public class TestUpdateAction extends Action {

	@Override
	public void execute ( HttpServletRequest req, HttpServletResponse res ) throws Exception {
		HttpSession session = req.getSession();
		session.setAttribute("", 0);
		TestDao testDao = new TestDao();
		SubjectDao subjectDao = new SubjectDao();
		List<Test> list = testDao.filter(2023, "131", subjectDao.get("A02"), 1);
		for (Test test : list) {
			System.out.println(test.getStudent().getNo());
		}
		PrintWriter out = res.getWriter();
		Page.header(out);
		out.println("処理");
		Page.footer(out);

	}

}
