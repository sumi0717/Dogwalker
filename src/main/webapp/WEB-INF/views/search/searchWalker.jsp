<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/search/searchWalker</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<!-- <script type="text/javascript"
   src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
 -->
<script type="text/javascript"
   src="https://maps.googleapis.com/maps/api/js"></script>


<style>
body {
   font-family: "Nanum Gothic", sans-serif;
   padding-top: 0px;
}

img {
   vertical-align: middle;
   border-style: none;
}

.spacer {
   width: 100%;
   height: 500px;
}

.navbar {
   min-height: 162px;
   background-color: #64a19d;
}

.navbar_top {
   background-color: #394899;
}



.index-search input {
   height: 50px;
   line-height: 50px;
   border-radius: 6px;
   margin: 20px 0px 10px 50px;
   padding: 10px 15px;
   width: 90%;
   color: #999999;
   text-indent: 58px;
   font-weight: bold;
   border-color: #cecece;
   border-width: 2px;
   border-style: solid;
   background-image:
      url(${pageContext.request.contextPath }/resources/img/search.png);
   background-position: center left 32px;
   background-repeat: no-repeat;
   font-size: 1.5rem;
   background-color: #fff;
}

.around {
   margin-top: 5px;
   text-indent: 50px;
   font-size: 1.5rem;
   font-weight: bold;
   color: #fff;
}

.around img {
   display: inline;
   margin-right: 5px;
}

.around span {
   
}

.main-content {
   margin-top: 270px;
   margin-bottom:40px;
}

.left-content {
   
}

.link-spanner {
   position: absolute;
   width: 100%;
   height: 100%;
   top: 0;
   left: 0;
}

.petwalker-card-box img {
   max-width: 100%;
   height: auto;
}

.petwalker-card-over detailImg {
   height: 200px;
}

.left-content petwalker-card-box {
   width: 500px;
   height: 500px;
   background-color: #00ff00;
}

.petwalker-card-box:hover {
   -webkit-transform: translateX(-2px);
   transform: translateX(-2px);
   border: 0.5px solid #efefef;
   box-shadow: 1px 8px 12px #cecece;
}

.petwalker-card-profile {
   width: 46px;
   height: 46px;
   margin: 8px 6px 10px 8px;
   border-radius: 50%;
   float: left;
}

.right-content p {
   font-size: 20px;
}

.options-box {
   margin-top: 10px;
   width: 50%;
   display: inline-block;
   text-align: center;
   vertical-align: middle;
   line-height: 40px;
   color: #fff;
   float: left;
   width: 50%;
}

@media ( max-width : 1200px) {
   .options-box {
      display: table-cell;
      float: left;
   }
}

@media ( max-width : 576px) {
   .options-box {
      font-size: 0.9rem;
      float: left;
   }
}

.options-box label>input {
   visibility: hidden;
   /* Makes input not-clickable */
   position: absolute;
   /* Remove input from document flow */
}

.options-box label>input+span {
   /* IMAGE STYLES */
   cursor: pointer;
   border: solid 2px #C0D8D7;
   border-radius: 10px;
   width: 70px;
   height: 40px;
   display: inline-block;
}

@media ( max-width : 768px) {
   .options-box label>input+span {
      width: 50px;
      height: 30px;
   }
}

.options-box label>input+span.gender-female {
   /*background:
      url("https://storage.googleapis.com/pefam-web-cdn/filter_female_off.png");*/
   background-image:
      url(${pageContext.request.contextPath }/resources/img/woman2.png);
   background-position: center left 8px;
   background-repeat: no-repeat;
   text-indent: 14px;
}

@media ( max-width : 768px) {
   .options-box label>input+span.gender-female {
      background: transparent;
      text-indent: 0;
   }
}

.options-box label>input+span.gender-male {
   background-image:
      url(${pageContext.request.contextPath }/resources/img/man2.png);
   background-position: center left 8px;
   background-repeat: no-repeat;
   text-indent: 14px;
}

@media ( max-width : 768px) {
   .options-box label>input+span.gender-male {
      background: transparent;
      text-indent: 0;
   }
}

.options-box label>input:checked+span {
   /* (RADIO CHECKED) IMAGE STYLES */
   border: solid 2px #fff;
}

