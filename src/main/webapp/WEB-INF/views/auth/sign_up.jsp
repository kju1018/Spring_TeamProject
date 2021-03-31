<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	// 모든약관동의를 누르면 아래의 동의까지 같이 적용
	const check = () => {
		const allcheck = document.getElementById("allcheck");
		const buycheck = document.getElementById("buycheck");
		const shopcheck = document.getElementById("shopcheck");
		
		if(allcheck.checked){
			buycheck.checked = true;
			shopcheck.checked = true;
		}else if(!allcheck.checked){
			buycheck.checked = false;
			shopcheck.checked = false;
		}
	}
	

	/// 양력체크시 음력은 체크 못함
	const datecheck1 = () => {
		const udate1 = document.getElementById("udate1");
		const udate2 = document.getElementById("udate2");
		if(udate1.checked){
			udate2.checked = false;
		}
	}
	//음력체크시 양력 체크 못함
	const datecheck2 = () => {
		const udate1 = document.getElementById("udate1");
		const udate2 = document.getElementById("udate2");
		if(udate2.checked){
			udate1.checked = false;
		}
	}
	
	



 	/// 회원가입 폼 유효성검사
	const userSignup = () =>{
		event.preventDefault();
		
		const buycheck = document.getElementById("buycheck");
		const shopcheck = document.getElementById("shopcheck");
		
		const udate1 = document.getElementById("udate1");
		const udate2 = document.getElementById("udate2");
		
		var result = true;
		
		<%--아이디 유효성 검사--%>
		var idRegExp = /^[a-zA-z0-9]{4,12}$/; 
		const userid = $("#userid").val();
		if(!idRegExp.test(userid)){
			result = false;
		  $("#errorUid").html("형식에 맞지 않습니다.");
		}else{
		  
		   $("#errorUid").html("");
		}
		
		<%-- 비밀번호 유효성 검사--%>
		var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/;
		const upassword = $("#upassword").val();
		const urepassword = $("#urepassword").val();
		
		if(upassword !== urepassword){
			result = false;
			$("#errorUpass").html("비밀번호가 일치하지 않습니다.");
			$("#errorUrepass").html("비밀번호가 일치하지 않습니다.");
		}else if(!passwordRegExp.test(upassword)){
			result = false;
			$("#errorUpass").html("형식에 맞지 않습니다.");
		}else if(!passwordRegExp.test(urepassword)){
			result = false;
			$("#errorUrepass").html("형식에 맞지 않습니다.");
		}else if(passwordRegExp.test(upassword) && upassword === urepassword){
			$("#errorUrepass").html("");
			$("#errorUpass").html("");
		}
		
		<%-- 이름 검사 --%>
		const uname = $("#uname").val();
		if(uname === ""){
			result = false;
			$("#errorUname").html("형식에 맞지 않습니다.");
		}else{
			$("#errorUname").html("");
		}
		
		<%-- 우편번호 검사 --%>
		const uzipcode = $("#uzipcode").val();
		if(uzipcode === ""){
			result = false;
			$("#errorUzipcode").html("필수사항 입니다.");
		}else{
			$("#errorUzipcode").html("");
		}
		
		<%-- 주소 --%>
		var uaddress = $("#uaddress").val();
		const udetailaddress = $("#udetailaddress").val();
		if(uaddress === ""){
			result = false;
			$("#errorUaddress").html("필수사항 입니다.");
		}else{
			
			if(udetailaddress !== ""){
				uaddress = uaddress + udetailaddress;
			}else{
				uaddress = uaddress;
			}
			$("#errorUaddress").html("");
		}
		
		
		<%-- 핸드폰주소 --%>
		const unumber1 = $("#unumber1").val();
		const unumber2 = $("#unumber2").val();
		const unumber3 = $("#unumber3").val();
		const utel = unumber1+"-"+unumber2+"-"+unumber3;
		
		console.log(utel);
		if(unumber2 === "" || unumber3 === "" ){
			result = false;
			$("#errorUnumber").html("필수사항 입니다.");
		}else if(unumber2 !== "" && unumber3 !== "" ){
			
			$("#errorUnumber").html("");
		}
		
		<%-- 이메일 --%>
		var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		const uemail=$("#uemail").val();
		if(!emailRegExp.test(uemail)){
			result = false;
			$("#errorUemail").html("형식에 맞지 않습니다.");
		}else{
		
			$("#errorUemail").html("");
		}
		
	
		<%-- 생년월일 --%>
		const udate = $("#udate").val();
	
		const ubirth = new Date(udate);
	
		
		if(udate === ""){
			result = false;
			$("#errorUdate").html("필수사항 입니다.");
		}else {
		
			$("#errorUdate").html("");
		}
		<%-- 양력음력 체크 --%>
		if(!udate1.checked && !udate2.checked){
			result=false;
			$("#errorUdatecheck").html("필수사항 입니다.");
		}else{
			$("#errorUdatecheck").html("");
		}
		<%-- 이용약관 --%>
		if(!buycheck.checked && !shopcheck.checked){
			result=false;
			$("#errorUcheck").html("필수사항 입니다.");
		}else{
			$("#errorUcheck").html("");
		}
		
		
		if(result){
			console.log("회원가입 완료");
			$.ajax({
				  url: "signupprocess",
				  data: {userid, upassword, uname, uzipcode, uaddress, uemail, utel, ubirth},
				  method: "post"
				}).then(data => {
					if(data.result == "success"){
						window.location.href = "login";
					}else if(data.result == "wrongUid"){
						$("#errorUid").html("존재하는 아이디 입니다.");
					}else if(data.result == "existemail"){
						$("#errorUemail").html("존재하는 이메일 입니다.");
					}else {
						$("#errorUid").html("존재하는 아이디 입니다.");
						$("#errorUemail").html("존재하는 이메일 입니다.");
					}
				});
		}
		
	}		
