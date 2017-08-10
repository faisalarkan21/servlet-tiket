<%@page import="com.faisalarkan.config.DBConfig"
		import="java.sql.Statement"
		import="java.sql.ResultSet"

%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%


	java.sql.Connection Conn = DBConfig.getConnection(); /* make connector as you make in your code */
	Statement st = null;
	Statement st2 = null;
	ResultSet rsBerangkat = null;
	ResultSet rsTujuan = null;
	st = Conn.createStatement();
	st2 = Conn.createStatement();
	rsBerangkat = st.executeQuery("select * from pajak_bandara"); 
	rsTujuan = st2.executeQuery("select * from pajak_bandara"); 



 response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="shortcut icon" href="">
  <link rel="stylesheet" href="resource/css/bootstrap.min.css">
  <link rel="stylesheet" href="resource/css/style.css">
  <link rel="stylesheet" href="resource/css/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="resource/css/ripples.min.css">
  <link rel="stylesheet" href="resource/css/jquery.fullpage.min.css">
  <link rel="stylesheet" href="resource/css/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="resource/css/bootstrap-material-design.min.css"> 
</head>
 
<body>     
      
    <div class="container ">     
        <div class="daftar col-md-8 col-md-offset-2 well ">
            <div class="form-group" style="margin-bottom: -15px;">
                <h1 style="margin-left:120px;" class="judul col-md-7 col-md-offset-1"> Pembelian Tiket Pesawat</h1>
                <i style="margin-top: 6px; margin-right:-50px;" class="fa  fa-plane fa-5x" aria-hidden="true"></i>
                <hr>

            </div>

            <div class="col-md-9 col-md-offset-1" style="margin-bottom: -15px;">

                <br>
                <label style="margin-left: 16px;" class="control-label ">                 
                                  Data Pribadi</label>
                <hr class="garisbagian">

            </div>
            <div class="col-md-12 col-md-offset-1">
                <form class="daftar form-horizontal text-center" action="UserController?action=daftar" method="post">
                    <div class="col-md-4">
                        <div id="ketikEmail" class="form-group {{error}}">

                            <div class="input-group ">

                                <span class="input-group-addon"><i class="fa fa-user-circle-o fa-lg" aria-hidden="true"></i></span>
                                <input class="form-control " name="nama" placeholder="Nama Anda" type="name" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <div id="ketikPass" class="form-group  {{error}}">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa-lg" aria-hidden="true"></i></span>
                                <input class="form-control" name="email" placeholder="Email Anda" type="email" value="">
                            </div>
                        </div>
                    </div>
                     <div class="col-md-4 ">
                        <div id="ketikEmail" class="form-group {{error}}">
                            <div class="input-group ">
                                <span class="input-group-addon"><i class="fa fa-eye-slash fa-lg" aria-hidden="true"></i></span>
                                <input class="form-control " name="password" placeholder="Password" type="password" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <div id="ketikEmail" class="form-group {{error}}">
                            <div class="input-group ">
                                <span class="input-group-addon"><i class="fa fa-eye-slash fa-lg" aria-hidden="true"></i></span>
                                <input class="form-control " placeholder="Konfirmasi Password" type="password" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ">
                        <div id="ketikEmail" class="form-group {{error}}">
                            <div class="input-group ">
                                <span class="input-group-addon"><i class="fa fa-phone-square fa-lg" aria-hidden="true"></i></span>
                                <input class="form-control " name="hp" placeholder="No Handphone" type="text" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-1">
                        <div id="ketikPass" class="form-group  {{error}}">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa-lg" aria-hidden="true"></i></span>
                                <select name="gd" id="gender" class="form-control">
                                    <option  hidden>Pilih gender</option>
          <option>Pria</option>
          <option>Wanita</option>
          
        </select>
                            </div>
                        </div>
                    </div>
                    
                      <div class="col-md-9">

                        <br>
                        <label class="control-label">                 
                                  Bandara Keberangkatan</label>
                        <hr class="garisbagian"> 

                    </div>
                    <div class="col-md-12" style="margin-top: -30px;">

                        <div class="col-md-12 ">


    
 
                            <div id="ketikEmail" class="form-group {{error}} col-md-6 ">
                                <div class="input-group col-md-10">     
                                    <label for="metode " class="control-label">                 
                                  Pilih Bandara Keberangkatan</label>
                                    <select name="berangkatBandara" id="berangkat" class="form-control" onchange="keberangkatan(this.value);">  
                                    <%while(rsBerangkat.next()){ %>
        <option value="<%=rsBerangkat.getString(1)%>"><%=rsBerangkat.getString(2)%></option>
                        <%}%>    
          
        </select>
   
                                </div>
                            </div>


                            <div id="ketikEmail" class="form-group {{error}} col-md-6 ">
                                <div class="input-group col-md-8">
                                    <label for="harga " class="control-label">                 
                                  Biaya Keberangkatan</label>
                                    <input class="form-control " name="harga" id="biayaBerangkat" placeholder="Biaya Keberangkatan " type="text" value="" disabled>

                                </div>
                            </div>




                        </div>
                      

                        


                    </div> 
                    
                    
                       <div class="col-md-9">

                        <br>
                        <label class="control-label">                 
                                  Bandara Tujuan</label>
                        <hr class="garisbagian"> 

                    </div>
                    <div class="col-md-12" style="margin-top: -30px;">

                        <div class="col-md-12 ">


    
 
                            <div id="ketikEmail" class="form-group {{error}} col-md-6 ">
                                <div class="input-group col-md-10">     
                                    <label for="metode " class="control-label">                 
                                  Pilih  Bandara Tujuan</label>
                                    <select name="tujuanBandara" id="metode" class="form-control" onchange="tujuan(this.value);">  
                                    <%while(rsTujuan.next()){ %>
        <option value="<%=rsTujuan.getString(1)%>"><%=rsTujuan.getString(2)%></option>
                         
           <%}%>  
        </select> 
      
                                </div>
                            </div>


                            <div id="ketikEmail" class="form-group {{error}} col-md-6 ">
                                <div class="input-group col-md-8">
                                    <label for="harga " class="control-label">                 
                                  Biaya Tujuan</label>
                                    <input class="form-control " name="harga" id="biayaTujuan" placeholder="Biaya Tujuan" type="text" value=""   disabled>

                                </div>
                            </div>



                        <div id="ketikEmail" class="form-group {{error}} col-md-6">
                                <div class="input-group col-md-8">
                                    <label for="harga " class="control-label">                 
                                  Total Harga</label>
                                    <input class="form-control " name="totalHargaTiket" id="totalHarga" placeholder="Total Harga" type="text" value="" readonly >

                                </div>
                            </div>

                        </div>
                        
                        
                          
       
                        

  
                    </div> 
                     
                    
                    

                    <div class="col-md-9">

                        <br>
                        <label class="control-label">                 
                                  Pilih Metode Pembayaran</label>
                        <hr class="garisbagian">

                    </div>
                    <div class="col-md-12" style="margin-top: -30px;">

                        <div class="col-md-12 ">




                            <div id="ketikEmail" class="form-group {{error}} col-md-6">
                                <div class="input-group col-md-9">
                                    <label for="metode " class="control-label">                 
                                  Pilih Metode Pembayaran</label>
                                    <select name="bank" id="metode" class="form-control" >
                                    <option  hidden>Pilih Bank</option>
          <option>BCA NO. 98080986643 - Faisal Arkan</option>
          <option>BRI NO. 78787878741 - Sativa Ken</option>
          
        </select>

                                </div>
                            </div>


                            


 
                        </div>
                      

                        <div style="padding-bottom: 30px; padding-left: 20px;" class="col-md-10 col-md-offset-2">
  
                            <br>
                            <br>
                            <a class=" btn btn-raised btn-info btn-md" href="login-user.jsp"> Kembali  </a>
                            <button id="login" style="margin-left: 10px;" class="btn btn-raised btn-primary " type="submit">  Submit</button>
                        </div>

 
                    </div>

                </form>


            </div>
        </div>

    </div> 

    <br>
    <br>
    <br>
    <br>
    <br>

