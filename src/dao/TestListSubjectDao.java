package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.School;
import bean.Subject;
import bean.TestListSubject;

public class TestListSubjectDao extends Dao {

	String baseSql = "select * from test";

	public List<TestListSubject> filter(int entYear, String classNum, Subject subject, School school) throws Exception {
		List<TestListSubject> list;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet;

		try {
			statement = connection.prepareStatement(
				"select ent_year,student.no,student.name,student.class_num,t1.point as point1,t2.point as point2 from"
				+ " (select * from student where ent_year=? and class_num=? and school_cd=?) student"
				+ " left join (select * from test where subject_cd=? and school_cd=? and no=1) t1 on student.no=t1.student_no"
				+ " left join (select * from test where subject_cd=? and school_cd=? and no=2) t2 on student.no=t2.student_no"
			);
			statement.setInt(1, entYear);
			statement.setString(2, classNum);
			statement.setString(3, school.getCd());
			statement.setString(4, subject.getCd());
			statement.setString(5, school.getCd());
			statement.setString(6, subject.getCd());
			statement.setString(7, school.getCd());
			rSet = statement.executeQuery();
			list = postFilter(rSet);
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

	private List<TestListSubject> postFilter(ResultSet rSet) throws Exception {
		List<TestListSubject> list = new ArrayList<TestListSubject>();

		try {
			if (rSet.next()) {
				TestListSubject testListSubject;
				Map<Integer, Integer> points;
				Integer point;
				do {
					points = new HashMap<>();
					testListSubject = new TestListSubject();
					testListSubject.setEntYear(rSet.getInt("ent_year"));
					testListSubject.setStudentNo(rSet.getString("no"));
					testListSubject.setStudentName(rSet.getString("name"));
					testListSubject.setClassNum(rSet.getString("class_num"));
					point = rSet.getInt("point1");
					if (rSet.wasNull()) { point = null; }
					points.put(1, point);
					point = rSet.getInt("point2");
					if (rSet.wasNull()) { point = null; }
					points.put(2, point);
					testListSubject.setPoints(points);
					list.add(testListSubject);
				} while (rSet.next());
			} else {
				list = null;
			}
		} catch (Exception e) {
			throw e;
		}
		return list;
	}


}
