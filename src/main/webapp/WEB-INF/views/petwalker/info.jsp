<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../home_menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petwalker/info.jsp</title>
<style>
	.bottomCol {
   		border-top: 3px solid #64a19d;
   		margin: 0 auto;
	}
</style>
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>




<body style="margin-top: 120px">



<div class="container">
      <div class="row">

        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading panel_update">
              <h3 class="panel-title">${id }님의 개인정보</h3>

              
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center">
                <c:choose>
                   <c:when test="${dto.imagePath != null}">
                    <img src="${pageContext.request.contextPath }${dto.imagePath}"  class="img-responsive img-thumbnail"
               style="width:120px; height:120px"/>
                   </c:when>
                   <c:otherwise>
                       <img src="http://www.tangoflooring.ca/wp-content/uploads/2015/07/user-avatar-placeholder.png"
                     style="width:100px;"/>
                   </c:otherwise>
                </c:choose>
                  </div>
                  <br />
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>아이디</td>
                        <td>${dto.id }</td>
                      </tr>
                      <tr>
                        <td>카카오 아이디</td>
                        <td>${dto.kakao }</td>
                      </tr>
                      <tr>
                        <td>닉네임</td>
                        <td>${dto.nickname }</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>성별</td>
                        <td>${dto.sex }</td>
                      </tr>
                        <tr>
                        <td>집주소</td>
                        <td>${dto.addr }</td>
                      </tr>
                      <tr>
                        <td>휴대폰번호</td>
                        <td>${dto.phone }</td>
                        
                         </tr>
                         <tr>
                        <td>가입일</td>
                        <td>${dto.regdate }</td>
                        
                         </tr>
                        <td>펫유무</td>
                        <td>${dto.hasPet }
                        </td>
                           
                      </tr>
                     
                    </tbody>
                  </table>
                  
                  
                  <div align="center">
                  <a href="updateform.do" class="btn_update">회원정보 수정</a>
                  <a href="javascript:deleteConfirm()" class="btn_update">회원탈퇴</a>
                
                <c:choose>
                   <c:when test="${dto.isProfiled eq 0}">
                   <a href="profileform.do?nickname=${dto.nickname }" class="btn_update">프로필 입력</a>
                   </c:when>
                   <c:otherwise>
                      <a href="profileupdateform.do" class="btn_update">프로필 수정</a>
                   </c:otherwise>
                </c:choose>
                <a href="reservation.do?id=${dto.id }" class="btn_update">예약보기</a>
                </div>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
<script>

   function deleteConfirm(){
      var isDelete=confirm("회원 탈퇴 하시겠습니까?");
      if(isDelete){
         location.href="delete.do";
      }
   }
   
   
</script>