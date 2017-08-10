<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


  <jsp:include page="../WEB-INF/partials/header-user.jsp" />

<style>
	.form-group {
		margin: 0 0 0 0 !important;
	}
</style>
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="row well" style=" margin-top: 50px; padding-bottom: 40px;">

			<div class="col-md-12">
				<h1 class="judul halprofile">Prosedur Pembayaran <i style="padding-left: 15px; font-size: 60px;" class="fa fa-sitemap  fa-lg" aria-hidden="true"></i>
				</h1>
				<br>
			</div>
			<div class="col-md-12 ">
				<div class="col-lg-12">
					<label style="font-size: 22px;">   Haiii .. <code> <%=session.getAttribute("user") %> </code><i style="padding-left: 5px;font-size: 20px;" class="fa fa-bell" aria-hidden="true"></i>
 </label>
					<hr>
				</div>
				<div class="col-lg-12" style="margin-left: 15px; margin-top: -10px; line-height: 30px;">


					<div style="font-size: 15px;" class="col-lg-13">
						<p>Terima kasih telah memesan tiket dengan sistem E-Ticket silahkan melakukan <code> instruksi pembayaran dengan cara berikut ini :  </code></p>
					</div>
					<div style="padding-left: 40px;" class="col-md-10 " style="vertical-align: middle;">
						<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code> Pastikan</code> data pada bagian data pembeli telah benar lalu <code> klik tombol Submit </code> 
</label>
						<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code> Transfer uang </code> ke rekening yang tersedia dibawah ini :  </label>
						<div style="padding-left: 27px;" class="col-md-9 ">
							<label id="bank"><i class="fa fa-credit-card" aria-hidden="true"></i>
 BCA - NO REKENING <code style="font-size: 15px;"> 98080986643 </code> - Faisal Arkan </label>
							<label id="bank"><i class="fa fa-credit-card" aria-hidden="true"></i>
BRI - NO REKENING <code style="font-size: 15px;"> 78787878741 </code> - Sativa Ken </label>
						</div>
						<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code> Kirim Valdasi Tiket</code> pada bagian Validasi Tiket <code> klik tombol Kirim Tiket  </code> 
</label>
						<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Admin mengecek</code> rekening yang anda pilih dan <code> Mengirimkan email konfirmasi ke alamat email anda. </code> 
</label>
						<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Selanjutnya silahkan anda menghadiri </code> bootcamp node.js <code> karena nama anda sudah kami sudah disimpan. </code>
