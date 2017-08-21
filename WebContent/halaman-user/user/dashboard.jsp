<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


  <jsp:include page="../../WEB-INF/partials/header-user.jsp" />

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

	</div>


</div>
<!-- /#page-content-wrapper -->
</div>
</body>
 <jsp:include page="../../WEB-INF/partials/footer.jsp" />  

</html>