package com.faisalarkan.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.faisalarkan.config.DBConfig;
import com.faisalarkan.model.Gabungan;
import com.faisalarkan.model.User;




public class UserDao  {

	private Connection conn;

	public UserDao() {
		conn = DBConfig.getConnection();
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





	public void addPembeli( Gabungan pembeli ) {
		try {
			String queryPembeli = "insert into pembeli (nm_pembeli, email_pembeli, password, hp_pembeli, gd_pembeli ) values (?,?,?,?,?)";
			PreparedStatement preparedStatementPembeli = conn.prepareStatement( queryPembeli );
			preparedStatementPembeli.setString( 1, pembeli.getNm_pembeli() );
			preparedStatementPembeli.setString( 2, pembeli.getEmail_pembeli() );
			preparedStatementPembeli.setString( 3, pembeli.getPassword() );
			preparedStatementPembeli.setString( 4, pembeli.getHp_pembeli() );
			preparedStatementPembeli.setString( 5, pembeli.getGd_pembeli());

			preparedStatementPembeli.executeUpdate();
			preparedStatementPembeli.close();


			String queryTgl = "insert into tgl_pesan (tgl_order) values (?)";
			PreparedStatement preparedStatementTgl = conn.prepareStatement( queryTgl );
			preparedStatementTgl.setString( 1, pembeli.getTgl_order() );			

			preparedStatementTgl.executeUpdate();
			preparedStatementTgl.close();


			String queryDetail = "insert into detil_pesan_tiket (harga_tiket,total_transfer,pilihan_bank,bandara_berangkat,bandara_tujuan) values (?,?,?,?,?)";

			PreparedStatement preparedStatementDetail = conn.prepareStatement( queryDetail );
			preparedStatementDetail.setDouble( 1, pembeli.getHarga_tiket() );
			preparedStatementDetail.setDouble( 2, pembeli.getTotal_transfer() );
			preparedStatementDetail.setString( 3, pembeli.getPilihan_bank() );
			preparedStatementDetail.setInt( 4, pembeli.getBandara_berangkat() );
			preparedStatementDetail.setInt( 5, pembeli.getBandara_tujuan());



			preparedStatementDetail.executeUpdate();
			preparedStatementDetail.close();



			String queryValidasi = "insert into pembeli_validasi (nm_pembeli, email_pembeli, hp_pembeli, uang_transfer_validasi) values (?,?,?,?)";

			PreparedStatement preparedStatementValidasi = conn.prepareStatement( queryValidasi );
			preparedStatementValidasi.setString( 1, pembeli.getNm_pembeli() );
			preparedStatementValidasi.setString( 2, pembeli.getEmail_pembeli() );
			preparedStatementValidasi.setString( 3, pembeli.getHp_pembeli() );
			preparedStatementValidasi.setDouble( 4, pembeli.getUang_transfer_validasi() );


			preparedStatementValidasi.executeUpdate();
			preparedStatementValidasi.close();


		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public User loginUser(String email) {
		User pembeli = new User();
		try {
			String query = "select * from pembeli where email_pembeli=?";
			PreparedStatement preparedStatement = conn.prepareStatement( query );
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while( resultSet.next() ) {
				pembeli.setIdPembeli(resultSet.getInt( "id_pembeli" ) );
				pembeli.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				pembeli.setEmail_pembeli( resultSet.getString( "email_pembeli" ) );
				pembeli.setPassword( resultSet.getString( "password" ) );

			}
			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pembeli;
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

				pembeli.setNm_pembeli( resultSet.getString( "nm_pembeli" ) );
				pembeli.setEmail_pembeli( resultSet.getString( "email_pembeli" ) );
				pembeli.setHp_pembeli( resultSet.getString( "hp_pembeli" ));
				pembeli.setPilihan_bank( resultSet.getString( "pilihan_bank" ));
				pembeli.setHarga_tiket( resultSet.getDouble( "harga_tiket" ));
				pembeli.setUang_transfer_validasi( resultSet.getDouble( "uang_transfer_validasi" ));
				pembeli.setBandara_berangkat(resultSet.getInt( "bandara_berangkat" ));
				pembeli.setBandara_tujuan(resultSet.getInt( "bandara_tujuan" ));
				pembeli.setTotal_transfer(resultSet.getDouble( "total_transfer" ));
							
			}

			

			
			String queryBerangkat = "select * from pajak_bandara where id_bandara=?";
			PreparedStatement preparedStatementBerangkat = conn.prepareStatement( queryBerangkat );
			preparedStatementBerangkat.setInt(1, pembeli.getBandara_berangkat());
			ResultSet resultSetBerangkat = preparedStatementBerangkat.executeQuery();
			while( resultSetBerangkat.next() ) {
				pembeli.setNm_berangkat(resultSetBerangkat.getString("nm_bandara"));
				pembeli.setHargaBerangkat(resultSetBerangkat.getDouble("pajak"));
				

			}
			resultSetBerangkat.close();
			preparedStatementBerangkat.close();
			
			
			String queryTujuan = "select * from pajak_bandara where id_bandara=?";
			PreparedStatement preparedStatementTujuan = conn.prepareStatement( queryTujuan );
			preparedStatementTujuan.setInt(1, pembeli.getBandara_tujuan());
			ResultSet resultSetTujuan = preparedStatementTujuan.executeQuery();
			while( resultSetTujuan.next() ) {
				
				pembeli.setNm_tujuan(resultSetTujuan.getString("nm_bandara"));
				pembeli.setHargaTujuan(resultSetTujuan.getDouble("pajak"));
			}
			resultSetTujuan.close();
			preparedStatementTujuan.close();
			
			

			resultSet.close();
			preparedStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pembeli;
	}

	public void updatePembeli( Gabungan pembeli ) {
		try {

			String queryPembeli = "update pembeli set nm_pembeli=?, email_pembeli=?, hp_pembeli=? where id_pembeli=?";
			PreparedStatement preparedStatement = conn.prepareStatement( queryPembeli );
			preparedStatement.setString( 1, pembeli.getNm_pembeli() );
			preparedStatement.setString( 2, pembeli.getEmail_pembeli() );
			preparedStatement.setString( 3, pembeli.getHp_pembeli() );
			preparedStatement.setInt( 4, pembeli.getIdUser() );

			preparedStatement.executeUpdate();
			preparedStatement.close();		

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateValidasi( Gabungan pembeli ) {
		try {

			System.out.println(pembeli.getIdUser()+ "ini id " );

			String queryPembeli = "update pembeli_validasi set uang_transfer_validasi=?, pilihan_bank=? where id_pembeli=?";
			PreparedStatement preparedStatement = conn.prepareStatement( queryPembeli );
			preparedStatement.setDouble( 1, pembeli.getUang_transfer_validasi() );
			preparedStatement.setString( 2, pembeli.getPilihan_bank());
			preparedStatement.setInt( 3, pembeli.getIdUser() );

			preparedStatement.executeUpdate();
			preparedStatement.close();		

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

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


}