</label>


					</div>

					<div style="font-size: 15px;" class="col-lg-12">
						<p>Terima Kasih Sudah menggunakan layanan kami .. <i class="fa fa-smile-o" aria-hidden="true"></i>
						</p>
					</div>
				</div>
			</div>
		</div>


		<div class="row well" style=" margin-top: 50px; padding-bottom: 100px;">


			<div class="col-md-12">
				<h1 class="judul halprofile">Apa saja yang akan dipelajari ? <i style="padding-left: 15px;" class="fa fa-free-code-camp  fa-lg" aria-hidden="true"></i>
				</h1>
				<hr>

			</div>



			<div class="col-lg-12" style="margin-left: 15px; margin-top: -10px; line-height: 30px;">


				<div style="font-size: 15px;" class="col-lg-13">
					<p>Kami akan memberikan pengajaran tetang <code> teknologi termutahir dari Node.js,</code> seperti berikut ini : </p>
				</div>
				<div style="padding-left: 40px;" class="col-md-11" style="vertical-align: middle;">
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Pembelajaran Ecmascript 7</code> untuk menunjang pelajaran dasar dari javascript  
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Node.js v7.7.4 </code> mempelajari versi terbaru dari node.js.  </label>

					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>React.js</code> mempelajari teknologi open source dari facebook yang sangat powerful.
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Angular 2</code> pelajari teknologi google dengan cepat. 
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Database NoSQL Ex. Mongodb  </code> mempelajari lebih dalam tentang mongodb penggunaanya pada industri software.
					
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Github  </code> mempelajari tentang pentingnya version control dalam mengembangkan program dengan kerja tim.
</label>

					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Express.js  </code> Membangun applikasi Node.js dengan framework Express.js yang sangat reliable.
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>JQuery Dan AJAX  </code> mempelajari tools dasar pengembangan web untuk kebutuhan mendesak.
</label>


				</div>


			</div>



		</div>

		<div class="row well" style=" margin-top: 50px; padding-bottom: 100px;">


			<div class="col-md-12">
				<h1 class="judul halprofile">Tata tertib Bootcamp <i style="padding-left: 15px;" class="fa fa-cogs  fa-lg" aria-hidden="true"></i>
				</h1>
				<hr>

			</div>



			<div class="col-lg-12" style="margin-left: 15px; margin-top: -10px; line-height: 30px;">


				<div style="font-size: 15px;" class="col-lg-13">
					<p>Bootcamp akan dilakukan dalam 12 minggu <code> dengan pembelajaran yang sangat intensif</code> berikut peraturannya
						: </p>
				</div>
				<div style="padding-left: 40px;" class="col-md-11" style="vertical-align: middle;">
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Diharapkan Datang tepat waktu Jam 7.00 Pagi</code>, kami tidak akan mengulang materi bagi yang tertinggal.  
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Diperbolehkan membawa laptop sendiri </code> agar lebih nyaman.  </label>

					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Peserta tidak boleh meninggalan gedung pelatihan</code> jika belum sampai jam 18.00 sore.
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Kami menyediakan akomondasi makan dari pagi hari hingga sore</code> dengan stok cadangan yang cukup. 
</label>		
				</div>

				<div style="font-size: 15px; margin-top: 15px;" class="col-md-12">
					<p><code>Bootcamp akan dibagi menjadi 3 stage</code> setiap 4 minggu, berikut jadwalnya : </p>
				</div>
				<div style="padding-left: 40px;" class="col-md-11" style="vertical-align: middle;">
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Minggu ke - 1. Mempelajari dasar dari Ecmascript 7</code> seperti function arrow dan lain - lain. 
					
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Minggu ke - 2. Mempelajari node.js dan framework yang dibutuhkan</code> untuk web development. 
</label>

					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Minggu ke - 3. Mempelajari database berbasis NoSQL dan SQL</code> untuk semua syntax dan softwarenya. 
</label>
					<label id="panduan"><i class="fa fa-angle-double-right " aria-hidden="true"></i> <code>Minggu ke - 4. Mempelajari Version Control Ex. Github</code> agar dapat bekerja secara tim dengan baik. 
</label>
				</div>

			</div>


		</div>



	</div>

	<div class="row well" style=" margin-top: 50px; padding-bottom: 60px;">
		<div class="col-lg-12">


			<div class="col-md-12">
				<h1 class="judul halprofile">Lokasi Bootcamp <i style="padding-left: 15px;" class="fa fa-globe fa-lg" aria-hidden="true"></i>
				</h1>
				<hr>
				<br>
			</div>
			<div class="col-md-12 ">


				<div class="col-lg-12" style="margin-left: 15px; margin-top: -10px; line-height: 30px;">

					<div class="col-md-10">


						<label for="">Berikut ini adalah lokasi bootcamp node.js : </label>
					</div>
					<div class="col-md-10 " style="margin-top: 20px;">
						<iframe id="mapKonser" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63431.87365358485!2d106.64782527219214!3d-6.459162803701716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69e7849a168057%3A0x9aaa58ad730a1b7b!2sCiseeng%2C+Bogor%2C+West+Java!5e0!3m2!1sen!2sid!4v1482654121182"
						    width="750" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
					</div>
				</div>
			</div>
		</div>


	</div>


</div>
<!-- /#page-content-wrapper -->
</div>
</body>
 <jsp:include page="../WEB-INF/partials/footer.jsp" />  

</html>