<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe/insert.jsp</title>
</head>
<body>
<script>
alert("${id }님이 작성한 새글이 등록 되었습니다.");
location.href="${pageContext.request.contextPath }/community/list.do";
 </script>
</body>
</html>