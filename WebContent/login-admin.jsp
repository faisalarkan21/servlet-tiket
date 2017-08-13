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

if(session.getAttribute("admin") !=null && session.getAttribute("email") != null)
{
   response.sendRedirect("halaman-user/admin/dashboard-admin.jsp");
}



 response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="shortcut icon" href="">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ripples.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.fullpage.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-material-design.min.css"> 
</head>

<body>
  
  <br>
  <br>
  
  <div class="container ">
    <div class="login col-md-4 col-md-offset-4 well ">
      <div class="form-group text-center">
        <h1 style="text-align: center;" class="judul "> Login Admin <i class="fa fa-users fa-fw" aria-hidden="true"></i>
</h1>
<hr class="garisLogin">
      </div>
      <div class="col-md-11">
        <form class="daftar text-center" method="post" action="<%=request.getContextPath()%>/AdminController?action=login-admin">
          <div>
            <div id="ketikEmail" class="form-group {{error}}">
              <div class="input-group ">
                <span class="input-group-addon"><i class="fa fa-user-circle-o fa-lg" aria-hidden="true"></i></span>
                <input class="form-control " name="email" placeholder="Email anda" type="email" value="faisalarkan21@gmail.com">
                </span>
              </div>
            </div>
            <div id="ketikPass" class="form-group  {{error}}">
              <div class="input-group">
                <span class="input-group-addon">
             <i class="fa fa-eye-slash fa-lg"></i>
             </span>
                <input class="form-control" name="password" placeholder="Masukan Password" type="password" value="makan">
              </div>
              
            </div>
            
            <div style="text-align: center;" id="pesan" class="form-group {{error}}">
              
              <a class=" btn btn-raised btn-info btn-md" href="/daftar">Daftar</a>
              <button id="login" class="btn btn-raised btn-primary" type="submit">Masuk</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>

    
    
    
    
    
<footer>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ripples.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/material.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.fullpage.extensions.min.js"></script>

    <!-- <script type="text/javascript" src="/quill/quill.core.js"> </script> -->
    

        
    </script>
    <script>
    

    
    
    
    
    
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