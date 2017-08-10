<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


		 <% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>

	<title></title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ripples.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.fullpage.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-material-design.min.css">
	



</head>

<body>
	<div id="navbarpro" class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-inverse-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        
        </button>
				<a class="navbar-brand" href="/">Dashboard Tiket <i style="padding-left: 6px;" class="fa fa-users fa-fw " aria-hidden="true"></i>
       
        <div class="ripple-container">            
          </div>         
          </a>
			</div>
			<div class="navbar-collapse navbar-inverse-collapse collapse">
				<form class="navbar-form navbar-left ">
					<!--<div class="form-group">
                <button class="btn btn-raised" type="sumbit">Cari</button>              
              </div>-->
				</form>
				<ul class="nav-drop nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" data-target="dropdown" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog fa-spin fa-fw"></i>
 Login Sebagai : <%=session.getAttribute("user") %> <b class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li><a href="/keluar">Log Out  <i class="material-icons">keyboard_arrow_right</i> </a></li>
							<li class="divider"></li>
							<li><a href="#">Bantuan  </a> </li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="nav-side-menu" > 
		<div class="brand"><i class="fa fa-shopping-basket fa-fw" aria-hidden="true"></i>
 Halaman Pembeli </div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
		<div class="menu-list">
			<ul id="menu-content" class="menu-content collapse out">
				<li >
					<a  style="display: block;" href="<%=request.getContextPath()%>/user/dashboard.jsp">
						<i class="fa fa-home fa-lg"></i>Halaman Utama
					</a>
				</li>
				
				<li data-toggle="collapse" data-target="#data" >
					<a href="#"><i class="fa fa-book fa-lg"></i>Data Pembeli <span class="arrow"></span></a>
				</li> 


             

				<ul class="sub-menu collapse" id="data">
					<li class="active"><a href="<%=request.getContextPath()%>/UserController?action=data-pembeli&userId=<%=session.getAttribute("id")%>" ><i class="fa fa-chevron-right" aria-hidden="true"></i>
Data Pemesan</a></li>
					<li class="active"><a href="<%=request.getContextPath()%>/user/ketentuan.jsp"><i class="fa fa-chevron-right" aria-hidden="true"></i>
Ketentuan</a></li>
				</ul>
				<li >
					<a  style="display: block;"  href="<%=request.getContextPath()%>/user/dashboard.jsp">
						<i class="fa fa-shield fa-lg"></i>Validasi Tiket
					</a>
				</li>
			</ul>
		</div>
	</div>
	</div>