.options-box label>input:checked+span.gender-female {
   /* (RADIO CHECKED) IMAGE STYLES */
   border: solid 2px #fff;
   background:
      url("https://storage.googleapis.com/pefam-web-cdn/filter_female_on.png");
   background-position: center left 8px;
   background-repeat: no-repeat;
   text-indent: 14px;
}

@media ( max-width : 768px) {
   .options-box label>input:checked+span.gender-female {
      background: transparent;
      text-indent: 0;
   }
}

.options-box label>input:checked+span.gender-male {
   /* (RADIO CHECKED) IMAGE STYLES */
   border: solid 2px #fff;
   background-position: center left 8px;
   background-repeat: no-repeat;
   text-indent: 14px;
}

@media ( max-width : 768px) {
   .options-box label>input:checked+span.gender-male {
      background: transparent;
      text-indent: 0;
   }
}

.row petwalker-card-bottom{
   margin:5px;
}

.reccomend-user-complete {
    font-size: 1.2rem;
    color: #666666;

    line-height: 200%;
    margin-left: 6px;
}

.petsitter-card-price{
   float:left;
}

</style>

<!-- Custom styles for this template -->
<link href="resources/vendor/bootstrap/css/grayscale.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>

<body>

   <%@include file="../home_menu.jsp" %>
   <div class="navbar navbar-default navbar-fixed-top" style = "margin-top:90px">
      <div class="container-fluid">
      	<div class="row">
      		
      	</div>
         <div class="row">
        	
      	
            <div class="index-search">
             <%-- <img src="${pageContext.request.contextPath }/resources/img/logo (2).png" alt="로고"  style = "width:100px;height:auto;display:inline"/>
 --%>
               <input type="text" placeholder="${input_address}" />
            </div>
         </div>

         <div class="row">
        	
            <div class="col-md-4">
               <div class="around">
                  <img
                     src="${pageContext.request.contextPath }/resources/img/placeholder.png"
                     alt="map" /><span>주변에 있는 펫워커 : ${TotalNum }명</span>
               </div>
            </div>
		
            <div class="col-md-8">
               <div class="options-box btn-group">

                  <label class="search-option-label">반려동물 : </label> <label
                     class="search-option-label search-option"> <input
                     id="input_has_pet" type="radio" name="hasPet" value="1">
                     <span for="input_has_pet">있음</span></label> <label
                     class="search-option-label search-option"> <input
                     id="input_has_not_pet" type="radio" name="hasPet" value="0">
                     <span for="input_has_not_pet">없음</span></label>
               </div>

               <div class="options-box">

                  <label class="search-option-label search-option-label">펫시터
                     성별 : </label> <label class="search-option-label search-option-gender">
                     <input id="input_gender_female" type="radio" name="gender"
                     value="1"> <span class="gender-female"
                     for="input_gender_female">여자</span>
                  </label> <label class="search-option-label search-option-gender">
                     <input id="input_gender_male" type="radio" name="gender"
                     value="0"> <span class="gender-male"
                     for="input_gender_male">남자</span>

                  </label>

               </div>
            </div>

         </div>

      </div>

   </div>

   <div class="container-fluid main-content" >
      <div class="row">
         <div class="col-md-7 left-content">

            <div class="row">
               
               <c:forEach var="list1" items="${searchList }" >
                  
                  <div
                     class="petwalker-card-box col-xl-4 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                     <div class="relative">
                        <a href="${pageContext.request.contextPath }/walkerPrf/detail_main.do?nickname=${list1.nickname }"> <span class="link-spanner"></span>
                        </a>

                        <div class="petwalker-card-top">
                           <div class="petwalker-card-over">
                              <img
                                 src="${pageContext.request.contextPath }/${list1.addProfilePath}" alt="이미지!!" class="detailImg" />
                           </div>
                        </div>
                        
                        
                        <div class="d-flex flex-row align-items-center">
                           <img
                              src="${pageContext.request.contextPath }/${list1.profilePath}"
                              alt="프로필사진" class="petwalker-card-profile" />
                           <div class="petsitter-card-text-box" style="margin-top: 10px">
                              <span class="petsitter-card-realname" style ="font-size:1.8rem; color:#000; font-weight:bold">${list1.id }</span>
                              <span class="petsitter-card-title">/ ${list1.nickname }</span><br />
                              <span class="petsitter-card-address" style = "font-size:1.3rem; color:#737373 ">${input_address}</span> <span
                                 class="petsitter-card-sex">${list1.sex }</span>
                           </div>
                        </div>
                        
                        <c:forEach var="list2" items="${starList }">
	                        <div class="row" >
	                           <div class="petwalker-card-bottom" style="padding:1px;">
	                              <div class="petsitter-card-star-box" style = "float:left">
	                              
                              		<c:if test="${list1.nickname eq list2.nickname }">
                              			<span><strong>리뷰 평점은 : </strong>${list2.stars }</span>
                              			<%-- <c:forEach begin="1" end="${list2.stars }" >
	                              			 <img src="https://storage.googleapis.com/pefam-web-cdn/star_s_off.png" class="star star-off">
                              			</c:forEach> --%>
                              		</c:if>
	                              	
	                              	</div>
	                           </div>
                        	
	                        </div>
	                        
                        </c:forEach>
	                    <div class="petsitter-card-price" style = "margin-left:50px; margin-top:10px;"><b>16,000원 부터 / 일</b></div>
	                        
                     </div>
                  </div>
               </c:forEach> 
            </div>


         </div>
         <div class="col-md-5 right-content">
               <div id="map" style="width: 100%; height: 400px"></div>

         </div>
      </div>
   </div>


   <%@include file="../home_footer.jsp"%>

   <script
      src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
   <script
      src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>



   <script type="text/javascript">
   
    var values = new Array();
    var values2 = new Array();
   
    //
    
        function initialize() {
        	//초기화 시키고
                   
              <c:forEach var="tmp" items="${findWalker}" varStatus="status">
                  values.push("${tmp.addr}");   
              </c:forEach>
                 
              if(values[0] == "홍제동"){
                 console.log("확인됨");
                 //37.4799348,126.99346020000007
                  var mapLocation = new google.maps.LatLng('37.586121', '126.948805'); // 지도에서 가운데로 위치할 위도와 경도
              }
          if(values[0] == "방배동"){
             console.log("방배동임");
             var mapLocation = new google.maps.LatLng('37.4799348', '126.99346020000007');
          }  
          if(values[0] == "천호동"){
             console.log("천호동임");
             var mapLocation = new google.maps.LatLng('37.5439937', '127.12564520000001');
          }
            
             
            var markLocation1_1 = new google.maps.LatLng('37.584930', '126.951337'); // 마커가 위치할 위도와 경도
            var markLocation1_2 = new google.maps.LatLng('37.585985', '126.944342'); // 마커가 위치할 위도와 경도
            var markLocation1_3 = new google.maps.LatLng('37.589929', '126.945029'); // 마커가 위치할 위도와 경도
            var markLocation1_4 = new google.maps.LatLng('37.583536', '126.946059'); // 마커가 위치할 위도와 경도
            var markLocation1_5 = new google.maps.LatLng('37.585219', '126.947711'); // 마커가 위치할 위도와 경도
            var markLocation1_6 = new google.maps.LatLng('37.586214', '126.948655'); // 마커가 위치할 위도와 경도
               
            
           var mapOptions = {
             center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
             zoom: 15, // 지도 zoom단계
             mapTypeId: google.maps.MapTypeId.ROADMAP
           };
           
           var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
               mapOptions);
            
           var size_x = 50; // 마커로 사용할 이미지의 가로 크기
           var size_y = 50; // 마커로 사용할 이미지의 세로 크기
            
           // 마커로 사용할 이미지 주소
           var image = new google.maps.MarkerImage('https://storage.googleapis.com/pefam-web-cdn/map_pin_you.png',
                               new google.maps.Size(size_x, size_y),
                               '',
                               '',
                               new google.maps.Size(size_x, size_y));
      
            var marker1;
           var marker2;
           var marker3;
           var marker4;
           var marker5;
           var marker6;
           var marker7;
           var marker8;
           var marker9;
           var marker10;
           
            
           marker1 = new google.maps.Marker({
                  position: markLocation1_1, // 마커가 위치할 위도와 경도(변수)
                  map: map,
                  icon: image, // 마커로 사용할 이미지(변수)
//                info: '말풍선 안에 들어갈 내용',
                  title: '사용자1' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
           }); 
           
           marker2 = new google.maps.Marker({
                  position: markLocation1_2, // 마커가 위치할 위도와 경도(변수)
                  map: map,
                  icon: image, // 마커로 사용할 이미지(변수)
//                info: '말풍선 안에 들어갈 내용',
                  title: '사용자1' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
           });
           
           
           marker3 = new google.maps.Marker({
                  position: markLocation1_3, // 마커가 위치할 위도와 경도(변수)
                  map: map,
                  icon: image, // 마커로 사용할 이미지(변수)
//                info: '말풍선 안에 들어갈 내용',
                  title: '사용자1' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
           });
           
           marker4 = new google.maps.Marker({
                  position: markLocation1_4, // 마커가 위치할 위도와 경도(변수)
                  map: map,
                  icon: image, // 마커로 사용할 이미지(변수)
//                info: '말풍선 안에 들어갈 내용',
                  title: '사용자1' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
           });
           
           marker5 = new google.maps.Marker({
                  position: markLocation1_5, // 마커가 위치할 위도와 경도(변수)
                  map: map,
                  //icon: image, // 마커로 사용할 이미지(변수)
//                info: '말풍선 안에 들어갈 내용',
                  title: '사용자1' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
           });
           
           marker6 = new google.maps.Marker({
                  position: markLocation1_6, // 마커가 위치할 위도와 경도(변수)
                  map: map,
                  //icon: image, // 마커로 사용할 이미지(변수)
//                info: '말풍선 안에 들어갈 내용',
                  title: '사용자1' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
           });
           
           var content = "홍제동 워커 위치입니다"; // 말풍선 안에 들어갈 내용
           
           
           <c:forEach var="tmp2" items="${findWalker}" varStatus="status">
               values2.push("${tmp2.nickname}");   
           </c:forEach>
           
           var infowindow = new Array();
           
           
           for(var i = 0;i<values2.length;i++){
              
              infowindow[i] = new google.maps.InfoWindow();
              google.maps.InfoWindow[content] = values2[i];
              
            console.log(values2[i]);               
              
           }
           
           //
          <c:forEach var="tmp" items="${findWalker}" varStatus="status">
             var info_${status.index} = new google.maps.InfoWindow({content:"${tmp.nickname}"});
                google.maps.event.addListener(marker1, "click", function() {
                 infowindow1_1.open(map,marker);
              });
             
          </c:forEach>
             
          /*  // 마커를 클릭했을 때의 이벤트. 말풍선 안에 content 내용
          
           var infowindow1_1 = new google.maps.InfoWindow({ content: "1"});
           var infowindow1_2 = new google.maps.InfoWindow({ content: "사용자이름2"});
           var infowindow1_3 = new google.maps.InfoWindow({ content: "사용자이름3"});
           var infowindow1_4 = new google.maps.InfoWindow({ content: "사용자이름4"});
           var infowindow1_5 = new google.maps.InfoWindow({ content: "사용자이름5"});
           var infowindow1_6 = new google.maps.InfoWindow({ content: "사용자이름6"});
           
        */

           google.maps.event.addListener(marker1, "click", function() {
              infowindow1_1.open(map,marker);
           });
           google.maps.event.addListener(marker2, "click", function() {
              infowindow1_2.open(map,marker2);
           }); 
           
           google.maps.event.addListener(marker3, "click", function() {
              infowindow1_3.open(map,marker3);
           }); 
           
           google.maps.event.addListener(marker3, "click", function() {
              infowindow1_4.open(map,marker4);
           }); 
           
           
           google.maps.event.addListener(marker3, "click", function() {
              infowindow1_5.open(map,marker5);
           }); 
           
           
           google.maps.event.addListener(marker3, "click", function() {
              infowindow1_6.open(map,marker6);
           }); 
           
           
            
         }
        
         google.maps.event.addDomListener(window, 'load', initialize);
         
   </script>


</body>
</html>