</body>

<footer>
    <script type="text/javascript" src="resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resource/js/ripples.min.js"></script>
    <script type="text/javascript" src="resource/js/material.min.js"></script>
    <script type="text/javascript" src="resource/js/jquery.fullpage.extensions.min.js"></script>

    <!-- <script type="text/javascript" src="/quill/quill.core.js"> </script> -->
    

        
    </script>
    <script>
    
    
    function keberangkatan(idberangkat){
    	
    	console.log(idberangkat)
    	 
    	    $.ajax({    
                type: "GET",               
                cache: false,  
                data: { 
                	idBandara: idberangkat, 
                   
                  },
                url: "TiketController?action=getBandaraHarga",   
                success: function(data, text){
                	 
                	$('#biayaBerangkat').val(data) 
                	totalHarga ();
                }   
            });    
    	
    	
    	 
    }
    
    
    function tujuan(idTujuan){
    	
    	console.log(idTujuan)
    	 
    	    $.ajax({    
                type: "GET",               
                cache: false,  
                data: {  
                	idBandara: idTujuan, 
                   
                  },
                url: "TiketController?action=getBandaraHarga",   
                success: function(data, text){
                	
                	$('#biayaTujuan').val(data); 
                	totalHarga ();  
                }   
            });    
    	
    	
    }
    
    
    function totalHarga () {
    	
    	
    	var biayaBerangkat = parseFloat($('#biayaBerangkat').val()); 
    	var biayaTujuan = parseFloat($('#biayaTujuan').val());  
   
    
    	let hargaTotal = biayaBerangkat + biayaTujuan;
    	
    	if (isNaN(hargaTotal)){
    		 
    	}else {   
    		
    	
    	console.log(hargaTotal);  
    	$('#totalHarga').val(hargaTotal); 
    	
    	}
    	
    	 
    	   
    	
    	 
    	  
    }
    
    
    
    
    
    
    $(document).ready(function () {

        	
        	
        	var idberangkat =  $('#biayaBerangkat').val();
        	
        	
        	
        	
        // var coba = tinyMCE.activeEditor.getContent({format : 'text'});

        // alert(coba);


        // $("#isiPosting").submit( function () {    
        //     $.ajax({   
        //         type: "POST",
        //         data :,
        //         cache: false,  
        //         url: "addpost.html",   
        //         success: function(data){
        //             $("# ").html(data);                       
        //         }   
        //     });   
        //     return false;   
        // });

        });


          $(document).ready(function () {
            $(function () {
                $.material.init();
            });
        });
    </script>
</footer>

</html>