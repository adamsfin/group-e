package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Test;

public class TestDao extends Dao {

	String baseSql = "select * from test";

	public List<Test> filter(int entYear, String classNum, Subject subject, School school, int no) throws Exception {
		List<Test> list = new ArrayList<Test>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;

		try {
			statement = connection.prepareStatement(
				"select test.student_no,subject_cd,test.no,point,test.class_num,update_date"
				+ " from test join student on test.student_no=student.no"
				+ " where subject_cd=? and test.school_cd=? and test.no=? and test.class_num=? and ent_year=?"
			);
			statement.setString(1, subject.getCd());
			statement.setString(2, school.getCd());
			statement.setInt(3, no);
			statement.setString(4, classNum);
			statement.setInt(5, entYear);
			rSet = statement.executeQuery();
			list = postFilter(rSet, school);
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

	private List<Test> postFilter(ResultSet rSet, School school) throws Exception {
		List<Test> list = new ArrayList<Test>();

		try {
			if (rSet.next()) {
				StudentDao studentDao = new StudentDao();
				SubjectDao subjectDao = new SubjectDao();
				Test test;
				do {
					test = new Test();
					test.setStudent(studentDao.get(rSet.getString("student_no")));
					test.setSubject(subjectDao.get(rSet.getString("subject_cd"), school));
					test.setSchool(school);
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
		}
		return list;
	}

	public Test get(Student student, Subject subject, School school, int no) throws Exception {
		Test test = new Test();
		Connection connection = getConnection();
		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(baseSql + " where student_no=? and subject_cd=? and school_cd=? and no=?");
			statement.setString(1, student.getNo());
			statement.setString(2, subject.getCd());
			statement.setString(3, school.getCd());
			statement.setInt(4, no);
			ResultSet rSet = statement.executeQuery();

			if (rSet.next()) {
				StudentDao studentDao = new StudentDao();
				SubjectDao subjectDao = new SubjectDao();
				test.setStudent(studentDao.get(rSet.getString("student_no")));
				test.setSubject(subjectDao.get(rSet.getString("subject_cd"), school));
				test.setSchool(school);
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
				test.setClassNum(rSet.getString("classNum"));
				test.setUpdateDate(rSet.getDate("update_date"));
			} else { test = null; }
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
		boolean old;
		int count = 0;

		try {
			for (Test test : list) {
				old = save(test, connection);
				if (old == false) {
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
				if (count < 1) { return false; }
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

	private boolean save(Test test, Connection connection) throws Exception {
		boolean result = false;
		PreparedStatement statement = null;

		try {
			statement = connection.prepareStatement(baseSql + " where student_no=? and subject_cd=? and school_cd=? and no=?");
			statement.setString(1, test.getStudent().getNo());
			statement.setString(2, test.getSubject().getCd());
			statement.setString(3, test.getSchool().getCd());
			statement.setInt(4, test.getNo());
			ResultSet rSet = statement.executeQuery();

			if (rSet.next()) { result = true; }
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
		return result;
	}

}
