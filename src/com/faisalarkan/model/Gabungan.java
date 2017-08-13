package com.faisalarkan.model;

public class Gabungan {

	private int idUser;
	private String nm_pembeli;	
	private String email_pembeli;	
	private String password;
	private String hp_pembeli;
	private String gd_pembeli;
	
	private double uang_transfer_validasi;
	private String pilihan_bank;

	private String tgl_order;
	
	private double harga_tiket;
	private double total_transfer;
	private int bandara_berangkat;
	private int bandara_tujuan;
	
	private String nm_tujuan;
	private String nm_berangkat; 
	
	
	
	public String getNm_tujuan() {
		return nm_tujuan;
	}
	public void setNm_tujuan(String nm_tujuan) {
		this.nm_tujuan = nm_tujuan;
	}
	public String getNm_berangkat() {
		return nm_berangkat;
	}
	public void setNm_berangkat(String nm_berangkat) {
		this.nm_berangkat = nm_berangkat;
	}
	private int status;
	
	
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getTgl_order() {
		return tgl_order;
	}
	public void setTgl_order(String tgl_order) {
		this.tgl_order = tgl_order;
	}
	public String getNm_pembeli() {
		return nm_pembeli;
	}
	public void setNm_pembeli(String nm_pembeli) {
		this.nm_pembeli = nm_pembeli;
	}
	public String getEmail_pembeli() {
		return email_pembeli;
	}
	public void setEmail_pembeli(String email_pembeli) {
		this.email_pembeli = email_pembeli;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHp_pembeli() {
		return hp_pembeli;
	}
	public void setHp_pembeli(String hp_pembeli) {
		this.hp_pembeli = hp_pembeli;
	}
	public String getGd_pembeli() {
		return gd_pembeli;
	}
	public void setGd_pembeli(String gd_pembeli) {
		this.gd_pembeli = gd_pembeli;
	}
	public double getUang_transfer_validasi() {
		return uang_transfer_validasi;
	}
	public void setUang_transfer_validasi(double uang_transfer_validasi) {
		this.uang_transfer_validasi = uang_transfer_validasi;
	}
	public String getPilihan_bank() {
		return pilihan_bank;
	}
	public void setPilihan_bank(String pilihan_bank) {
		this.pilihan_bank = pilihan_bank;
	}
	public double getHarga_tiket() {
		return harga_tiket;
	}
	public void setHarga_tiket(double harga_tiket) {
		this.harga_tiket = harga_tiket;
	}
	public double getTotal_transfer() {
		return total_transfer;
	}
	public void setTotal_transfer(double total_transfer) {
		this.total_transfer = total_transfer;
	}
	public int getBandara_berangkat() {
		return bandara_berangkat;
	}
	public void setBandara_berangkat(int bandara_berangkat) {
		this.bandara_berangkat = bandara_berangkat;
	}
	public int getBandara_tujuan() {
		return bandara_tujuan;
	}
	public void setBandara_tujuan(int bandara_tujuan) {
		this.bandara_tujuan = bandara_tujuan;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
			
	
	
}
