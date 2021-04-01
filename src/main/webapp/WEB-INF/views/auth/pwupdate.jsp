<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	const updatepw = () => {
		
		const upassword = $("#upassword").val();
		const urepassword = $("#urepassword").val();
		
		var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/;
		var result = true;
		console.log(upassword);
		console.log(urepassword);
		if(upassword === "" || urepassword === ""){
			result = false;
			alert("양식을 채워주세요.");
		}
		
		if(upassword !== urepassword){
			result = false;
			alert("비밀번호가 일치하지 않습니다.");
		}
		
		if(!passwordRegExp.test(upassword) || !passwordRegExp.test(urepassword) ){
			result = false;
			alert("영문대소문자/특수문자 중 2가지 이상 조합, 10 ~ 16자 양식에 맞춰 입력해주세요");
		}
		
		if(result){
		
			$.ajax({
				url : "updatepw",
				data : {upassword},
				method: "post"
			})
			.then(data => {
				
				if(data.updateresult == "update"){
					window.location.href = "login";
				}else if(data.updateresult == "loginUid"){
					window.location.href="<%=application.getContextPath()%>/mypage/mypage";
				} 
				else{
					window.location.href = "find_pw";
					alert("변경에 실패했습니다.");
				} 
			})
		}
		
	}

</script>
    
  <div class="container-lg wrapper_content item_mt-18">
        <div class="row justify-content-center border"  >
            <div class="col-8">
            
                <!--제목 부분-->
                <div class="text_center_sort item_mt-2"><h5>비밀번호 변경</h3></div>
                    
                <div class="row item_mt-2 justify-content-center">
                    <!--label : 이름-->
                    <div class="col-3 align-self-end ">
                        <label for="uname">비밀번호</label> 
                    </div>
                    <!--input : 이름-->
                    <div class="col-6">
                        <input type="password" class="form-control" id="upassword" name="upassword">
                    </div>
                </div>
                <div class="row item_mt-1 justify-content-center" >
                    <!--label : email-->
                    <div class="col-3  align-self-end">
                        <label for="uemail">비밀번호 확인</label>
                    </div>
                    <!--input : email-->
                    <div class="col-6">
                        <input type="password" class="form-control" id="urepassword"  name="urepassword">
                    </div>
                </div>
                <!--버튼-->
                <div class="row item_mt-4 justify-content-center item_mb-3">
                    <button onclick="updatepw()" class="btn btn-dark btn-lg item_width_20 btn-block">확인</button>
                </div>
               
                
            </div>
        </div>
    </div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
       	
             