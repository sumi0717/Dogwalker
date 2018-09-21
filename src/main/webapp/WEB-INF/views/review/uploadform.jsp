<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../home_menu.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>review/uploadform</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bars-square.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fontawesome-stars.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js" /></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="${pageContext.request.contextPath }/resources/js/jquery.barrating.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-select.css" />
<script src="${pageContext.request.contextPath }/resources/js/bootstrap-select.js"></script>





<style>
@font-face {
        font-family: 'Glyphicons Halflings';
        src:url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.eot');
        src:url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.woff') format('woff'),
          url('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
      }
    .animated {
    -webkit-transition: height 0.2s;
    -moz-transition: height 0.2s;
    transition: height 0.2s;
}
html{
   font-size:15px;
}
.stars
{
    margin: 20px 0;
    font-size: 24px;
    color: #d17581;
}
.form{
   width:100%;
}
input{
   margin-bottom:10px;
}
#counter {
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
  float:right;
}
.container{
   margin-top:140px;
}
#walker{
   height: 50px;
}
</style>
</head>
<body>
<div class="container">
   <div style="text-align:center;">
      <h2>도그 워커 후기 게시판</h2>
      <p>회원님들의 도그 워커 후기를 써주세요</p>
   </div>
   <br /><br />

   <form id="reviewform" name="reviewform" action="upload.do" method="post" enctype="multipart/form-data">
        <div class="form">
        <label for="nickname">워커</label>
        <br />
        <select name="nickname" id="nickname" data-height="50px" data-width="50%" data-style="btn-info" class="selectpicker " data-live-search="true"  title="후기를 남길 워커를 선택하세요">
           <c:forEach var="tmp" items="${list }">
               <option>${tmp.nickname } </option>
           </c:forEach>
           </select>
        </div>
        <br />
        
        <label for="stars">별점</label>
        <select id="example-square" name="stars" id="stars">
                  <option value=""></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
         </select>
        <label for="title">제목</label>
        <input type="text" name="title" id="title" style="width:100%"/>
        <div class="wrap">
              <textarea class="form-control animated"  minlength="40" cols="50" id="content" name="content" placehlder="Enter your review here..." rows="5"></textarea>
           <span id="counter">###</span>
           <br />
        </div>
      <label for="myFile">이미지</label>
      <input type="file" name="file" id="file"/><br/>
        <div class="text-right">
              <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
              <span class="glyphicon glyphicon-remove"></span>Cancel</a>
              <button class="btn btn-success btn-lg" type="submit">Save</button>
         </div>
         </form>
         
</div>
         <%@include file="../home_footer.jsp" %>
         <script>
         $(function() {
             $('#example-square').barrating({
               theme: 'fontawesome-stars'
             });
          });
         
         
         $(function() {
             $('#content').keyup(function (e){
                 var content = $(this).val();
                 $('#counter').html('40/' + content.length );
             });
             $('#content').keyup();
       });
         
         </script>

         
</body>
</html>