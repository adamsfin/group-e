package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDao extends Dao {

	String baseSql = "select * from test";

	public List<TestListStudent> filter(Student student) throws Exception {
		List<TestListStudent> list;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet;

		try {
			statement = connection.prepareStatement(
				baseSql + " where student_no=? order by subject_cd,no");
			statement.setString(1, student.getNo());
			rSet = statement.executeQuery();

			if (rSet.next()) {
				list = postFilter(rSet);
			} else {
				list = null;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}

		return list;
	}

	private List<TestListStudent> postFilter(ResultSet rSet) throws Exception {
		List<TestListStudent> list = new ArrayList<>();
		TestListStudent testListStudent;
		SubjectDao subjectDao = new SubjectDao();
		SchoolDao schoolDao = new SchoolDao();

		do {
			testListStudent = new TestListStudent();
			testListStudent.setSubjectName(
				subjectDao.get(rSet.getString("subject_cd"), schoolDao.get(rSet.getString("school_cd"))).getName());
			testListStudent.setSubjectCd(rSet.getString("subject_cd"));
			testListStudent.setNum(rSet.getInt("no"));
			testListStudent.setPoint(rSet.getInt("point"));
			list.add(testListStudent);
		} while (rSet.next());

		return list;
	}

}
