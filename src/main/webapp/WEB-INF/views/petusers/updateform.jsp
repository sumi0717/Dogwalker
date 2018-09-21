<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petusers/updateform.jsp</title>
</head>
<body>
<h3>회원정보 수정 페이지 입니다.</h3>
<form action="update.do" method="post" id="updateForm">
	<input type="hidden" name="id" value="${id }"/>
	<label for="id">아이디</label>
	<input type="text" id="id" value="${id }" 
		disabled="disabled"/><br/>
	<label for="kakao">카카오 아이디</label>
	<input type="text" name="kakao" id="kakao" 
		value="${dto.kakao }"/><br/>
	<label for="phone">휴대폰 번호</label>
	<input type="text" name="phone" id="phone" 
		value="${dto.phone }"/><br/>
	<label for="addr">주소</label>
	<input type="text" name="addr" id="addr" 
		value="${dto.addr }"/><br/>
	
	<button type="submit">수정 확인</button>
</form>
<a href="pw_changeform.do">비밀번호 변경</a>
</body>
</html>










