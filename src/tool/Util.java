package tool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.ClassNumDao;
import dao.Dao;
import dao.SubjectDao;

public class Util {

	public Teacher getUser(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		return (Teacher)session.getAttribute("user");
	}

	public void setClassNumSet(HttpServletRequest request) throws Exception {
		ClassNumDao classNumDao = new ClassNumDao();
		request.setAttribute("classNumSet", classNumDao.filter(getUser(request).getSchool()));
	}

	public void setEntYearSet(HttpServletRequest request) throws Exception {
		dao.Dao dao = new Dao();
		Connection connection = dao.getConnection();
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(
				"select distinct ent_year from student where school_cd=? order by ent_year");
			statement.setString(1, getUser(request).getSchool().getCd());
			ResultSet set = statement.executeQuery();
			List<Integer> entYear = new ArrayList<>();
			while (set.next()) {
				entYear.add(set.getInt("ent_year"));
			}
			request.setAttribute("entYearSet", entYear);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connection.close();
			if (statement!=null)
				statement.close();
		}
	}

	public void setSubjects(HttpServletRequest request) throws Exception {
		SubjectDao subjectDao = new SubjectDao();
		request.setAttribute("subjects", subjectDao.filter(getUser(request).getSchool()));
	}

}