</script>


    <div class="container-xl" style="margin-top: 18em;" >
        <form id="signupForm" name="signupForm" method="post" onsubmit="userSignup()" novalidate>
            <div class="col" style=" text-align: center;"><h3>회원가입</h3></div>
            <div class="col mb-3" style=" text-align: start;"><h3>기본정보</h3></div>
            
            <div class="container-xl mb-5 border border-secondary"><!-- 전체 영역-->
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2">
                        <label class="signup-label" for="uid">아이디</label>
                       
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="text" class="signup-input" id="userid" name="userid">
                            </div>
                            <div class="col-8 align-self-center">
                           	    <span id="errorUid" class="text-danger error fontsize-sm"></span>
                                <span class="signup-span">(영문소문자/숫자, 4 ~ 16자)</span>
                            </div>
                        </div>
                    </div>
                    
                </div>
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2">
                        <label class="signup-label" for="upassword">비밀번호</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="password" class="signup-input" id="upassword" name="upassword">
                            </div>
                            <div class="col-8 align-self-center">
                            	<span id="errorUpass" class="text-danger error fontsize-sm"></span>
                                <span class="signup-span">(영문대소문자/특수문자 중 2가지 이상 조합, 10 ~ 16자)</span>
                            </div>
                        </div>
                    </div>    
                </div>
                
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2">
                        <label class="signup-label" for="urepassword">비밀번호 확인</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="password" class="signup-input" id="urepassword" name="urepassword">
                            </div>
                            <div class="col-8 align-self-center">
                            	<span id="errorUrepass" class="text-danger error fontsize-sm"></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2">
                        <label class="signup-label" for="id">이름</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="text" class="signup-input" id="uname" name="uname">
                            </div>
                            <div class="col-8 align-self-center">
                            	<span id="errorUname" class="text-danger error fontsize-sm"></span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2">주소</div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <input type="text" style="width: 100%;" id="uzipcode" name="uzipcode">
                            </div>
                            <div class="col-3 pl-0">
                                <a href="#" class="btn btn-outline-dark btn-sm">우편번호</a>
                                <span id="errorUzipcode" class="text-danger error fontsize-sm"></span>
                            </div>
                        </div>
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <input type="text" style="width: 100%;" id="uaddress" name="uaddress">
                            </div>
                            <div class="col-8">
                               <span id="errorUaddress" class="text-danger error fontsize-sm"></span>
                               <span class="signup-span">기본주소</span>
                            </div>
                        </div>
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <input type="text" style="width: 100%;" id="udetailaddress" name="udetailaddress">
                            </div>
                            <div class="col-8">
                               <span class="signup-span">나머지 주소(선택입력가능)</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                    	<label class="signup-label">전화번호</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center">
                            <div class="col-2">
                                <select id="unumber1" class="signup-input" name="unumber1">
                                    <option selected value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="02">02</option>
                                </select>
                            </div>
                            <span class="ml-1">-</span>
                            <div class="col-2">
                                <input type="text" class="signup-input" id="unumber2" name="unumber2">
                            </div>
                            <span class="ml-1">-</span>
                            <div class="col-2" >
                                <input type="text" class="signup-input" id="unumber3" name="unumber3">
                            </div>
                            <span id="errorUnumber" class="text-danger error fontsize-sm ml-1"></span>
                        </div>
                    </div>
                </div>
                
               	<div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                        <label class="signup-label" for="uemail">이메일</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <input type="email" class="signup-input" id="uemail" name="uemail">
                                 <span id="errorUemail" class="text-danger error fontsize-sm ml-1"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row align-items-center">
                    <div class="col-2" >
                    	<label class="signup-label" for="udate">생년월일</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center" style="margin-top: 0.2em;">
                            <div class="col-2">
                                <input type="date" class="signup-input" id="udate" name="udate">
                            </div>

                            <div class="col-6">
                                <div class="row ">
                                    <div class="col" >
                                   
                                        <div class="row align-items-center">
                                            <span id="errorUdate" class="text-danger error fontsize-sm"></span>
                                            <div class="form-check form-check-inline ml-4">
                                                <input class="form-check-input" onclick="datecheck1()" type="checkbox" name="udate1" id="udate1" value="udate1">
                                                <label class="form-check-label" for="inlineCheckbox1">양력</label>
                                               
                                              </div>
                                              <div class="form-check form-check-inline">
                                                <input class="form-check-input" onclick="datecheck2()" type="checkbox" name="udate2" id="udate2" value="udate2">
                                                <label class="form-check-label" for="inlineCheckbox2">음력</label>
                                              </div>
                                              <div>
                                                    <span id="errorUdatecheck" class="text-danger error fontsize-sm "></span>
                                              </div>
                                        </div>
                                    </div>
                                  
                                </div>
                                
                            </div>
                         
                        </div>
                    </div>
                </div>
            </div>
            <div class="col" style=" text-align: start;">
           		 <h3>전체동의</h3>
           		
           	</div>
           	 <div class="col">
           			 <span id="errorUcheck" class="text-danger error fontsize-sm "></span>
           	</div>
           
            <div class="border pl-4 pr-4"><!--약관 동의-->
                <table style="width: 100%;">
                    <colgroup>
                        <col style="width: 50px;">
                        <col style="width: auto">
                    </colgroup>
                    <tr class="border-bottom">
                        <th class="p-2"><input type="checkbox" onclick="check()" id="allcheck" name="allcheck"></th>
                        <th>
                            모든 약관 동의
                        </th>
                    </tr>

                    <tr class="border-bottom">
                        <th class="p-2"><input type="checkbox" id="buycheck" name="buycheck"></th>
                        <td>
                            [필수] 구매조건 확인 및 결제진행 동의
                        </td>
                    </tr>

                    <tr>
                        <th class="p-2"><input type="checkbox" id="shopcheck" name="shopcheck"></th>
                        <td>
                            [필수] 쇼핑몰 이용약관 동의
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col text-center mt-5">
           
            	<button type="submit" class="btn btn-lg btn-dark">회원가입</button>  
            </div>
        </form>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>