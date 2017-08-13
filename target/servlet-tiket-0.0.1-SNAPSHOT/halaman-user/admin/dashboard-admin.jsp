<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="../../WEB-INF/partials/header-admin.jsp" />

<div style="padding-top: 55px;" class="container">
	<div class="col-md-11 well  col-md-offset-2">
		<div class="col-md-11">
			<h1 class="judul">
				<i style="padding-right: 30px;"
					class="fa fa-area-chart    fa-fw fa-lg" aria-hidden="true"></i>
				Statistik Penjualan Tiket
			</h1>
			<hr class="">
		</div>
		<!--<div style="padding-right: 30px;" class="col-md-10    ">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">Diagram Pendapatan</h3>
                </div>
                <div id="my-chart" class="panel-body ">
                  
                </div>
            </div>
        </div>-->
		<div style="padding-left: 15px;" class="col-md-5">

			<div class="panel   panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Jumlah Penjualan Tiket</h3>
				</div>
				<div class="panel-body panel-dashboard-chart">
					<ul class="tulisTiket" style="padding-left: 15px;">

						<li class="panah" style="list-style-type: none;">Tiket
							Terjual <code class="" style="margin-left: 35px;">${dataStatistik.userSemua}</code>
							Tiket
						</li>

					</ul>
				</div>
			</div>

			<div class="panel  panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Jumlah Status Tiket Terbayar</h3>
				</div>
				<div class="panel-body panel-dashboard-chart">
					<ul class="tulisTiket" style="padding-left: 15px;">

						<li class="panah" style="list-style-type: none;">Jumlah Tiket
							Lunas <code class="" style="margin-left: 35px;">${dataStatistik.userLunas}</code>
							Tiket
						</li>
						<li class="panah" style="list-style-type: none;">Jumlah Belum
							Lunas <code class="" style="margin-left: 23px;">${dataStatistik.userBelumLunas}</code>
							Tiket
						</li>
					</ul>
				</div>
			</div>

		</div>

		<div style="padding-right: 30px;" class="col-md-7    ">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Statistik Total Penerimaan Uang</h3>
				</div>
				<div class="panel-body">
					<ul class="tulisTiket" style="padding-left: 15px;">
						<li class="panah" style="list-style-type: none;">Total
							Estimasi Pendapatan <code class="" style="margin-left: 50px;"><%= request.getAttribute("uangEstimasi") %></code>
						</li>
						<li class="panah" style="list-style-type: none;">Jumlah Uang
							Diterima <code class="" style="margin-left: 80px;"><%= request.getAttribute("uangDiterima") %></code>
						</li>
						<li class="panah" style="list-style-type: none;">Total Sisa
							Uang Belum Dibayar <code class="" style="margin-left: 22px;"><%= request.getAttribute("uangSisa") %></code>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div style="padding-right: 30px;" class="col-md-7    ">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Kotak Pesan</h3>
				</div>
				<div class="panel-body">
					<ul class="tulisTiket" style="padding-left: 15px;">
						<li class="panah" style="list-style-type: none;">Kotak
							Validasi Tiket <code class="" style="margin-left: 32px;">${dataStatistik.userValidasi}</code>
							Tiket pesan
						</li>

					</ul>
				</div>

			</div>

		</div>
		<div style="padding-right: 30px; float: right;" class="col-md-6    ">

			<div class="panel-body">
				<a href="/keluar" style="margin-left: 10px;"
					class="btn btn-primary btn-raised">Log out</a> <a
					href="/admin/dashboard" class="btn btn-primary btn-raised">Segarkan
					Statistik</a>


			</div>

		</div>

	</div>


</div>
</div>
</body>

<jsp:include page="../../WEB-INF/partials/footer.jsp" />
</html>
