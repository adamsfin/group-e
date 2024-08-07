package scoremanager.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Test;
import dao.TestDao;
import tool.Action;

public class TestRegistExecuteAction extends Action {

	@Override
	@SuppressWarnings("unchecked")
	public void execute ( HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		List<Test> list = new ArrayList<Test>();
		List<Test> updateList = new ArrayList<>();
		int point;
		boolean pError = false;
		for (Test test : (List<Test>)session.getAttribute("tests")) {
			try {
				point = Integer.parseInt(request.getParameter(test.getStudent().getNo()+"_point"));
				if (point>100 || point<0) {
					throw new NumberFormatException();
				} else if (test.getPoint()==null || test.getPoint()!=point) {
					test.setPoint(point);
					updateList.add(test);
				}
			} catch (NumberFormatException e) {
				request.setAttribute(test.getStudent().getNo()+"_point_error", "0～100の範囲で入力してください");
				pError = true;
			}
			list.add(test);
		}
		if (pError) {
			session.setAttribute("tests", list);
			request.getRequestDispatcher("TestRegist.action").forward(request, response);
			return;
		}

		session.removeAttribute("tests");
		if(updateList!=null) {
			TestDao testDao = new TestDao();
			testDao.save(list);
		}
		request.getRequestDispatcher("test_regist_done.jsp").forward(request, response);

	}

}
