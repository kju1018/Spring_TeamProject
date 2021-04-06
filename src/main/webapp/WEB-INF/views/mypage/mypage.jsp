<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>



<div class="container" style="margin-top: 12em;">

 <!-- 오른쪽 상단 계단 메뉴-->
 <ol class="sm_navi">
     <li class="sm_nav">홈 > </li>
     <li class="sm_nav">마이페이지</li>
 </ol>
 <br/>
    
    
<img src="<%=application.getContextPath()%>/resources/image/slide/slide11.PNG" class="container">
<!--제목-->
<div id="title">
    <p class="titleyj">마이페이지</p>
    
</div>

<div class="my_wrap">
   <div class="banner" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
      <div id="icon">
         <img src = "<%=application.getContextPath()%>/resources/image/clipboard.png" width="60">
      </div>
      <ul class="sq_button">
          <li>ORDER</li>
          <li>주문내역</li>
          <li>주문내역을 확인하실수 있습니다.</li>
      </ul>
   </div>
   <div class="banner" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypageupdate'">
       <div id="icon">
       <img src = "<%=application.getContextPath()%>/resources/image/user.png" width="60">
       </div>
       <ul class="sq_button">
           <li>PROFILE</li>
           <li>회원정보</li>
           <li>개인정보를 관리하는 공간입니다.</li>
       </ul>
   </div>
   <div class="banner" onclick="location.href ='<%=application.getContextPath()%>/likes/likelist'">
       <div id="icon">
       <img src = "<%=application.getContextPath()%>/resources/image/like.png" width="60">
       </div>
       <ul class="sq_button">
           <li>LIKE</li>
           <li>좋아요</li>
           <li>'좋아요'를 선택한 상품 목록</li>
       </ul>
   </div>
   <div class="banner" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
       <div id="icon">
       <img src = "<%=application.getContextPath()%>/resources/image/post.png" width="60">
       </div>
       <ul class="sq_button">
           <li>BOARD</li>
           <li>게시물 관리</li>
           <li>게시물을 관리하는 공간입니다.</li>
       </ul>
   </div>
 </div>	
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>