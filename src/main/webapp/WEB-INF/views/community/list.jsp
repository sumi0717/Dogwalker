<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
th,td{
border:1px solid black !important;
}
#condition{
height:25px;
}
.pagination > li > a{
border:hidden !important;
}
.pagination{
display:inline !important;
margin:0 auto !important;
}

.page_center{
margin-right: auto;
margin-left: auto
}
</style>
<meta charset="UTF-8">
<title>cafe/list.jsp</title>
</head>
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dogwalker.css" />
<link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/grayscale.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

<body>
<%@include file="../home_menu.jsp" %>
<div class="container text-center" style=" margin-top: 100px;">
	<h3>커뮤니티</h3>
		<!-- keyword 검색어 form -->
	<form action="list.do" method="post" class="pull-right">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
			<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
			<option value="writer" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
		</select>
		<input value="${keyword }" type="text" name="keyword" placeholder="검색어..." />
		<button type="submit" class="btncolor">검색</button>
	</form>
	<c:choose>
		<c:when test="${not empty keyword }">
		<br /><br />
			<p class="pull-right"><strong>${keyword }</strong> 검색어로 검색된 
			<strong style="color:#64a19d;">${totalRow }</strong>개의 글이 있습니다.</p>
		</c:when>
		<c:otherwise>
		<br /><br />
			<p class="pull-right"><strong style="color:#64a19d;">${totalRow }</strong>개의 글이 있습니다.</p>
		</c:otherwise>
	</c:choose>	
	<br /><br />
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>	
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${keyword}">${tmp.title }</a></td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:if test="${tmp.writer eq id }">
						<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="insertform.do" class="btncolor pull-right">새글 작성</a>
	<br /><br /><br />
	<!-- 페이징 처리 -->
	<div class="page_center">
	<ul class="pagination">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}"
					>&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }"
			end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}" class="btncolor">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}" class="btncolor">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a class="muted" href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>		
	</ul>
	</div>
	
</div>


<%@include file="../home_footer.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//삭제 확인을 하는 함수 
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
	
	    	
	$(".btncolor").addClass('btn_update');
	
	$("th").addClass('panel_update');
	    

</script>
</body>
</html>