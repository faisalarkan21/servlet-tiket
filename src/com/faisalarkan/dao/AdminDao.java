package com.faisalarkan.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.faisalarkan.config.DBConfig;
import com.faisalarkan.model.Admin;
import com.faisalarkan.model.Statistik;
import com.faisalarkan.model.User;

;

public class AdminDao  {

	private Connection conn;

	public AdminDao() {
		conn = DBConfig.getConnection();
	}


	public Admin loginAdmin(String email) {
		Admin admin = new Admin();
		try {
			String query = "select * from admin where email_admin=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {				
				admin.setNm_admin( resultSet.getString( "nm_admin" ) );
				admin.setEmail_admin(resultSet.getString( "email_admin" ) );
				admin.setPass_admin(resultSet.getString( "pass_admin" ) );


			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}


	public double getIdBandara(int idBandara) {
		double hargaBandara = 0;
		try {
			String query = "select * from pajak_bandara where id_bandara=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, idBandara);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				hargaBandara = resultSet.getDouble("pajak");

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hargaBandara;
	}
	
	
	public Statistik loginAdmin(Statistik statistik) {
		Admin admin = new Admin();
		try {
			String query = "select * from admin where email_admin=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {				
				admin.setNm_admin( resultSet.getString( "nm_admin" ) );
				admin.setEmail_admin(resultSet.getString( "email_admin" ) );
				admin.setPass_admin(resultSet.getString( "pass_admin" ) );


			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}




	//	@Override
	//	public void addStudent( Student student ) {
	//		try {
	//			String query = "insert into student (firstName, lastName) values (?,?)";
	//			PreparedStatement preparedStatement = conn.prepareStatement( query );
	//			preparedStatement.setString( 1, student.getFirstName() );
	//			preparedStatement.setString( 2, student.getLastName() );
	//		
	//			preparedStatement.executeUpdate();
	//			preparedStatement.close();
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}
	//	}
	//	@Override
	//	public void deleteStudent( int studentId ) {
	//		try {
	//			String query = "delete from student where studentId=?";
	//			PreparedStatement preparedStatement = conn.prepareStatement(query);
	//			preparedStatement.setInt(1, studentId);
	//			preparedStatement.executeUpdate();
	//			preparedStatement.close();
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}
	//	}
	//	@Override
	//	public void updateStudent( Student student ) {
	//		try {
	//			String query = "update student set firstName=?, lastName=?, course=?, year=? where studentId=?";
	//			PreparedStatement preparedStatement = conn.prepareStatement( query );
	//			preparedStatement.setString( 1, student.getFirstName() );
	//			preparedStatement.setString( 2, student.getLastName() );
	//			preparedStatement.setString( 3, student.getCourse() );
	//			preparedStatement.setInt( 4, student.getYear() );
	//			preparedStatement.setInt(5, student.getStudentId());
	//			preparedStatement.executeUpdate();
	//			preparedStatement.close();
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}
	//	}
	//	@Override
	//	public List<Student> getAllStudents() {
	//		List<Student> students = new ArrayList<Student>();
	//		try {
	//			Statement statement = conn.createStatement();
	//			ResultSet resultSet = statement.executeQuery( "select * from student" );
	//			while( resultSet.next() ) {
	//				Student student = new Student();
	//				student.setStudentId( resultSet.getInt( "studentId" ) );
	//				student.setFirstName( resultSet.getString( "firstName" ) );
	//				student.setLastName( resultSet.getString( "lastName" ) );
	//				
	//				students.add(student);
	//			}
	//			resultSet.close();
	//			statement.close();
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}
	//		return students;
	//	}
	//	@Override
	//	public Student getStudentById(int studentId) {
	//		Student student = new Student();
	//		try {
	//			String query = "select * from student where studentId=?";
	//			PreparedStatement preparedStatement = conn.prepareStatement( query );
	//			preparedStatement.setInt(1, studentId);
	//			ResultSet resultSet = preparedStatement.executeQuery();
	//			while( resultSet.next() ) {
	//				student.setStudentId( resultSet.getInt( "studentId" ) );
	//				student.setFirstName( resultSet.getString( "firstName" ) );
	//				student.setLastName( resultSet.getString( "LastName" ) );
	//				student.setCourse( resultSet.getString( "course" ) );
	//				student.setYear( resultSet.getInt( "year" ) );
	//			}
	//			resultSet.close();
	//			preparedStatement.close();
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}
	//		return student;
	//	}

}