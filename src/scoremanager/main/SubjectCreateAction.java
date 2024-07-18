package scoremanager.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import tool.Action;

public class SubjectCreateAction extends Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request. getSession();
		Teacher teacher = (Teacher)session.getAttribute("user");
//		System.out.print(teacher);

		request.getRequestDispatcher("/scoremanager/main/subject_create.jsp").forward(request, response);



	}
}
