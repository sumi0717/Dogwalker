<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<header class="header_gnb">
   <div class="login_area">
      <c:choose>
         <c:when test="${not empty id }">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/petwalker/logout.do">logout</a>
         </c:when>
         <c:otherwise>
               <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/home_login.do">login</a>
          </c:otherwise>
      </c:choose>
      
     <c:choose>
         <c:when test="${ (not empty id) and (isWalker eq true)  }">
               <strong><a href="${pageContext.request.contextPath }/petwalker/info.do">${id }</a></strong>님 마이페이지
         </c:when>
         <c:when test="${ (not empty id) and (isWalker eq false)  }">
               <strong><a href="${pageContext.request.contextPath }/petusers/info.do">${id }</a></strong>님 마이페이지  
         </c:when>
         <c:otherwise>
            <a href="${pageContext.request.contextPath }/home_signup.do">join us</a>
            </c:otherwise>
         </c:choose>
   </div>
   <div class="gnb_area">
      <h1>
         <a href="${pageContext.request.contextPath }/home.do"><img
            src="${pageContext.request.contextPath }/resources/img/logo (2).png"
            alt="logo" /></a>
      </h1>
      <nav>
         <button type="button">Menu</button>
         <ul class="list_gnb">
            <li><a href="${pageContext.request.contextPath }/search/list.do">All walker</a></li>
            <li><a
               href="${pageContext.request.contextPath }/review/list.do">Review</a></li>
            <li><a
               href="${pageContext.request.contextPath }/community/list.do">Community</a></li>
         </ul>
      </nav>
   </div>
</header>