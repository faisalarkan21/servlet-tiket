<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="../../WEB-INF/partials/header-admin.jsp" />


<div class="table-users col-md-10 col-md-offset-2 container">
	<div style="margin-top: 70px;" class="page-header text-center well">
		<div class="col-md-12 ">
			<div class="col-md-13">
				<h1 class="judul">List Pembeli Belum Lunas</h1>

				<hr class="Garistema">

			</div>





		</div>

		<%
			int i = 1;
		%>

		<div style="font-size: 3px;" class="bs-component">
			<table class="table table-hover jadi-vertical">
				<thead>
					<tr class="headerTengah" id="warnaTr">
						<th>No</th>
						<th>Nama</th>
						<th>Email Utama</th>
						<th>No Handphone</th>

						<th>Kotak Validasi Tiket</th>
						<th>Status</th>
						<th colspan="3">Tindakan</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${dataPembeliBelumLunas}" var="pembeli">
						<tr class="">
							<td class="text-center tengah pagination-centered"><%=i%></td>
							<td class="text-center pagination-centered">
								${pembeli.nm_pembeli}</td>
							<td class="text-center pagination-centered">
								${pembeli.email_pembeli}</td>
							<td class="text-center pagination-centered">
								${pembeli.hp_pembeli}</td>


							<td class="text-center tengah-table pagination-centered">
								${pembeli.pilihan_bank}
							<td class="text-center tengah-table pagination-centered"><c:out
									value="${pembeli.status == '0' ? 'Belum Lunas': 'Lunas'}" /></td>
							<td id="btn-edit" class="tengah text-center">	<a class="btn btn-raised btn-info" 
							href="<%=request.getContextPath()%>/AdminController?action=userDetail&userId=${pembeli.idUser}">
							Detail</a>
								
								
								</td>

						</tr>
						<%
							i = i + 1;
						%>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

</body>





<jsp:include page="../../WEB-INF/partials/footer.jsp" />
</html>
