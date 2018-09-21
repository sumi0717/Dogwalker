<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petwalker/reservation.jsp</title>
<style>
.bottomCol {
	border-top: 3px solid #64a19d;
	margin: 0 auto;
}
</style>
<link
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
<link
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
</head>
<%@include file="../home_menu.jsp"%>
<body style="margin-top: 180px">

	<div class="container">
		<div class="row bottomCol" style="margin-bottom: 130px">
			<h3>예약 목록</h3>
			<table class="table table-border">
				<thead>
					<tr>
						<th>신청자</th>
						<th>카카오톡아이디</th>
						<th>날짜</th>
						<th>시간대</th>
						<th>사이즈</th>
						<th>펫캠</th>
						<th>신청받은 예약</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td>${tmp.nickname }</td>
							<td>${tmp.kakao }</td>
							<td>${tmp.selectDate }</td>
							<td>${tmp.timeSlot }</td>
							<td>${tmp.dogSize }</td>
							<td>${tmp.cctv }</td>
							<td><c:choose>
									<c:when test="${tmp.isReserved == 1 }">
							예약을 수락 했습니다
						</c:when>
									<c:when test="${tmp.isReserved == 2 }">
							예약을 거부 했습니다
						</c:when>
									<c:when test="${tmp.isReserved == 0 }">

										<button class="small-btn btn-default" type="button"
											onclick="javascript:rsvConfirm(${tmp.num },${tmp.nickname })">수락</button>
										<button class="small-btn btn-default" type="button"
											onclick="javascript:rsvConfirm2(${tmp.num })">거절</button>
									</c:when>

								</c:choose></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>


<script>

	function rsvConfirm(num,nickname){
		var isReserved = confirm("이 예약을 수락 하시겠습니까?");
		if(isReserved){
			location.href="reserved.do?num="+num+"&nickname="+nickname;
		}else if(!isReserved){
			location.href="reservation.do";
			alert("예약이 수락되지 않았습니다");
		}
	}
	
	function rsvConfirm2(num){
		var isReserved = confirm("예약을 거절 하시겠습니까?");
				
		if(isReserved){
			location.href="notReserved.do?num="+num;
			alert("예약이 거절 되었습니다");
			
		}else if(!isReserved){
			location.href="reservation.do";
			alert("예약이 거절되지 않았습니다");
			
		}
	}
</script>
<%@include file="../home_footer.jsp"%>
</html>