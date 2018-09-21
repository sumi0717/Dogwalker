<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home_login.jsp</title>
<style>
.nav>li {
   margin-right: 80px;
}
a#MOVE_TOP_BTN {
   position: fixed;
   right: 2%;
   bottom: 50px;
   display: none;
   z-index: 998;
}
body#Login{ background-image:url("http://nycdogwalkers.com/images/slide3x.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}
.main-div {
  background: #ffffff none repeat scroll 0 0;
  border-radius: 2px;
  margin: 10px auto 30px;
  margin-top: 150px;
  max-width: 38%;
  padding: 50px 70px 50px 71px;
}
</style>

<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

</head>

<body id="Login">
   <%@include file="home_menu.jsp"%>
   <!-- Header -->
   <header class="masthead">
      <div class="main-div">
               <p>
                  <img src="resources/img/doglogin.png" />&nbsp &nbsp<a
                     href="petwalker/loginform.do">  도그 워커로 로그인</a>
               </p>
               <br />
               <p>
                  <img src="resources/img/doglogin.png" />&nbsp &nbsp<a
                     href="petusers/loginform.do"> 회원으로 로그인</a>
               </p>
            </div>
         </div>
      </div>
      </section>
   </div>
   </header>

   <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/jquery/jquery.js"></script>
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
   <script src="resources/vendor/jquery-easing/jquery.easing.js"></script>
   <script src="resources/vendor/bootstrap/js/grayscale.js"></script>
   <script>
      $(function() {
         $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
               $('#MOVE_TOP_BTN').fadeIn();
            } else {
               $('#MOVE_TOP_BTN').fadeOut();
            }
         });
         $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
               scrollTop : 0
            }, 400);
            return false;
         });
     
      var currentPosition = parseInt($(".box").css("top"));
      $(window).scroll(function() {
         var position = $(window).scrollTop();
         $(".box").stop().animate({
            "top" : position + currentPosition + "px"
         }, 100);
      });
   </script>
</body>
</html>