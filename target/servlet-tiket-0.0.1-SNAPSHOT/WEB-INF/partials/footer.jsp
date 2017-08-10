<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">








<footer>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ripples.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/material.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.fullpage.extensions.min.js"></script>

    <!-- <script type="text/javascript" src="/quill/quill.core.js"> </script> -->
    

        
    </script>
    <script>
        // $(document).on("click","#masuk",function() {

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

        // });


          $(document).ready(function () {
            $(function () {
                $.material.init();
            });
        });
    </script>
</footer>

</html>