package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Subject;
import bean.Test;

public class TestDao extends Dao {

	public List<Test> filter(int entYear, String classNum, Subject subject, int no) throws Exception {
		List<Test> list = new ArrayList<Test>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;


		try {
			statement = connection.prepareStatement(
				"select test.student_no,subject_cd,test.school_cd,test.no,point,test.class_num,update_date from test "
				+ "join student on test.student_no=student.no where subject_cd=? and test.no=? and test.class_num=? and ent_year=?"
			);
			statement.setString(1, subject.getCd());
			statement.setInt(2, no);
			statement.setString(3, classNum);
			statement.setInt(4, entYear);
			rSet = statement.executeQuery();
			if (rSet.next()) {
				StudentDao studentDao = new StudentDao();
				SubjectDao subjectDao = new SubjectDao();
				SchoolDao schoolDao = new SchoolDao();
				do {
					Test test = new Test();
					test.setStudent(studentDao.get(rSet.getString("student_no")));
					test.setSubject(subjectDao.get(rSet.getString("subject_cd")));
					test.setSchool(schoolDao.get(rSet.getString("school_cd")));
					test.setNo(rSet.getInt("no"));
					test.setPoint(rSet.getInt("point"));
					test.setClassNum(rSet.getString("class_num"));
					test.setUpdateDate(rSet.getDate("update_date"));
					list.add(test);
				} while (rSet.next());
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

}
