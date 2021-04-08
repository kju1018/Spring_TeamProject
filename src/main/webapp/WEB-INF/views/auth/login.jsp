<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<h1 style="color:red;">${requestScope.loginFailMsg}</h1>
   <div class="container-lg item_mt-18">
		  
			    <c:if test="${empty errormsg}">
	               <div class="text_center_sort">
					   
				    </div>
			   </c:if> 
   	  <form method="post" action="<%=application.getContextPath()%>/login">
   	  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="row justify-content-center border" >
            <div class="col-6">
                <!--제목부분-->
                <div class="text_center_sort item_mt-2"><h5>회원로그인</h3></div>
                <!--아이디 입력--> 
                <div class=" item_mt-2">
                    <input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
                </div>
                <!--비밀번호 입력-->
                <div class="item_mt-05" >
                    <input type="password" class="form-control" id="upassword" name="upassword" placeholder="PASSWORD">
                </div>
                <c:if test="${not empty errormsg}">
	               <div class="item_mt-05">
					   	 <font color="red">
					           원인 :  ${errormsg}</p>
					        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					     </font>
				    </div>
			   </c:if> 
			   <c:if test="${empty errormsg}">
	               <div class="item_mt-05">
					   	
				    </div>
			   </c:if> 
                <!--로그인 버튼-->
                <div >
                    <button type="submit" class="btn btn-dark btn-lg item_width_100 btn-block">로그인</button>
                </div>
               
                <!-- span 태그-->
                <div class="item_mt-05  item_pl-1">
                	<a href="<%=application.getContextPath()%>/auth/find_id"><span class="fontsize-sm">아이디 찾기 |</span></a>
                    <a href="<%=application.getContextPath()%>/auth/find_pw"><span class="fontsize-sm">비밀번호 찾기 </span></a>
                </div>
                <!--회원가입 버튼-->
                <div class="item_mt-05 item_mb-3">
                    <a href="<%=application.getContextPath()%>/auth/signup" class="btn btn-secondary btn-lg item_width_100 btn-block">회원가입</a>
                </div>
              
                
            </div>
        </div>
        </form>
    </div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>