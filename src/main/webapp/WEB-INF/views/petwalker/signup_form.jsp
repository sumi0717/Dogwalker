<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petwalker/signup_form.jsp</title>
<style>
footer {
    margin: 50px 0;
}
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
.resvReq {
   text-align: center;
   padding: 60px 0 180px;
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/bg_city.png");
   background-position: bottom;
   background-repeat: no-repeat;
   background-size: 100% auto;
}
.resvReq .p24 {
   font-size: 1.5rem;
   margin: 0 0 20px;
   color: #000;
}
@media ( max-width : 576px) {
   .resvReq .p24 {
      font-size: 1rem;
   }
}
.resvReq input {
   font-size: 1.25rem;
}
@media ( max-width : 576px) {
   .resvReq input {
      font-size: 1rem;
      background-position: center left 0.5rem;
      padding-left: 2.2rem;
   }
}
.resvReq .boarder-box {
   border: 2px solid #999;
   padding: 42px 75px 40px;
   margin: 40px 0;
   text-align: left;
}
@media ( max-width : 576px) {
   .resvReq .boarder-box {
      margin-left: 10px;
      margin-right: 10px;
      padding: 20px;
   }
}
.resvReq input[type=text] {
   display: table-cell;
   vertical-align: middle;
   outline: none;
   border: 1px solid #999;
   height: 50px;
   border-radius: 2px;
   padding-left: 5px;
   font-size: 1.25rem;
   vertical-align: middle;
   background-position: center left 1rem;
   background-repeat: no-repeat;
   margin: 0;
}
.resvReq input[type=text]:focus {
   outline: none;
   border-color: inherit;
   box-shadow: none;
}
@media ( max-width : 576px) {
   .resvReq input[type=text] {
      font-size: 1rem;
      background-position: center left 0.5rem;
      padding-left: 2.3rem;
   }
}
.datePicker input {
   width: 100%;
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/icon_field_cal.png");
}
.resvReq .leftItem {
   display: inline-block;
   width: 476px;
   margin: 0 76px 0 0;
}
.resvReq .rightItem {
   display: inline-block;
   width: 476px;
   margin: 0;
}
.input-btn-append {
   border: 1px solid #999;
   height: 50px;
   border-top-right-radius: 10px;
   border-bottom-right-radius: 10px;
   background-color: #0faca0;
   color: white;
   font-size: 0.875rem;
}
.input-btn-append:hover {
   cursor: pointer;
   background-color: #13dbcc;
}
.input-btn-append:disabled {
   background-color: #074e49;
}
.input-btn-append:focus {
   outline: none;
   background-color: #13dbcc;
}
.input-control[name=phone] {
   border-top: 1px solid #999;
   border-bottom: 1px solid #999;
   border-left: 1px solid #999;
   border-top-left-radius: 3px;
   border-bottom-left-radius: 3px;
   background:
      url("https://storage.googleapis.com/pefam-web-cdn/icon_field_phone.png");
   background-position: center left 2rem;
   background-repeat: no-repeat;
   padding-left: 75px;
}
@media ( max-width : 576px) {
   .input-control[name=phone] {
      font-size: 1rem;
      background-position: center left 0.5rem;
      padding-left: 2.3rem;
   }
}
.input-control[name=phone]:focus {
   outline: none;
   border-color: inherit;
   box-shadow: none;
}
.input-control[name=authNum], #sms-login .input-control[name=authNum] {
   border-top: 1px solid #999;
   border-bottom: 1px solid #999;
   border-left: 1px solid #999;
   border-top-left-radius: 3px;
   border-bottom-left-radius: 3px;
   background:
      url("https://storage.googleapis.com/pefam-web-cdn/icon_field_certi.png");
   background-position: center left 2rem;
   background-repeat: no-repeat;
   padding-left: 75px;
}
@media ( max-width : 576px) {
   .input-control[name=authNum], #sms-login .input-control[name=authNum] {
      font-size: 1rem;
      background-position: center left 0.5rem;
      padding-left: 2.3rem;
   }
}
.input-control[name=authNum]:focus, #sms-login .input-control:focus[name=authNum]
   {
   outline: none;
   border-color: inherit;
   box-shadow: none;
}
.input-name {
   width: 100%;
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/icon_field_name.png");
}
.input-req {
   width: 100%;
   outline: none;
   border: 1px solid #999;
   height: 50px;
   border-radius: 2px;
   font-size: 1rem;
}
@media ( max-width : 576px) {
   .input-req {
      font-size: 0.8rem;
   }
}
#sms-login .input-control[name=authNum] {
   border-right: 1px solid #999;
}
.auth-timer-box {
   position: relative;
}
.authTimer {
   position: absolute;
   right: 130px;
}
#sms-login .auth-timer-box {
   height: 50px;
}
#sms-login .authTimer {
   right: 20px;
}
.input-img-prepend {
   border-top: 1px solid #999;
   border-bottom: 1px solid #999;
   border-left: 1px solid #999;
   border-right: 0;
   border-top-left-radius: 0;
   border-bottom-left-radius: 0;
   background-color: transparent;
   padding-left: 30px;
}
.authTimer {
   vertical-align: middle;
   width: auto;
   height: 50px;
   margin: 0;
   line-height: 50px;
   color: #e43949;
   font-size: 0.875rem;
}
.resvReq h2 {
   font-size: 2rem;
}
@media ( max-width : 576px) {
   .resvReq h2 {
      font-size: 1.5rem;
   }
}
.resvReq .nameInput {
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/icon_field_name.png");
}
.resvReq input[type=checkbox]:before {
   content: "";
   display: inline-block;
   width: 30px;
   height: 30px;
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/check_box_off.png");
}
.resvReq input[type=checkbox]:checked:before {
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/check_box_on.png");
}
.resvReq .colorMain {
   color: #219fdf;
}
.resvReq .termTitles {
   min-height: 50px;
   margin: 0;
   padding: 0;
}
.resvReq .agreeAll {
   font-size: 1.25rem;
   line-height: 20px;
   font-weight: 800;
   color: #219fdf;
}
.resvReq .agreeAll :hover {
   cursor: pointer;
}
.resvReq a {
   font-size: 1.125rem;
   line-height: 20px;
   color: #333;
   margin-left: 20px;
   vertical-align: middle;
   vertical-align: -webkit-baseline-middle;
}
.btn-main {
   width: 90%;
   max-width: 776px;
   min-width: 200px;
   height: 60px;
   background-color: #4f837f ;
   color: #fff;
   font-size: 1.25rem;
   border: 2px solid #4f837f;
   border-radius: 500px;
   margin: 90px 10px 0;
}
@media ( max-width : 576px) {
   .btn-main {
      margin: 30px 10px 0;
   }
}
.btn-main:hover {
   cursor: pointer;
   background-color: #4f837f;
   border: 2px solid #4f837f;
}
.btn-main:disabled {
   background-color: #136087;
   border: 2px solid #39a1d7;
}
.btn-main:focus {
   outline: none;
   background-color: #4f837f;
   border: 2px solid #4f837f;
}
.btn-main a {
   text-decoration: none;
   color: #fff;
}
/** RESERVATION LIST **/
#reservation-list {
   border: 1px solid #000;
   margin-top: 20px;
}
.resvList {
   text-align: center;
   padding: 60px 0 180px;
   background-image:
      url("https://storage.googleapis.com/pefam-web-cdn/bg_city.png");
   background-position: bottom;
   background-repeat: no-repeat;
   background-size: 100% auto;
}
.resvList .resvItem {
   border-bottom: 1px solid #000;
   background-color: #fff;
   width: 100% auto;
   height: 80px;
   text-align: left;
   vertical-align: middle;
   position: relative;
   display: -ms-flexbox;
   display: flex;
   -ms-flex-align: center;
   align-items: center;
}
#reservation-list :last-child {
   border-bottom: none;
}
.resvItem .rounded-circle {
   width: 46px;
   max-width: 46px;
   height: 46px;
   max-height: 46px;
   margin: 0 6px;
   display: block;
}
.resvList .resvItem .emptyImg {
   background-color: #ccc;
}
.resvList h1 {
   font-size: 2rem;
   margin: 0 0 20px;
   color: #000;
}
@media ( max-width : 576px) {
   .resvList h1 {
      font-size: 1.5rem;
   }
}
.resvList p {
   font-color: #000;
   margin: 0;
   padding: 0;
}
.resvList .p14 {
   font-size: 0.875rem;
}
@media ( max-width : 576px) {
   .resvList .p14 {
      font-size: 0.7rem;
   }
}
.resvList .p18 {
   font-size: 1.125rem;
}
@media ( max-width : 576px) {
   .resvList .p18 {
      font-size: 1.0rem;
   }
}
.resvList .p24 {
   font-size: 1.5rem;
}
@media ( max-width : 576px) {
   .resvList .p24 {
      font-size: 1.1rem;
   }
}
.resvList .colorMain {
   color: #219fdf;
}
.resvList .grey666 {
   color: #666;
   margin: 0;
}
</style>

