<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">


<title>/search/allWalker</title>

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
	margin-top: 170px;
	margin-bottom: 100px;
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

.row petwalker-card-bottom {
	margin: 5px;
}

.reccomend-user-complete {
	font-size: 1.2rem;
	color: #666666;
	line-height: 200%;
	margin-left: 6px;
}

.petsitter-card-price {
	float: left;
}
</style>



<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />

</head>

<body>

	<%@include file="../home_menu.jsp"%>

	<div class="container main-content">
		<div class="row">
			<div class="col-md-12 left-content">

				<div class="row">

					<c:forEach var="list1" items="${searchList }">

						<div
							class="petwalker-card-box col-xl-3 col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="relative">
								<a
									href="${pageContext.request.contextPath }/walkerPrf/detail_main.do?nickname=${list1.nickname }">
									<span class="link-spanner"></span>
								</a>

								<div class="petwalker-card-top">
									<div class="petwalker-card-over">
										<img
											src="${pageContext.request.contextPath }/${list1.addProfilePath}"
											alt="이미지!!" class="detailImg" />
									</div>
								</div>


								<div class="d-flex flex-row align-items-center">
									<img
										src="${pageContext.request.contextPath }/${list1.profilePath}"
										alt="프로필사진" class="petwalker-card-profile" />
									<div class="petsitter-card-text-box" style="margin-top: 10px">
										<span class="petsitter-card-realname"
											style="font-size: 1.8rem; color: #000; font-weight: bold">${list1.id }</span>
										<span class="petsitter-card-title">/ ${list1.nickname }</span><br />
										<span class="petsitter-card-address"
											style="font-size: 1.3rem; color: #737373">${input_address}</span>
										<span class="petsitter-card-sex">${list1.sex }</span>
									</div>
								</div>

								<c:forEach var="list2" items="${starList }">
									<div class="row">
										<div class="petwalker-card-bottom" style="padding: 1px;">
											<div class="petsitter-card-star-box" style="float: left">

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
								<div class="petsitter-card-price"
									style="margin-left: 50px; margin-top: 10px;">
									<b>16,000원 부터 / 일</b>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>


			</div>

		</div>
	</div>


	<%@include file="../home_footer.jsp"%>


</body>
</html>