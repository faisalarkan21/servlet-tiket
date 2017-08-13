<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="../../WEB-INF/partials/header-admin.jsp" />


<div class="table-users col-md-10 col-md-offset-2 container">
	<div style="margin-top: 70px;"
		class="page-header text-center well col-md-12">
		<div>
			<div class="col-md-10 col-md-offset-1">
				<h1 style="font-size: 30px;" class="judul">Detail Informasi
					Pembeli</h1>

				<hr class="Garistema">

			</div>


			<div style="margin-top: -20px;" class="col-md-10">

				<div class="col-md-9 col-md-offset-1" style="margin-bottom: -15px;">


					<br> <label style="margin-left: 16px;" class="control-label ">
						Data Pribadi</label>
					<hr class="garisbagian">

				</div>

				<div class="col-md-12 col-md-offset-1">
					<form class="daftar form-horizontal text-center"
						action="<%=request.getContextPath()%>/AdminController?action=updateDetail&userId=${dataPembeli.idUser}"
						method="post">
						<div class="col-md-4">
							<div id="ketikEmail" class="form-group {{error}}">

								<div class="input-group ">

									<span class="input-group-addon"><i
										class="fa fa-user-circle-o fa-lg detailDashIcon"
										aria-hidden="true"></i></span> <label for="nama "
										class="control-label"> Nama Peserta </label> <input
										class="form-control " name="nama" placeholder="Nama Anda"
										type="name" id="nama" value="${dataPembeli.nm_pembeli}">
								</div>
							</div>
						</div>
						<div class="col-md-4 col-md-offset-1">
							<div id="ketikPass" class="form-group  {{error}}">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope fa-lg detailDashIcon" aria-hidden="true"></i></span>
									<label for="email " class="control-label"> Email
										Peserta </label> <input class="form-control" name="email"
										placeholder="Email Anda" type="email" id="email"
										value="${dataPembeli.email_pembeli}">
								</div>
							</div>
						</div>
						<div class="col-md-4 ">
							<div id="ketikEmail" class="form-group {{error}}">
								<div class="input-group ">
									<span class="input-group-addon"><i
										class="fa fa-eye-slash fa-lg detailDashIcon"
										aria-hidden="true"></i></span> <label for="password "
										class="control-label"> Password Peserta</label> <input
										class="form-control " name="password" placeholder="Password"
										type="text" id="password" value="${dataPembeli.password}">
								</div>
							</div>
						</div>

						<div class="col-md-4 col-md-offset-1">
							<div id="ketikEmail" class="form-group {{error}}">
								<div class="input-group ">
									<span class="input-group-addon"><i
										class="fa fa-phone-square fa-lg detailDashIcon"
										aria-hidden="true"></i></span> <label for="hp " class="control-label">
										No Handphone</label> <input class="form-control " name="no_hp"
										placeholder="No Handphone" id="hp" type="text"
										value="${dataPembeli.hp_pembeli}">
								</div>
							</div>
						</div>
						<div class="col-md-4 " style="margin-left: 4px;">
							<div id="ketikEmail" class="form-group  {{error}}">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-user fa-lg detailDashIcon" aria-hidden="true"></i></span>
									<label for="gender " class="control-label"> Gender</label> <input
										class="form-control " name="gender" placeholder="gender"
										type="text" id="gender" value="${dataPembeli.gd_pembeli}"
										readonly>
								</div>
							</div>
						</div>

						<div style="margin-left: -15px;">


							<div class="col-md-9" style="margin-top: 25px;">

								<br> <label style="margin-left: 15px;"
									class="control-label"> Metode Pembayaran</label>
								<hr class="garisbagian">

							</div>
							<div class="col-md-12" style="margin-top: -30px;">

								<div class="col-md-12 ">




									<div id="ketikEmail" class="form-group {{error}} col-md-9">
										<div class="input-group col-md-9">
											<label for="metode " class="control-label"> Metode
												Pembayaran</label> <input class="form-control " name="hp"
												placeholder="No Handphone" type="text"
												value="${dataPembeli.pilihan_bank}" readonly>

										</div>
									</div>


									<div id="ketikEmail" class="form-group {{error}} col-md-5">
										<div class="input-group col-md-8">
											<label for="harga " class="control-label"> Harga
												Tiket</label> <input class="form-control " name="hargaTiket" id="harga"
												placeholder="Biaya" type="text"
												value="<%=request.getAttribute("hargaTiket")%>" readonly>

										</div>
									</div>


									<div id="ketikEmail"
										class="form-group {{error}} col-md-5 col-md-offset-1">
										<div class="input-group col-md-8">
											<label for="harga " class="control-label"> Kotak
												Validasi </label>


											<c:choose>
												<c:when test="${dataPembeli.uang_transfer_validasi != 0}">
													<input class="form-control " name="harga" id="harga"
														placeholder="Biaya" type="text" value="Sudah Konfirmasi"
														readonly>
												</c:when>
												<c:otherwise>
													<input class="form-control " name="harga" id="harga"
														placeholder="Biaya" type="text" value="Belum Konfirmasi"
														readonly>

												</c:otherwise>
											</c:choose>


										</div>
									</div>


									<div id="ketikEmail" class="form-group {{error}} col-md-5 ">
										<div class="input-group col-md-8">
											<label for="harga " class="control-label"> Uang
												Transfer</label> <input class="form-control " name="uangTotalTransfer"
												id="uangtf" placeholder="Biaya" type="text" value="<%=request.getAttribute("totalTransfer")%>" readonly />

										</div>
									</div>

									<div style="margin-top: 60px;" class="col-md-6 ">
										<div class="input-group col-md-8">

											<div class="togglebutton">
												<label for="lunasCheck"> <c:choose>
														<c:when
															test="${dataPembeli.total_transfer == dataPembeli.harga_tiket}">
															<input type="checkbox" id="lunasCheck" checked />
															<label id="labelCheck" for=""> Lunas</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox" id="lunasCheck" />
															<label id="labelCheck" for=""> Belum Lunas</label></label>

												</c:otherwise>
												</c:choose>


												</label>

											</div>
										</div>
									</div>




								</div>

							</div>
						</div>


						<div style="padding-bottom: 30px; padding-left: 20px;"
							class="col-md-10 col-md-offset-1">

							<br> <br> <a
								href="/admin/dashboard/send-email/{{userDetail.id_pembeli}}"
								class="btn btn-primary btn-raised col-md-10">Beritahukan
								Lewat Email</a> <a
								style="color: white !important; background-color: #ef5350 !important;"
								href="#" class="btn btn-raised col-md-10" data-toggle="modal"
								data-target="#modal">Hapus Peserta</a>
							<div style="padding-left: 25px;" class="col-md-offset-2">
								<a class=" btn btn-raised btn-info btn-md" href="<%=request.getContextPath()%>/AdminController?action=getAllPembeli">
									Kembali</a>
								<button style="margin-left: 10px;"
									class="btn btn-raised btn-primary " type="submit">
									Submit</button>


							</div>

						</div>


						<div style="padding-top: 140px;" id="modal" class="modal">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">�</button>
										<h4 class="modal-title">Hapus Data Peserta</h4>
									</div>
									<div class="modal-body">
										<p>Anda yakin akan menghapus ${dataPembeli.nm_pembeli}
											dari daftar penerbangan ?</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-raised btn-primary"
											data-dismiss="modal">Batal</button>
										<button
											style="color: white !important; background-color: #ef5350 !important;"
											type="button" class="btn btn-raised btn-primary"
											data-dismiss="modal" id="btnHapus">Hapus peserta</button>
									</div>
								</div>
							</div>

						</div>
				</div>

			</div>

			</form>
			<br> <br> <br> <br>


		</div>



	</div>





</div>


</div>
</div>
</div>

</body>




<jsp:include page="../../WEB-INF/partials/footer.jsp" />


<script>
    $(document).ready(function () {


        $("#lunasCheck").change(function () {
                if (this.checked) {
                    console.log("Dicekliks");
                    $("#labelCheck").html("Lunas");
                    $("#uangtf").val("<%=request.getAttribute("hargaTiket")%>");
                    }
                    else {
                        console.log("Kaga diceklis");
                        $("#labelCheck").html(
                            "Belum Lunas");
                        $("#uangtf").val('0');
                    }
                });

            $("#btnHapus")
            .click(
                function () {
                    var request = $
                        .ajax({
                            url: "http://127.0.0.1:8080/<%=request.getContextPath()%>/AdminController?action=deleteDetail&userId=${dataPembeli.idUser}",
                            type: "POST",
                            success: window.location
                                .replace("http://127.0.0.1:8080/<%=request.getContextPath()%>/AdminController?action=getAllPembeli")

                        });
                })



	});
</script>



</html>
