<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Let's Run, Pet walker!</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/form.css" />
<style>

 .fotorama__wrap {
    -webkit-text-size-adjust: 100%;
    position: relative;
    direction: ltr;
    z-index: 0;
    /* text-align: center; */
    margin: 0 auto;
}
 
.divider {
	border: 1px solid #ccc;
}

img {
	width: 100%;
	height: 162px;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.icons {
	text-align: center;
	margin: auto;
}

.bottomCol {
	border-top: 3px solid #64a19d;
	margin: 0 auto;
	margin-top: 15px;
}

.bottomCol>h3 {
	margin-left: 40px;
}

.wk>p {
	margin-left: 60px;
}

.wk {
	margin-top: 15px;
}

.round>p {
	font-size: 12px;
	color: black;
	width: 100px;
	margin-top: 0;
	margin-bottom: 0;
	margin-left: -30px;
}
</style>



<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
<!-- 리뷰슬라이드 끝 -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<!-- 포토라마 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 33 KB -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<!-- 3 KB -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- 16 KB -->
<!-- 아이콘 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
</head>
<body style="margin-top: 180px">

	<%@include file="../home_menu.jsp"%>
	<div class="container">

		<div class="row">
			<div class="col-sm-7 center-block">

				<div class="fotorama" data-autoplay="true"
					data-nav="thumbs" data-allowfullscreen="true">

					<img src="${pageContext.request.contextPath}/${pwk.filePath }" class="img-responsive img-thumbnail"
						style="height: 260px; width: 500px" /> 
					<img src="${pageContext.request.contextPath}/${pwk.filePath }" class="img-responsive img-thumbnail"
						style="height: 260px; width: 500px" /> 
					<img src="${pageContext.request.contextPath }/resources/img/dog4.jpg" class="img-responsive img-thumbnail"
						style="height: 260px; width: 500px" />

				</div>

			</div>
			<div class="col-sm-5">

				<h3>${pwk.nickname }</h3>

				<p>바쁜 반려견 보호자를 대신하여 저희 도그 워커가 산책을 통해 에너지를 발산시켜 드립니다! 반려견의 스트레스를
					낮춰주고 교육을 통해 문제 행동 개선을 돕는 도그 워커!</p>
				<div class="row">
					<div class="col-xs-4 icons">
						<div class="round round-lg hollow orange">
							<span class="fa fa-tags"></span><br />
							<p>소형:</p>
							<p>5kg 미만</p>
							<p>15000원</p>
						</div>
					</div>
					<div class="col-xs-4 icons">
						<div class="round round-lg hollow orange">
							<span class="fa fa-tags"></span><br />
							<p>중형:</p>
							<p>10~15kg</p>
							<p>20000원</p>
						</div>
					</div>
					<div class="col-xs-4 icons">
						<div class="round round-lg hollow orange">
							<span class="fa fa-tags"></span><br />
							<p>대형:</p>
							<p>15kg 이상</p>
							<p>20000원</p>
						</div>
					</div>


				</div>


				<div class="action" style="text-align: center; margin-top: 50px;">
					<c:choose>
						<c:when test="${id == petUser.id}">
						
							<button class="btn btn-default" type="button"
							onclick="location.href='insertform.do?petwalker=${pwk.nickname }'">
								RESERVATION
							</button>
						</c:when>
				
						<c:otherwise>
							<button class="btn btn-default rsvb"
								style="cursor: no-drop">RESERVATION</button>
							<script>
								$(".rsvb").click(function() {
									alert("유저만 예약 가능합니다! ")
								})
							</script>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
		</div>

		<div class="row bottomCol">
			<h3>펫 워커 경험</h3>
		</div>
		<div class="row right-block wk">
			<p>${pwk.experience }</p>
		</div>
		<div class="row bottomCol">
			<h3>워커 경력</h3>
		</div>
		<div class="row right-block wk">
			<p>${pwk.career }</p>
		</div>
		<div class="row bottomCol">
			<h3>워커로서 제공 가능한 무료 서비스</h3>
		</div>
		<div class="row right-block wk">
			<p>${pwk.freeservice }</p>
		</div>
		<div class="row bottomCol">
			<h3>받은 리뷰들</h3>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="row">
							<c:forEach var="tmp" items="${list }">
								<div class="col-md-3">
									<div class="card">
										<div class="card-img">
											<img
												src="${pageContext.request.contextPath }/${tmp.imagePath }">
										</div>
										<div class="card-body">
											<h5>${tmp.title }</h5>
											<h4 class="pt-1 pb-2">${tmp.content }</h4>


										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>


			</div>

		</div>

		</div>


		
		<script>
			var swiper = new Swiper('.swiper-container', {
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
			});
		</script>
</body>
<%@include file="../home_footer.jsp"%>
</html>