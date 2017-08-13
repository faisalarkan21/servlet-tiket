<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

<jsp:include page="WEB-INF/partials/header.jsp" />

</head>

<body>
	<div class="navbar navbar-fixed-top navbar-inverse nav-depan">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-inverse-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>

				</button>
				<a id="header" class="navbar-brand"
					href="<%=request.getContextPath()%>"> Gunadarma Airlines
					<div class="ripple-container"></div>
				</a>
			</div>
			<div class="navbar-collapse navbar-inverse-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a class="" id="terjual" href="daftar.jsp"> Beli Tiket
					</a></li>
					<li><a id="daftarDiskon" href="#"> Daftar Tujuan </a></li>

					<li><a id="kontak" href="#"> Hubungi Kami </a></li>
				</ul>
				<form class="navbar-form navbar-left ">
					<!--<div class="form-group">
                <button class="btn btn-raised" type="sumbit">Cari</button>              
              </div>-->
				</form>
				<ul class="col-md-4 nav navbar-nav navbar-right">
					<div class="search ">
						<form class="navbar-form form-group col-md-2">

							<input type="text" class="form-control" name="" value=""
								placeholder="Cari Disini"><i style="padding-left: 3px;"
								class="fa fa-search fa-fw " aria-hidden="true"></i>
						</form>
					</div>
					<li>
						<%
							if (session.getAttribute("user") != null && session.getAttribute("email") != null) {
						%> <a
						href="<%=request.getContextPath()%>/halaman-user/user/dashboard.jsp">Dasboard
							User</a> <%
 	} else if (session.getAttribute("admin") != null && session.getAttribute("email") != null) {
 %> <a
						href="<%=request.getContextPath()%>/halaman-user/admin/dashboard-admin.jsp">Dasboard
							Admin</a> <%
 	} else {
 %> <a href="login-user.jsp"><i
							class="fa fa-user-circle-o fa-fw fa-lg" aria-hidden="true"></i>
							Masuk / Daftar</a> <%
 	}
 %>

					</li>
				</ul>
			</div>
		</div>
	</div>

	<div id="fullpage">
		<div data-anchor="scroll1" class="section">
			<div id="pic2" class="slide hilang" data-anchor="slide1">
				<div id="judul2" class="preload col-md-12 col-md-offset-1 judul3">
					<h1 class="judulSlider judul3">Gunadarma Airlines</h1>
					<label class="judul3 size" for="">Dapatkan penerbangan
						terbaik dengan harga tiket yang kompetitif.</label> <br> <label
						class="judul3 size" for="">Penerbangan Jakarta - Bali
						Hanya Rp 500.000,00</label> <br> <br> <a
						style="background-color: #1565C0 !important;"
						class="btn btn-raised btn-info" href="daftar.jsp">Beli Tiket</a>
				</div>
				<div class="gear ">
					<i class="fa fa-circle-o-notch judul3 fa-spin fa-4x fa-fw "></i>
				</div>
			</div>

		</div>

		<div data-anchor="scroll2" id="picScroll2" class="section">
			<div class="col-md-12  ">
				<div id="judul2" class="preload col-md-12  judul3"
					style="display: block; padding-left: 95px; margin-top: -200px;">
					<h1 class="judulSlider judul3">Tentukan tujuan penerbangan anda.</h1>
					<label class="judul3 size" for="">
					Temukan liburan bersama keluarga dengan nyaman bersama <br/> Gunadarma Airlines, berikut daftar penerbangan yang tersedia : </label> <br> 
					<br>
						
						<div style="" class="col-md-11" style="vertical-align: middle;">
					<label  class="judul3" id="panduan"><i style="padding-right: 5px;" class="fa fa-plane " aria-hidden="true"></i> Penerbangan Jakarta - Bali Rp. 500,000 
</label> <br/>
					<label  class="judul3" id="panduan"><i style="padding-right: 5px;" class="fa fa-plane " aria-hidden="true"></i> Penerbangan Medan - Surabaya Rp. 500,000  </label>
 <br/>
					<label  class="judul3" id="panduan"><i style="padding-right: 5px;" class="fa fa-plane " aria-hidden="true"></i> Penerbangan Jakarta - Medan Rp. 500,000 
</label> <br/>
					<label class="judul3"  id="panduan"><i style="padding-right: 5px;" class="fa fa-plane " aria-hidden="true"></i> Penerbangan Medan - Jakarta Rp. 500,000 
</label> <br/>
					<label class="judul3"  id="panduan"><i style="padding-right: 5px;" class="fa fa-plane " aria-hidden="true"></i> Penerbangan Pekanbaru - Bandung Rp. 500,000 
					
