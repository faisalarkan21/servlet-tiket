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
import com.faisalarkan.model.Gabungan;
import com.faisalarkan.model.Statistik;




public class AdminDao {

	private Connection conn;
	private final String queryStatistik = "SELECT  ( \n" + 
			"     SELECT COUNT(*) \n" + 
			"    FROM   detil_pesan_tiket \n" + 
			"    ) AS totalUser, \n" + 
			"    ( \n" + 
			"    SELECT COUNT(*) \n" + 
			"    FROM   detil_pesan_tiket WHERE status = 0 \n" + 
			"    ) AS userBelumLunas,\n" + 
			"    ( \n" + 
			"    SELECT COUNT(*) \n" + 
			"    FROM   detil_pesan_tiket  WHERE status = 1 \n" + 
			"    ) AS userLunas, \n" + 
			"    ( \n" + 
			"    SELECT COUNT(*)\n" + 
			"    FROM   pembeli_validasi  WHERE uang_transfer_validasi > 0 \n" + 
			"    ) AS userValidasi,\n" + 
			"    ( \n" + 
			"     SELECT sum(total_transfer)\n" + 
			"    FROM   detil_pesan_tiket \n" + 
			"    ) AS uangDiterima, \n" + 
			"    ( \n" + 
			"     SELECT sum(harga_tiket)\n" + 
			"    FROM   detil_pesan_tiket \n" + 
			"    ) AS uangEstimasi;\n" ;

	private final String queryTableAllPembeli = "SELECT * FROM pembeli p \n" + 
			"INNER JOIN detil_pesan_tiket d on p.id_pembeli = d.id_pembeli \n" + 
			"INNER JOIN pembeli_validasi v on d.id_pembeli = v.id_pembeli \n" + 
			"WHERE p.id_pembeli;";

	private final String queryTablePembeliLunas = "SELECT * FROM pembeli p \r\n" + 
			"INNER JOIN detil_pesan_tiket d on p.id_pembeli = d.id_pembeli \r\n" + 
			"INNER JOIN pembeli_validasi v on d.id_pembeli = v.id_pembeli  \r\n" + 
			"where d.total_transfer != 0;";

	private final String queryTablePembeliBelumLunas = "SELECT * FROM pembeli p \r\n" + 
			"INNER JOIN detil_pesan_tiket d on p.id_pembeli = d.id_pembeli \r\n" + 
			"INNER JOIN pembeli_validasi v on d.id_pembeli = v.id_pembeli  \r\n" + 
			"where d.total_transfer = 0;";	

	private final String querykotakValidasi= "SELECT * FROM pembeli p \r\n" + 
			"INNER JOIN detil_pesan_tiket d on p.id_pembeli = d.id_pembeli \r\n" + 
			"INNER JOIN pembeli_validasi v on d.id_pembeli = v.id_pembeli  \r\n" + 
			"where v.uang_transfer_validasi != 0;";	





	public AdminDao() {
		conn = DBConfig.getConnection();
	}

