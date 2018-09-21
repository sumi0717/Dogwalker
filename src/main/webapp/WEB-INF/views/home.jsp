<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Grayscale - Start Bootstrap Theme</title>
<style>
.nav>li{
   margin-right:80px;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 998;
}
body {
    margin:0;
    padding:0;
    background:#262626;;
    font-family:verdana;
}
.expand{
position:fixed;
right:20px;
bottom:100px;
width:40px;
height:40px;
border:1px solid #64a19d;
border-radius:50%;
z-index:999;
text-align:center;

}
.expand i{margin-top:12px;color:#64a19d}
.expand .box{display:none}
.expand.active .box{display:block}
.box {
text-align:left;
   z-index:999;

    position:absolute;
    bottom:50px;
    right:0;
    width:150px;
    height:auto;
    background:#64a19d;
    box-sizing:border-box;
    padding:5px;
    transition:.5s;
    overflow:hidden;
    border-radius:20px;
}
.box P {
    margin:0;
    padding:0 10px 10px;
    color:#fff;
    font-size:10px;
}
.box p:first-child{
font-weight:bold;
font-size:12px;
}


html,
body {
    height: 100%;
}


.carousel-inner {
    height: 100%;
}

/* Background images are set within the HTML using inline CSS, not here */

.fill {
    width: 100%;
    height: 100%;
    background-position: center;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-size: cover;
    -o-background-size: cover;
}

footer {
    margin: 50px 0;
}

.search_input_class{
   width:500px;
   
}

</style>
 
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

</head>
<%@include file="home_menu.jsp" %>
<body id="page-top">
<!-- Wrapper for slides -->
<div class="item active">
   <img src="http://nycdogwalkers.com/images/slide3x.jpg" alt="Los Angeles" style="width:100%;">
</div>

<div class="expand">
   <i class="fa fa-plus"></i>
   <div class="box">
      <p>서비스 안내</p>
      <p></p>
      <p><strong>문의:02-1234-1234</strong><br/><br/>
      이동 시간 : <br/>1시간에서 1시간 30분<br/><br/>
        예약 관련 : <br/>최소  1주 전<br/><br/>
        취소 관련 : <br/>3일 이내 취소 가능
        </p>
   </div>
</div>
<div class="container">
   <div class="row">
        <div class="col-xs-12">
        <h4>이용방법</h4>
            <ul class="nav nav-pills nav-justified thumbnail">
                <li>
                    <h4 class="list-group-item-heading">Step 1</h4>
                    <p class="list-group-item-text">가입</p>
                </li>
                <li>
                <span class="fa fa-lg fa-angle-double-right"></span>
                </li>
                <li class="active">
                    <h4 class="list-group-item-heading">Step 2</h4>
                    <p class="list-group-item-text">내 지역 검색</p>
               </li>
                <li>
                <span class="fa fa-lg fa-angle-double-right"></span>
                </li>
                <li>
                    <h4 class="list-group-item-heading">Step 3</h4>
                    <p class="list-group-item-text">도그워커 선택</p>
                </li>
                 <li>
                <span class="fa fa-lg fa-angle-double-right"></span>
                </li>
                <li>
                    <h4 class="list-group-item-heading">Step 4</h4>
                    <p class="list-group-item-text">예약 및 문의</p>
                </li>
                 <li>
                <span class="fa fa-lg fa-angle-double-right"></span>
                </li>
                <li>
                    <h4 class="list-group-item-heading">Step 5</h4>
                    <p class="list-group-item-text">도그워커 방문</p>
                </li>
                 <li>
                <span class="fa fa-lg fa-angle-double-right"></span>
                </li>
                <li>
                    <h4 class="list-group-item-heading">Step 6</h4>
                    <p class="list-group-item-text">후기 작성</p>
                </li>
            </ul>
        </div>
   </div>
</div>


 <!-- About Section -->
 <section id="projects" class="projects-section bg-light">
  <div class="container">

    <!-- Featured Project Row -->
    <div class="row align-items-center no-gutters mb-4 mb-lg-5">
      <div class="col-xl-8 col-lg-7">
        <img class="img-fluid mb-3 mb-lg-0" src="" alt="">
      </div>
      <div class="col-xl-4 col-lg-5">
        <div class="featured-text text-center text-lg-left">
          <h4>렛츠런</h4>
          <p class="text-black-50 mb-0">산책으로 평화를 만들 수 있습니다</p>
        </div>
      </div>
    </div>
    <!-- Project One Row -->
    <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
      <div class="col-lg-6">
        <img class="img-fluid" src="resources/img/bg.jpg" alt="">
      </div>
      <div class="col-lg-6">
        <div class="text-center h-100 project">
          <div class="d-flex h-100">
            <div class="project-text w-100 my-auto text-center text-lg-left">
              <h4>이럴 때 이용해주세요</h4>
               <hr class="d-none d-lg-block mb-0 ml-0">
              <p class="mb-0">병이나 아픔으로 입원 했을때</p>
              <p class="mb-0">급히 출장 갈 때</p>
              <p class="mb-0">고령으로 산책을 하기 힘들때</p>
              <p class="mb-0">노령의 강아지라도 산책을 해주고 싶을때</p>
             
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Project Two Row -->
    <div class="row justify-content-center no-gutters">
      <div class="col-lg-6">
        <img class="img-fluid" src="resources/img/bg2.jpg" alt="">
      </div>
      <div class="col-lg-6 order-lg-first">
        <div class="text-center h-100 project">
          <div class="d-flex h-100">
            <div class="project-text w-100 my-auto text-center text-lg-left">
              <h4>산책의 중요성</h4>
               <hr class="d-none d-lg-block mb-0 ml-0">
              <p class="mb-0">산책만 잘해줘도 문제행동이 해결 될 수 있습니다!</p>
              <p class="mb-0">에너지 발산을 도와 스트레스를 줄이고</p>
              <p class="mb-0">산책매너 교육과 함께 문제행동 개선을 돕는 과정입니다</p>
             
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</section>
 
<!-- Signup Section -->
<section id="search" class="signup-section">
  <div class="container">
    <div class="row">
      <div class="col-md-10 col-lg-8 mx-auto text-center" style = "position:relative">
        <h2 class="text-white mb-5">우리 동네 도그워커 검색하기</h2>

        <form class="form-inline d-flex" action="AddressSearchResult.do" method = "post" >
          <input class="input-req" type="text" name="input_address" id="input_address" placeholder="주소를 입력해주세요" /><br />
          <!-- <input type="text" class="form-control search_input_class" name="input_address" id="input_address"> -->
          <button type="submit" class="btn btn-primary" style = "position : absolute; top:82px; left:610px"><i class="fa fa-paw fa-2x"></i></button>
        </form>

      </div>
    </div>
  </div>
</section>

 <!-- Contact Section -->


<section id="bestreview" class="pb-5">
 <div class="container">
 	
     <h5 class="section-title h1">RECENT REVIEW</h5>
     
     <div class="row">
         <!-- Team member -->
         <c:forEach var="tmp" items="${list }">
                <div class="col-xs-12 col-sm-6 col-md-4">
             <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                 <div class="mainflip"> 
                     <div class="frontside">
                         <div class="card">
                             <div class="card-body text-center">
                                 <p><img class=" img-fluid" src="${pageContext.request.contextPath }/${tmp.imagePath }" alt="card image"></p>
                                 <h4 class="card-title">${tmp.title }</h4>
                                 <p class="card-text">강아지도 유저도 좋아하는 최고의 펫워커</p>
                                 <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                             </div>
                         </div>
                     </div>
                     <div class="backside">
                         <div class="card">
                             <div class="card-body text-center mt-4">
                             	
                                 <h4 class="card-title"><a href="walkerPrf/detail_main.do?nickname=${tmp.nickname }">${tmp.nickname}</a></h4>
                                 

                                 <p class="card-text">${tmp.content }</p>
                               
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
      
 </c:forEach>
 </div>

 </div>
</section>

<a id="MOVE_TOP_BTN" href="#">TOP-</a>


 <!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

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
    });
    
    $('.expand').on('click', function(){
    	
    	$(this).toggleClass('active');
    });
    
    
    var currentPosition = parseInt($(".box").css("top"));
    $(window).scroll(function() {
    	var position = $(window).scrollTop(); $(".box")
    	.stop().animate({"top":position+currentPosition+"px"},100); });


    $(function() {
        var placesAutocomplete = places({
          container: document.querySelector('#input_address')
        });
   });

   


</script>


<script src="https://cdn.jsdelivr.net/npm/places.js@1.9.0"></script>

</body>

</html>
