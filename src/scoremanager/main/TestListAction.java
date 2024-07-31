package scoremanager.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.TestListStudent;
import bean.TestListSubject;
import dao.StudentDao;
import dao.SubjectDao;
import dao.TestListStudentDao;
import dao.TestListSubjectDao;
import tool.Action;
import tool.Util;

public class TestListAction extends Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flag = request.getParameter("f");
		if (flag!=null) {
			if (flag.equals("sj")) {
				setTestListSubject(request, response);
			} else if (flag.equals("st")) {
				setTestListStudent(request, response);
			}
		}

		Util util = new Util();
		util.setEntYearSet(request);
		util.setClassNumSet(request);
		util.setSubjects(request);

		request.getRequestDispatcher("test_list.jsp").forward(request, response);
	}

	private void setTestListSubject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer entYear = Integer.parseInt(request.getParameter("f1"));
		String	classNum = request.getParameter("f2"),
				subjectCd = request.getParameter("f3");

		request.setAttribute("ent_year", entYear);
		request.setAttribute("cNum", classNum);
		request.setAttribute("subCd", subjectCd);

		if (entYear!=0 && !classNum.equals("") && !subjectCd.equals("")) {
			Teacher user = (Teacher)request.getSession().getAttribute("user");
			SubjectDao subjectDao = new SubjectDao();
			TestListSubjectDao testListSubjectDao = new TestListSubjectDao();
			Subject subject = subjectDao.get(subjectCd, user.getSchool());
			List<TestListSubject> list = testListSubjectDao.filter(
				entYear, classNum, subject, user.getSchool());
			if (list!=null) {
				request.setAttribute("subject", subject);
				request.setAttribute("testListSub", list);
			} else {
				request.setAttribute("none_list", "学生情報が存在しませんでした");
			}
		} else {
			request.setAttribute("inputVal_error", "入学年度とクラスと科目を入力してください");
		}
	}

	private void setTestListStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StudentDao studentDao = new StudentDao();
		String studentNo = request.getParameter("f4");

		request.setAttribute("f4", studentNo);

		Student student = studentDao.get(studentNo);
		if (student!=null) {
			request.setAttribute("student", student);
			TestListStudentDao testListStudentDao = new TestListStudentDao();
			List<TestListStudent> list = testListStudentDao.filter(student);
			request.setAttribute("testListStu", list);
			if (list==null) {
				request.setAttribute("none_list", "成績情報が存在しませんでした");
			}
		} else {
			request.setAttribute("none_list", "学生情報が存在しませんでした");
		}
	}
}