	public Admin loginAdmin(String email) {
		Admin admin = new Admin();
		try {
			String query = "select * from admin where email_admin=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				admin.setNm_admin(resultSet.getString("nm_admin"));
				admin.setEmail_admin(resultSet.getString("email_admin"));
				admin.setPass_admin(resultSet.getString("pass_admin"));

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}

	public Statistik statistikUser() {
		Statistik statistik = new Statistik ();
		try {

			PreparedStatement preparedStatement = conn.prepareStatement(queryStatistik);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				statistik.setUserSemua(resultSet.getInt("totalUser"));
				statistik.setUserBelumLunas(resultSet.getInt("userBelumLunas"));
				statistik.setUserLunas(resultSet.getInt("userLunas"));
				statistik.setUserValidasi(resultSet.getInt("userValidasi"));
				statistik.setTotalUangDiterima(resultSet.getInt("uangDiterima"));
				statistik.setTotalEstimasiUang(resultSet.getInt("uangEstimasi"));
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statistik;
	}


	public List<Gabungan> getAllPembeli() {
		List<Gabungan> gabunganList = new ArrayList<Gabungan>();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(queryTableAllPembeli);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				Gabungan gabungan = new Gabungan();
				gabungan.setIdUser( resultSet.getInt("id_pembeli") );
				gabungan.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				gabungan.setEmail_pembeli( resultSet.getString( "email_pembeli" ));
				gabungan.setHp_pembeli(resultSet.getString( "hp_pembeli" ));
				gabungan.setTotal_transfer(resultSet.getDouble( "total_transfer" ));
				gabungan.setUang_transfer_validasi(resultSet.getDouble( "uang_transfer_validasi" ));
				gabungan.setPilihan_bank(resultSet.getString( "pilihan_bank" ));
				gabungan.setStatus(resultSet.getInt( "status" ));

				gabunganList.add(gabungan);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gabunganList;
	}


	public List<Gabungan> getPembeliLunas() {
		List<Gabungan> gabunganList = new ArrayList<Gabungan>();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(queryTablePembeliLunas);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				Gabungan gabungan = new Gabungan();
				gabungan.setIdUser( resultSet.getInt("id_pembeli") );
				gabungan.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				gabungan.setEmail_pembeli( resultSet.getString( "email_pembeli" ));
				gabungan.setHp_pembeli(resultSet.getString( "hp_pembeli" ));
				gabungan.setTotal_transfer(resultSet.getDouble( "total_transfer" ));
				gabungan.setUang_transfer_validasi(resultSet.getDouble( "uang_transfer_validasi" ));
				gabungan.setPilihan_bank(resultSet.getString( "pilihan_bank" ));
				gabungan.setStatus(resultSet.getInt( "status" ));

				gabunganList.add(gabungan);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gabunganList;
	}


	public List<Gabungan> getPembeliBelumLunas() {
		List<Gabungan> gabunganList = new ArrayList<Gabungan>();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(queryTablePembeliBelumLunas);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				Gabungan gabungan = new Gabungan();
				gabungan.setIdUser( resultSet.getInt("id_pembeli") );
				gabungan.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				gabungan.setEmail_pembeli( resultSet.getString( "email_pembeli" ));
				gabungan.setHp_pembeli(resultSet.getString( "hp_pembeli" ));
				gabungan.setTotal_transfer(resultSet.getDouble( "total_transfer" ));
				gabungan.setUang_transfer_validasi(resultSet.getDouble( "uang_transfer_validasi" ));
				gabungan.setPilihan_bank(resultSet.getString( "pilihan_bank" ));
				gabungan.setStatus(resultSet.getInt( "status" ));

				gabunganList.add(gabungan);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return gabunganList;
	}


	public List<Gabungan> getKotakValidasi() {
		List<Gabungan> gabunganList = new ArrayList<Gabungan>();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(querykotakValidasi);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				Gabungan gabungan = new Gabungan();
				gabungan.setIdUser( resultSet.getInt("id_pembeli") );
				gabungan.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				gabungan.setEmail_pembeli( resultSet.getString( "email_pembeli" ));
				gabungan.setHp_pembeli(resultSet.getString( "hp_pembeli" ));
				gabungan.setTotal_transfer(resultSet.getDouble( "total_transfer" ));
				gabungan.setUang_transfer_validasi(resultSet.getDouble( "uang_transfer_validasi" ));
				gabungan.setPilihan_bank(resultSet.getString( "pilihan_bank" ));
				gabungan.setStatus(resultSet.getInt( "status" ));

				gabunganList.add(gabungan);
			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return gabunganList;
	}

	public Gabungan getUserById(int pembeliId) {
		Gabungan pembeli = new Gabungan();

		try {
			String query = "select * from pembeli p INNER JOIN detil_pesan_tiket t on p.id_pembeli = t.id_pembeli  INNER JOIN pembeli_validasi v on v.id_pembeli = t.id_pembeli where p.id_pembeli = ?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setInt(1, pembeliId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {


				System.out.println(resultSet.getString( "nm_pembeli" ));

				pembeli.setIdUser( resultSet.getInt( "id_pembeli" ) );
				pembeli.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				pembeli.setEmail_pembeli( resultSet.getString( "email_pembeli" ) );
				pembeli.setPassword( resultSet.getString( "password" ));
				pembeli.setHp_pembeli( resultSet.getString( "hp_pembeli" ));
				pembeli.setGd_pembeli( resultSet.getString( "gd_pembeli" ));
				pembeli.setPilihan_bank( resultSet.getString( "pilihan_bank" ));
				pembeli.setHarga_tiket( resultSet.getDouble( "harga_tiket" ));
				pembeli.setTotal_transfer( resultSet.getDouble( "total_transfer" ));
				pembeli.setUang_transfer_validasi( resultSet.getDouble( "uang_transfer_validasi" ));
				pembeli.setBandara_berangkat(resultSet.getInt("bandara_berangkat"));
				pembeli.setBandara_tujuan(resultSet.getInt("bandara_tujuan"));
			}
			
			resultSet.close();
			preparedStatement.close();
			
			
			String queryBerangkat = "select * from pajak_bandara where id_bandara=?";
			PreparedStatement preparedStatementBerangkat = conn.prepareStatement( queryBerangkat );
			preparedStatementBerangkat.setInt(1, pembeli.getBandara_berangkat());
			ResultSet resultSetBerangkat = preparedStatementBerangkat.executeQuery();
			while( resultSetBerangkat.next() ) {
				pembeli.setNm_berangkat(resultSetBerangkat.getString("nm_bandara"));
				

			}
			resultSetBerangkat.close();
			preparedStatementBerangkat.close();
			
			
			String queryTujuan = "select * from pajak_bandara where id_bandara=?";
			PreparedStatement preparedStatementTujuan = conn.prepareStatement( queryTujuan );
			preparedStatementTujuan.setInt(1, pembeli.getBandara_tujuan());
			ResultSet resultSetTujuan = preparedStatementTujuan.executeQuery();
			while( resultSetTujuan.next() ) {
				
				pembeli.setNm_tujuan(resultSetTujuan.getString("nm_bandara"));

			}
			resultSetTujuan.close();
			preparedStatementTujuan.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pembeli;
	}


	public void updatePembeliLunas( Gabungan pembeli ) {

		try {

			String queryPembeli = "update detil_pesan_tiket set total_transfer=?, status=? where id_pembeli=?";
			PreparedStatement preparedStatement = conn.prepareStatement( queryPembeli );

			System.out.println(pembeli.getTotal_transfer());
			System.out.println(pembeli.getStatus());
			System.out.println( pembeli.getIdUser());

			preparedStatement.setDouble( 1, pembeli.getTotal_transfer() );
			preparedStatement.setInt( 2, pembeli.getStatus() );			
			preparedStatement.setInt( 3, pembeli.getIdUser() );

			preparedStatement.executeUpdate();
			preparedStatement.close();		

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}




	public void deleteUser( int usertId ) {
		try {
			String query = "delete from pembeli where id_pembeli=?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, usertId);
			preparedStatement.executeUpdate();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



	// @Override
	// public void addStudent( Student student ) {
	// try {
	// String query = "insert into student (firstName, lastName) values (?,?)";
	// PreparedStatement preparedStatement = conn.prepareStatement( query );
	// preparedStatement.setString( 1, student.getFirstName() );
	// preparedStatement.setString( 2, student.getLastName() );
	//
	// preparedStatement.executeUpdate();
	// preparedStatement.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// @Override

	// @Override
	// public void updateStudent( Student student ) {
	// try {
	// String query = "update student set firstName=?, lastName=?, course=?, year=?
	// where studentId=?";
	// PreparedStatement preparedStatement = conn.prepareStatement( query );
	// preparedStatement.setString( 1, student.getFirstName() );
	// preparedStatement.setString( 2, student.getLastName() );
	// preparedStatement.setString( 3, student.getCourse() );
	// preparedStatement.setInt( 4, student.getYear() );
	// preparedStatement.setInt(5, student.getStudentId());
	// preparedStatement.executeUpdate();
	// preparedStatement.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// @Override
	// public List<Student> getAllStudents() {
	// List<Student> students = new ArrayList<Student>();
	// try {
	// Statement statement = conn.createStatement();
	// ResultSet resultSet = statement.executeQuery( "select * from student" );
	// while( resultSet.next() ) {
	// Student student = new Student();
	// student.setStudentId( resultSet.getInt( "studentId" ) );
	// student.setFirstName( resultSet.getString( "firstName" ) );
	// student.setLastName( resultSet.getString( "lastName" ) );
	//
	// students.add(student);
	// }
	// resultSet.close();
	// statement.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// return students;
	// }
	// @Override
	// public Student getStudentById(int studentId) {
	// Student student = new Student();
	// try {
	// String query = "select * from student where studentId=?";
	// PreparedStatement preparedStatement = conn.prepareStatement( query );
	// preparedStatement.setInt(1, studentId);
	// ResultSet resultSet = preparedStatement.executeQuery();
	// while( resultSet.next() ) {
	// student.setStudentId( resultSet.getInt( "studentId" ) );
	// student.setFirstName( resultSet.getString( "firstName" ) );
	// student.setLastName( resultSet.getString( "LastName" ) );
	// student.setCourse( resultSet.getString( "course" ) );
	// student.setYear( resultSet.getInt( "year" ) );
	// }
	// resultSet.close();
	// preparedStatement.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// return student;
	// }

}