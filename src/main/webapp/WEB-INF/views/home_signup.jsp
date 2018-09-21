<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home_signup.jsp</title>
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

body {
<<<<<<< HEAD
   margin: 0;
   padding: 0;
   background: #4f837f;
   font-family: verdana;
=======
	margin: 0;
	padding: 0;
	background: #4f837f;
	font-family: verdana;
>>>>>>> branch 'sumi' of https://github.com/dahyeeeon/spring_dogwalker.git
}

.box {
   z-index: 999;
   position: absolute;
   top: 70%;
   left: 92%;
   transform: translate(-50%, -50%);
   width: 150px;
   height: 320px;
   background: #64a19d;
   box-sizing: border-box;
   padding: 5px;
   transition: .5s;
   overflow: hidden;
}

.box P {
   margin: 0;
   padding: 0;
   color: #fff;
   font-size: 14px;
   transition: .5s;
   transition-delay: .2s;
   transform: scale(.8);
}

.box:before {
   content: '';
   position: absolute;
   width: 0%;
   height: 0%;
   top: 0;
   left: 0;
   border-top: 2px solid #fff;
   border-left: 2px solid #fff;
   opacity: 0;
   transform: .5s;
   box-sizing: border-box;
}

.box:after {
   content: '';
   position: absolute;
   width: 0%;
   height: 0%;
   bottom: 0;
   right: 0;
   border-bottom: 2px solid #fff;
   border-right: 2px solid #fff;
   opacity: 0;
   transform: .5s;
   box-sizing: border-box;
}

.box:hover:before {
   width: 100%;
   height: 100%;
   opacity: 1;
}

.box:hover:after {
   width: 100%;
   height: 100%;
   opacity: 1;
}

.box:hover p {
   transform: scale(1);
}

.box:hover {
   box-shadow: 0 25px 30px rgba(0, 0, 0, .5);
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

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.css"
   rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources/vendor/bootstrap/css/grayscale.css"
   rel="stylesheet">

</head>

<body id="Login">
<<<<<<< HEAD
   <%@include file="home_menu.jsp"%>
   <!-- Header -->
   <header class="masthead">
      <div class="main-div">
               <p>
                  <img src="resources/img/doglogin.png" />&nbsp &nbsp<a
                     href="petwalker/signup_form.do">도그 워커로 회원가입</a>
               </p>
               <br />
               <p>
                  <img src="resources/img/doglogin.png" />&nbsp &nbsp<a
                     href="petusers/signup_form.do">회원으로 회원가입</a>
               </p>
            </div>
         </div>
      </div>
      </section>
   </div>
   </header>

   <!-- Bootstrap core JavaScript -->
   <script src="resources/vendor/jquery/jquery.js"></script>
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
=======
	<%@include file="home_menu.jsp"%>
	<!-- Header -->
	<header class="masthead">
		<div class="main-div">
					<p>
						<img src="resources/img/doglogin.png" />&nbsp &nbsp<a
							href="petwalker/signup_form.do">도그 워커로 회원가입</a>
					</p>
					<br />
					<p>
						<img src="resources/img/doglogin.png" />&nbsp &nbsp<a
							href="petusers/signup_form.do">회원으로 회원가입</a>
					</p>
				</div>
			</div>
		</div>
		</section>
	</div>
	</header>
>>>>>>> branch 'sumi' of https://github.com/dahyeeeon/spring_dogwalker.git

         $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
               scrollTop : 0
            }, 400);
            return false;
         });
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