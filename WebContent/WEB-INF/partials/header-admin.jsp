<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



<title>makan dilaut</title>
<!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/bootstrap-material-design.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/ripples.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/jquery.fullpage.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/font-awesome/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/bootstrap-material-design.min.css">





</head>

<body>
	<div id="navbarpro" class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"  
					data-target=".navbar-inverse-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
    
				</button> 
				<a class="navbar-brand" href="<%=request.getContextPath() %>/halaman-user/user/dashboard.jsp"> Dashboard Admin <i
					class="fa fa-user-secret fa-fw fa-lg" aria-hidden="true"></i>

					<div class="ripple-container"></div>
				</a>   
			</div>
			<div class="navbar-collapse navbar-inverse-collapse collapse">
				<form class="navbar-form navbar-left ">         
					<!--<div class="form-group">
                <button class="btn btn-raised" type="sumbit">Cari</button>                
              </div>-->   
				</form>
				<ul class="nav-drop nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" data-target="dropdown"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-cog fa-spin fa-fw fa-lg"></i> Admin : <%=session.getAttribute("admin")%>
							<b class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li><a
								href="<%=request.getContextPath()%>/AdminController?action=logout">Log
									Out <i class="fa fa-sign-out"></i>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">Bantuan </a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="nav-side-menu">
		<div class="brand">
			<i class="fa fa-rocket fa-lg  fa-fw" aria-hidden="true"></i> Admin
			<%=session.getAttribute("admin")%>
		</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>
		<div class="menu-list">
			<ul id="menu-content" class="menu-content collapse out">
				<li><a style="display: block;"
					href="<%=request.getContextPath()%>/AdminController?action=statistik">
						<i class="fa fa-area-chart fa-lg"></i>Statistik Pembeli
				</a></li>

				<li data-toggle="collapse" data-target="#data"><a href="#"><i
						class="fa fa-book fa-lg"></i>Data Pembeli Tiket <span
						class="arrow"></span></a></li>




				<ul class="sub-menu collapse" id="data">
					<li class="active"><a
						href="<%=request.getContextPath()%>/AdminController?action=getAllPembeli"><i
							class="fa fa-chevron-right" aria-hidden="true"></i> Semua Pembeli</a></li>
					<li class="active"><a
						href="<%=request.getContextPath()%>/AdminController?action=getPembeliLunas"><i
							class="fa fa-chevron-right" aria-hidden="true"></i> Pembeli Lunas
					</a></li>
					<li class="active"><a
						href="<%=request.getContextPath()%>/AdminController?action=getPembeliBelumLunas"><i
							class="fa fa-chevron-right" aria-hidden="true"></i> Pembeli Belum
							Lunas</a></li>

				</ul>
				<li><a style="display: block;"
					href="<%=request.getContextPath()%>/AdminController?action=getKotakValidasi">
						<i class="fa fa-envelope fa-lg"></i>Kotak Validasi Tiket
				</a></li>

			</ul>
		</div>
	</div>
	</div>