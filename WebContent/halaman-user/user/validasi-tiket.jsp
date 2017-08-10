<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="row">
			<div class="col-md-12">
				<h1 class="judul">Validasi Tiket <i style="padding-left: 15px; font-size: 40px;	padding-top: 25px;" class="fa fa-shield " aria-hidden="true"></i>
				</h1>
				<br>
			</div>
			<div class="col-lg-12">
				<form class="" method="post" action="<%=request.getContextPath()%>/UserController?action=validasi-tiket&userId=<%=session.getAttribute("id")%>">
					<fieldset>
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">Form Validasi </h3>
							</div>
							<div class="panel-body">
								<div class="col-md-12">
									<legend class="control-label">* Submit Tiket Validasi </legend>
									<hr>
								</div>
								<div class="col-md-4 ">
									<div class="form-group ">
										<label class="control-label" for="">Nama </label>
										<div class="form-input">
											<input class="form-control" type="text" name="nama" value="<c:out value="${dataPembeli.nm_pembeli}" />">
										</div>
									</div>
								</div>
								<div class="col-md-4 col-md-offset-1">
									<div class="form-group ">
										<label class="control-label" for="">Email</label>
										<div class="form-input">
											<input class="form-control" type="text" name="email" value="${dataPembeli.email_pembeli}">
										</div>
									</div>
								</div>
								<div class="col-md-4 ">
									<div class="form-group has-warning ">
										<label class="control-label" for="inputWarning">No Handphone</label>
										<div class="form-input">
											<input class="form-control" type="text" name="hp" value="${dataPembeli.hp_pembeli}">
										</div>
									</div>
								</div>

								<div class="col-md-4 col-md-offset-1">
									<div class="form-group has-warning ">
										<label class="control-label" for="inputWarning">Harga Tiket</label>
										<div class="form-input">
											<input class="form-control" id="hargaTiket" type="text" name="hargaTiketTotal" value="${dataPembeli.harga_tiket}"  readonly>
										</div>
									</div>
								</div>
								<div class="col-md-5 ">
									<div class="form-group ">
										<label class="control-label" for="bank">Pilihan Bank </label>
										<div class="form-input">
											<input readonly class="form-control" type="text" name="hpUtama" value="${dataPembeli.pilihan_bank}">
										</div>
									</div>
								</div>
							</div>
									<br>
								
						</div>
						<!-- orang 2 -->
						<!-- Orang Sekunder -->
						<div class="col-md-offset-9">
							
							
							<%  
							
							
							if (((Boolean)request.getAttribute("isSend"))) {   %>

							<button type="submit" class="btn btn-raised btn-info" disabled>Anda Sudah Mengirim Tiket</button>
							<% } else { %>
							<button type="submit" class="btn btn-raised btn-info" >Kirim Tiket Konfirmasi</button>

							<% }   %>
							
						</div>
						<br>
						<br>
						<br>
					</fieldset>  
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /#page-content-wrapper -->
</div>
</body>
 <jsp:include page="../../WEB-INF/partials/footer.jsp" /> 
</html>