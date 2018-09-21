<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.content{
		border: 1px solid #888888;
	}
	.content p{
		height:200px;
	}
	.content img{
		max-width: 100%;
	}
	.comment{
		position: relative;
	}
	/* 댓글에 댓글을 다는 폼은 일단 숨겨 놓기 */
	.comment form{
		display: none;
	}
	.comments ul {
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments ul li{
		border-top: 1px solid #888;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	/* 댓글의 댓글 이미지 배치*/
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.muted{
		color: #888;
	}
	.comments form textarea, .comments form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	pre{
	background-color:white;
	border:1px;
	padding:0px !important
	}
</style>
</head>
<body>
<%@include file="../home_menu.jsp" %>
<div class="container" style=" margin-top: 100px;">
	<c:if test="${not empty keyword }">
		<p> 검색어 : <strong>${keyword }</strong> 에 대한 자세히 보기</p>
	</c:if>
	
	<h3>글 자세히 보기</h3>
	<c:if test="${sessionScope.id eq dto.writer }">
		<a href="updateform.do?num=${dto.num }">수정</a>
		<a href="javascript:deleteConfirm()">삭제</a>
	</c:if>
	<table>
		<tr>
			<th>글 번 호</th>
			<td>&nbsp;&nbsp;&nbsp;${dto.num }</td>
		</tr>
		<tr>
			<th>작 성 자</th>
			<td>&nbsp;&nbsp;&nbsp;${dto.writer }</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>&nbsp;&nbsp;&nbsp;${dto.title }</td>
		</tr>
	</table>
	<br /><br />
	<div class="content">${dto.content }</div>
	
	<br />
	<div class="pull-right">
		<a href="list.do">글 전체 목록보기</a>
		<div>
			<c:if test="${dto.prevNum ne 0}">
				<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}">이전글</a> |
			</c:if>
			<c:if test="${dto.nextNum ne 0}">
				<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}">다음글</a>
			</c:if>
		</div>
	</div>
	<br /><br /><br />
	<!-- 댓글에 관련된 UI -->
	<div class="comments">
		<ul>
			<c:forEach var="tmp" items="${commentList }">
				<li class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
					<c:if test="${tmp.num ne tmp.comment_group }">
						<img class="col-md-2 col-sm-2 hidden-xs"/>
						</c:if>	
				
					<dl>
						<dt>
							<img class="col-md-2 col-sm-2 hidden-xs" src="${pageContext.request.contextPath }/${tmp.imagePath}"
							style="width:70px;"/>
					
							<span>${tmp.writer }</span>
							<span>${tmp.regdate }</span>
							<a href="javascript:" class="reply_link">답글</a> |
							<a href="">신고</a>
						</dt>
						<dd>
							<c:if test="${tmp.num ne tmp.comment_group }">
								<i class="muted">${tmp.target_id }님에게 답글</i>
								<br/>
							</c:if>
							<pre>${tmp.content }</pre>
						</dd>
					</dl>
					<form action="comment_insert.do" method="post">
						<!-- 덧글 작성자 -->
						<input type="hidden" name="writer" value="${id }"/>
						<!-- 덧글 그룹 -->
						<input type="hidden" name="ref_group" value="${dto.num }" />
						<!-- 덧글 대상 -->
						<input type="hidden" name="target_id" value="${tmp.writer }" />
						<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
						<textarea name="content" cols="40" rows="5"></textarea>
						<button type="submit" style="height:85px;">등록</button>
						<p>악플은 안돼요!</p>
						<br />
					</form>		
				</li>
			</c:forEach>
		</ul>
	
		
		<!-- 원글에 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<input type="hidden" name="writer" 
					value="${id }" />
				<input type="hidden" name="ref_group" 
					value="${dto.num }"/>
				<input type="hidden" name="target_id" 
					value="${dto.writer }"/>
				<textarea name="content" id="coment" cols="100" rows="5"></textarea>
				<button type="submit" class="btn_update" style="width:  100px;height: 90px;">등록</button>
			</form>
		</div>
		
	</div>
	
				
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
function deleteConfirm(){
	var isDelete=confirm("글을 삭제 하시겠습니까?");
	if(isDelete){
		location.href="community/delete.do?num=${dto.num}";
	}
}
	//로그인 했는지 여부
var isLogin=${isLogin};

//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
$(".comment_form > form, .comment form").submit(function(){
	if(!isLogin){//로그인 하지 않았으면
		var isGoLogin=confirm("로그인이 필요 합니다.");
		if(isGoLogin){
			//로그인 페이지로 이동하기
			location.href="${pageContext.request.contextPath}"+
				"/petwalker/loginform.do"+
				"?url=${pageContext.request.contextPath}"+
				"/community/detail.do?num=${dto.num}";
		}
		return false;//폼 전송 막기 
	}
});

// 답글 링크를 눌렀을때 실행할 함수 등록 
$(".comment .reply_link").click(function(){
	if($(this).text()=="답글"){
		$(this).text("취소");
	}else{
		$(this).text("답글");
	}
	
	$(this)
	.parent().parent().parent()
	.find("form")
	.slideToggle(200);
});
</script>
</body>
</html>
