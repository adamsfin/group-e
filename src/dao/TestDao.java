package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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
				"select test.student_no,subject_cd,test.school_cd,test.no,point,test.class_num,update_date"
				+ " from test join student on test.student_no=student.no"
				+ " where subject_cd=? and test.no=? and test.class_num=? and ent_year=?"
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


	private Test get(Test old_test) throws Exception {
		Test test = new Test();
		Connection connection = getConnection();
		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement("select * from test where student_no=? and subject_cd=? and no=?");
			statement.setString(1, old_test.getStudent().getNo());
			statement.setString(2, old_test.getSubject().getCd());
			statement.setInt(3, old_test.getNo());
			ResultSet rSet = statement.executeQuery();

			if (rSet.next()) {
				StudentDao studentDao = new StudentDao();
				SubjectDao subjectDao = new SubjectDao();
				SchoolDao schoolDao = new SchoolDao();
				test.setStudent(studentDao.get(rSet.getString("student_no")));
				test.setSubject(subjectDao.get(rSet.getString("subject_cd")));
				test.setSchool(schoolDao.get(rSet.getString("school_cd")));
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
				test.setClassNum(rSet.getString("classNum"));
				test.setUpdateDate(rSet.getDate("update_date"));
			} else {
				test = null;
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

		return test;
	}


	public boolean save(List<Test> list) throws Exception {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;

		try {
			for (Test test : list) {
				Test old = get(test);
				if (old == null) {
					statement = connection.prepareStatement(
						"insert into test(student_no, subject_cd, school_cd, no, point, class_num, update_date) values(?, ?, ?, ?, ?, ?, ?)");
					statement.setString(1, test.getStudent().getNo());
					statement.setString(2, test.getSubject().getCd());
					statement.setString(3, test.getSchool().getCd());
					statement.setInt(4, test.getNo());
					statement.setInt(5, test.getPoint());
					statement.setString(6, test.getClassNum());
					statement.setDate(7, Date.valueOf(LocalDate.now()));
				} else {
					statement = connection.prepareStatement(
						"update test set point=?, update_date=? where student_no=? and subject_cd=? and no=?");
					statement.setInt(1, test.getPoint());
					statement.setDate(2, Date.valueOf(LocalDate.now()));
					statement.setString(3, test.getStudent().getNo());
					statement.setString(4, test.getSubject().getCd());
					statement.setInt(5, test.getNo());
				}

				count = statement.executeUpdate();
				if (count < 1) {
					return false;
				}
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

		return true;
	}

}
