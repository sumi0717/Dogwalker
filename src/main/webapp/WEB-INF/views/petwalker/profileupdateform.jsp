<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<style>
.row {
   border: 3px solid #64a19d;
    margin: 0 auto;
   
}
fieldset {
    min-width: 0;
    padding: 0;
    margin: auto;
    border: 0;
}
label{
   text-align: center;
}
textarea{
width:100%;
}
</style>
</head>
<body style="margin-top: 180px">
<%@include file="../home_menu.jsp" %>
   <div class="container">
   <form action="profileupdate.do" method="post" 
id="profileupdate" enctype="multipart/form-data">
      <div class="row">
         <fieldset>  
	<input type="hidden" name="id" id="id" value="${id }"/>       
            <legend></legend>
            <p>도그워커 경력</p>
            <textarea name="career" id="career" cols="30" rows="10">${dto.career }</textarea><br />
            </fieldset>
            
      </div>
      <br /><br />
      <div class="row">

         <fieldset>
            <legend></legend>
            <p>경험</p>
          <textarea name="experience" id="career" cols="30" rows="10"
          >${dto.experience}</textarea><br />
	
         </fieldset>

      </div><br /><br />
      <div class="row">

         <fieldset>
            <legend></legend>
            <p>무료서비스</p>
           <textarea name="freeservice" id="freeservice" cols="30" rows="10">${dto.freeservice }</textarea><br />

         </fieldset>

      </div><br /><br />
     
      <div class="row" style="border:none;">
      <button style="margin:auto; margin-bottom:50px" class="btn btn-default center-block" type="submit">Submit</button>
      </div>
</form>      
   </div>
<%@include file="../home_footer.jsp" %>   
</body>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>	
</html>