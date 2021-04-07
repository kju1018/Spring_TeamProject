<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<script>
	$(function () {
	    var token = $("input[name='_csrf']").val();
	    var header = "X-CSRF-TOKEN";
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	});
	
	function openZipSearch() {

		const uaddress2 = $("#uaddress2").val();
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=uzipcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=uaddress]').val(data.address);
				$('[name=uaddress2]').val(uaddress2);

			}
		}).open();
	}
		const updatepage = () => {
			event.preventDefault();
			const uzipcode = $("#uzipcode").val();
			var uaddress = $("#uaddress").val();
			const uaddress2 = $("#uaddress2").val();
			const utel = $("#utel").val();
			
			const userzipcode = ${user.uzipcode};
			const useraddress = '${user.uaddress}';
			const useraddress2 = '${address2}';
			const usertel = ${user.utel};
			
			
			var result = true;
			var addresult = false;
			
			if(uzipcode == "" || uaddress == "" || utel == "" ){
				result = false;
				alert("수정할 정보가 없습니다.");
			}
			
			if(useraddress2 != uaddress2){
				
				uaddress = uaddress+ "-" + uaddress2;
<<<<<<< HEAD
			}else{
				result = false;
				alert("변경된 사항이 없습니다.");
			}
			if(userzipcode != uzipcode || useraddress != uaddress || usertel != utel ){
=======
			}
			if(userzipcode != uzipcode || useraddress != uaddress || usertel != utel){
>>>>>>> branch 'master' of https://github.com/kju1018/Spring_TeamProject.git
				
			}else{
				result = false;
				alert("변경된 사항이 없습니다.");
			}
			
			
			if(result){
				$.ajax({
					  url: "updateprocess",
					  data: {uzipcode, uaddress, utel},
					  method: "post"
					}).then(data => {
						if(data.result == "success"){
							alert("수정이 완료되었습니다.");
							window.location.href = "<%=application.getContextPath()%>/mypage/mypageupdate";
						}else{
							alert("수정에 실패하였습니다.");
						}
					});
			}
			
		}
		
		const logout = () => {
			$.ajax({
				url : "<%=application.getContextPath()%>/auth/deleteuser",
				method : "post"
			}).then( data => {
				if(data.result == "success"){
					$.ajax({
						url:"<%=application.getContextPath()%>/logout",
						method:"post"
					}).then(data=>{
						alert("탈퇴 되었습니다.");
						window.location.href = "<%=application.getContextPath()%>";
					})
				}
			});
		}

	
	</script>
    <div class="container-xl" style="margin-top: 18em;" >
    	<div>
         <form onsubmit="updatepage()" method="post"> 
         	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="col" style=" text-align: center;"><h3>회원정보수정</h3></div>
            <div class="col mb-3" style=" text-align: start;"><h3>기본정보</h3></div>
            <div class="container-xl mb-5 border border-secondary"><!-- 전체 영역-->
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2"  >
                        <label class="signup-label" for="uid">아이디</label>
                    </div>
                   <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                 <input type="text" class="signup-input" id="uid" name="uid" value="${user.userid}" readonly>
                            </div>
                            <div class="col-8 align-self-center">
                                <span class="signup-span">(영문소문자/숫자, 4 ~ 16자)</span>
                            </div>
                        </div>
                    </div>
                    
                </div>
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2" >
                        <label class="signup-label" for="upassword">비밀번호 변경</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                              	  <a href="<%=application.getContextPath()%>/auth/upwupdate" class="btn btn-primary btn-md  ">비밀번호 변경</a>
                           		
                            </div>
                        </div>
                    </div>    
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                        <label class="signup-label" for="id">이름</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="text" class="signup-input" id="uname" name="uname" value="${user.uname}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2">주소</div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                            <c:if test="${user.uzipcode != null}">
	  							<input type="text" style="width: 100%;" id="uzipcode" name="uzipcode" value="${user.uzipcode}">
	  						</c:if>
                                
                            </div>
                            <div class="col-2 pl-0">
                                <a onclick="openZipSearch()" class="btn btn-outline-dark btn-sm">우편번호</a>
                            </div>
                        </div>
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <c:if test="${address1 != null}">
	  								<input type="text" style="width: 100%;" id="uaddress" name="uaddress" value="${address1}">
	  							</c:if>
	  							<c:if test="${address1 == null}">
	  								<input type="text" style="width: 100%;" id="uaddress" name="uaddress" >
	  							</c:if>
                            </div>
                            <div class="col-8">
                               <span class="signup-span">기본주소</span>
                            </div>
                        </div>
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                            <c:if test="${address2 != null}">
                                <input type="text" style="width: 100%;"id="uaddress2" name="uaddress2"  value="${address2}">
                             </c:if>  
                              <c:if test="${address2 == null}">
                                <input type="text" style="width: 100%;" id="uaddress2" name="uaddress2" >
                             </c:if>    
                            </div>
                            <div class="col-8">
                               <span class="signup-span">나머지 주소(선택입력가능)</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                    	<label class="signup-label" for="id">전화번호</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center">
                            
                            <div class="col-4" >
                                <input type="text" class="signup-input" id="utel" name="utel" value="${user.utel}">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                        <label class="signup-label" for="id">이메일</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <input type="email" class="signup-input" name="uemail" value="${user.uemail}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	          	<div class="col text-center mt-5">
	               		 <button type="submit" class="btn btn-lg btn-dark">수정완료</button>
	               		 <a href="<%=application.getContextPath()%>/mypage/mypage" class="btn btn-lg btn-outline-dark">취소</a>   
	               		 <a  onclick ="logout()"class="btn btn-lg btn-outline-danger" style="float:right">회원탈퇴</a>         		
	           	</div>
           		
       	  </form> 
       	  	 
       	 </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>