<meta charset="UTF-8">
</head>
<body>
<%@include file="../home_menu.jsp" %>
   <div class="container-fluid">
      <div class="contents-header"></div>
      <div class="contents-body">
         <form action="signup.do" method="post" id="signupForm"
            enctype="multipart/form-data">
            <div class="resvReq">
               <div class="center-column">
                  <h1>
                     <strong>도그 워커 회원가입 페이지입니다.</strong>
                  </h1>
                  <p class="class">회원가입을 하시면 도그 워커가 될 수 있습니다.</p>
                  <div class="boarder-box">
                     <p class="p24">
                        <b>아이디</b>
                     </p>
                     <div class="col-xl-12">
                        <div>
                           <input class="input-req" type="text" id="id" name="id"
                              placeholder="아이디를 입력해주세요"> <span id="checkResult"></span>
                        </div>
                     </div>
                     <div class="col-xl-12">
                        <p class="p24">
                           <b>닉네임</b>
                        </p>
                        <input class="input-req" type="text" name="nickname" id="nickname"
                           placeholder="닉네임을 입력해주세요" /><br />
                     </div>
                     <div class="col-xl-12">
                        <p class="p24">
                           <b>비밀번호</b>
                        </p>
                        <input class="input-req" type="text" name="pwd" id="pwd"
                           placeholder="비밀번호를 입력해주세요" /><br />
                     </div>
                     <div class="col-xl-12">
                        <p class="p24">
                           <b>카카오 아이디</b>
                        </p>
                        <input class="input-req" type="text" name="kakao" id="kakao"
                           placeholder="카카오아이디를 입력해주세요" /><br />

                        <p class="p24">
                           <b>휴대폰 번호</b>
                        </p>
                        <input class="input-req" type="text" name="phone" id="phone"
                           placeholder="휴대폰번호를 입력해주세요" /><br />
                     </div>
                     <p class="p24">
                        <b>주소</b>
                     </p>
                     <input class="input-req" type="text" name="addr" id="input_address" placeholder="주소를 입력해주세요" /><br />
                     <lagend><p class="p24"><b>성별</b></p></lagend>
                     <label> <input type="radio" name="sex" id="sex"
                        value="woman" checked="checked" />여자
                     </label> <label> <input type="radio" name="sex" id="sex"
                        value="man" checked="checked" />남자
                     </label> <br />
                      <br />
                     <lagend><p class="p24"><b>펫 소유</b></p></lagend>
                     <label> <input type="radio" name="hasPet" id="hasPet"
                        value="yes" checked="checked" />예
                     </label> 
                     <label> <input type="radio" name="hasPet" id="hasPet"
                        value="no" checked="checked" />아니요
                        <br />
                     </label> <br /> <label for="myFile"><p class="p24"><b>이미지</b></p></label> <input type="file"
                        name="file" id="file" /> <br />
                        <br />
                  </div>
               </div>
               <button class="btn-main" id="btn" type="submit">가입하기</button>
            </div>
         </form>
      </div>
   </div>



   <script
      src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
   <script>
      //폼의 유효성 여부
      var formValid = false;
      $("#signupForm").submit(function() {
         //만일 폼의 유효성 여부가 false 이면 
         if (formValid == false) {
            return false;//폼 전송 막기
         }
      });
      //아이디 입력란에 입력했을때 실행할 함수 등록 
      $("#id").on("input", function() {
         //입력한 아이디를 읽어와서
         var inputId = $(this).val();
         //ajax 요청을 이용해서 서버에 보낸다.
         $.ajax({
            url : "checkid.do",
            method : "post",
            data : {
               "inputId" : inputId
            },
            success : function(responseData) {
               //뭐가 응답되는지 콘솔에 출력해 보기 
               console.log(responseData);
               // responseData 는 object 이다.
               // {canUse:true} 또는 {canUse:false}
               if (responseData.canUse) {
                  formValid = true;
                  $("#checkResult").text("사용가능").css("color", "#00ff00");
               } else {
                  formValid = false;
                  $("#checkResult").text("사용불가").css("color", "#ff0000");
               }
            }
         });
      });
   </script>
   
   
   <script>
	   $(function() {
	       var placesAutocomplete = places({
	         container: document.querySelector('#input_address')
	       });
	  });

   
   </script>
   
   

	<script src="https://cdn.jsdelivr.net/npm/places.js@1.9.0"></script>
 	  
</body>
</html>