</label> <br/>
 <br/>      
   
					<a
						style="background-color: #263238 !important;"
						class="btn btn-raised btn-info" href="daftar.jsp">Beli Tiket</a>
  
					

    
				</div>
						
				</div>

			</div>
    	
  
		</div>    
  
  

		<div data-anchor="scroll4" id="picScroll5"   
			class="section fp-auto-height ">
			<div id="Kolomkontak" class="col-md-3 col-md-offset-1">
				<h2 style="font-size: 20px;" class="kontak ">Kontak Kami</h2>
				<ul class="kontak">
					<li><i class="fa fa-phone footer-icons" aria-hidden="true"></i>
						Handphone : +62-8577-8805-197</li>
					<li><i class="fa fa-fax footer-icons" aria-hidden="true"></i>
						Fax : 8766535775</li>
					<li><i class="fa fa-building-o footer-icons"
						aria-hidden="true"></i> Kantor : JL. Haji Usa Parung, Bogor.</li>
				</ul>
			</div>
			<div id="Kolomkontak" class="col-md-3 col-md-offset-1">
				<h2 style="font-size: 20px;" class="kontak">Terhubung Dengan
					Kami</h2>

				<ul class="kontak">
					<li><i style="padding-right: 9px;"
						class="fa fa-facebook footer-icons" aria-hidden="true"></i> <a
						class="listSosial" href="#"> Facebook </a></li>
					<li><i class="fa fa-instagram footer-icons" aria-hidden="true"></i>
						<a class="listSosial" href="#">Instagram </a></li>
					<li><i class="fa fa-github-alt footer-icons"
						aria-hidden="true"></i> <a class="listSosial" href="#">Github
					</a></li>
					<!--</ul>     

            <ul class="kontak">
                <li><i style="padding-right: 4px; padding-bottom: 5px;"  class="fa fa-google-plus " aria-hidden="true"></i>
     <a class="listSosial" href="#" > Google Plus </a></li>
      <li><i style="padding-right: 8px; padding-bottom: 5px;"  class="fa  fa-amazon " aria-hidden="true"></i>
     <a class="listSosial" href="#" > Amazon </a></li>
     <li><i style="padding-right: 10px; padding-bottom: 5px;"  class="fa  fa-linkedin footer-icons" aria-hidden="true"></i>
     <a class="listSosial" href="#" > Linkedin </a></li>

            </ul>       -->
			</div>
			<div id="Kolomkontak" class="col-md-3">
				<h2 style="font-size: 20px;" class="kontak">Situs ini dibuat
					dengan :</h2>
				<ul class="kontak">
					<img style="margin-top: -20px; margin-left: 20px;"
						src="resource/css/images/logoJava.png" alt="">
				</ul>
			</div>
		</div>
	</div>   
	<jsp:include page="WEB-INF/partials/footer.jsp" />
	<script>
		$(document).ready(function() {

			$("#header").click(function() {

				$.fn.fullpage.moveTo(1, 0);

			})

			$("#daftarDiskon").click(function() {

				$.fn.fullpage.moveTo(2, 0);

			})

			$("#kontak").click(function() {

				$.fn.fullpage.moveTo(3, 0);

			})

		})

		$(document).ready(
				function() {
					$('#fullpage').fullpage(
							{

								anchors : [ 'scroll1', 'scroll2', 'scroll3' ],

								navigation : true,
								navigationPosition : 'right',
								// navigationTooltips: ['Halaman 1', 'slide2'],
								showActiveTooltip : false,
								slidesNavigation : true,
								slidesNavPosition : 'bottom',
								lazyLoading : true,
								loopBottom : false,
								fadingEffect : true,
								dragAndMove : true,

								afterRender : function() {
									setInterval(function() {

										$.fn.fullpage.moveSlideRight();

									}, 1999000);

								},

								afterLoad : function(anchorLink, index) {
									$('.preload').fadeIn(1000);
									$('.hilang').fadeIn(1000);

									// if (index == 2) {
									//     $(".hitungPercaya").show();
									//     $(".dipercaya").fadeIn(400);

									//     $(".hitungPercaya").each(function () {
									//         $(this).prop('Counter', 0).animate({

									//             Counter: $(this).text()
									//         }, {

									//             duration: 4000,
									//             easing: 'swing',
									//             step: function (now) {
									//                 $(this).text(Math.ceil(now));
									//             }

									//         })

									//     });
									// } // akhir index 2

									if (index == 2) {

										$(".hitungPercaya").show();
										$(".dipercaya").fadeIn(400);

										$(".tiket").fadeIn({
											queue : false,
											duration : "slow"
										});

										$(".form-harga").fadeIn({
											queue : false,
											duration : "slow"
										});

										$(".tiket").animate({
											marginLeft : "350px",

										}, "slow");

									}

									if (index == 4) {

									}
								},
								afterSlideLoad : function(anchorLink, index,
										slideAnchor, slideIndex) {

									// alert("masuk");
									$('.preload').fadeIn(600);

								},
								onSlideLeave : function(anchorLink, index,
										slideIndex, direction, nextSlideIndex) {

									$('.preload').hide();

									// alert("keluar")

								}

							});
				});
	</script>
</html>
