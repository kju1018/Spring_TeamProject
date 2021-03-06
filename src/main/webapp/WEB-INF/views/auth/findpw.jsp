<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>


	const findpw = () => {
		event.preventDefault();
		
		const userid = $("#userid").val();
		const uname = $("#uname").val();
		const uemail = $("#uemail").val();
		var result = true;
		
		if(userid === "" || uname === "" || uemail === "" ){
			result = false;
			alert("양식을 채워주세요.");
		}
		
	
		if(result){
			console.log(result);
			$.ajax({
				url : "findpwProcess",
				data : {userid,uname,uemail},
				method: "post"
			})
			.then(data => {
				
				if(data.result == "notnull"){
					window.location.href = "pwupdate";
				}else{
					alert("존재하지 않는 정보 입니다.");
					window.location.href = "find_pw";
				}
			})
		}
		
	}

</script>

<div class="container-lg wrapper_content item_mt-18">
        <div class="row justify-content-center border">
            <div class="col-8">
                <!--제목 부분-->
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="text_center_sort item_mt-2"><h5>비밀번호 찾기</h3></div>
                <!--아이디 라벨과 input 영역-->
                <div class="row item_mt-2 justify-content-center">
                    <!--라벨 : 아이디-->
                    <div class="col-3 align-self-end ">
                        <label for="userid">아이디</label> 
                    </div>
                    <!--input : 아이디-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="userid" name="userid">
                    </div>
                </div>
                <!--이름 라벨과 input 영역-->
                <div class="row item_mt-1 justify-content-center">
                    <!--라벨 : 이름-->
                    <div class="col-3 align-self-end ">
                        <label for="uname">이름</label> 
                    </div>
                     <!--input :이름-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uname" name="uname">
                    </div>
                </div>
                <div class="row item_mt-1 justify-content-center" >
                    <!--라벨 : 이메일-->
                    <div class="col-3  align-self-end">
                        <label for="uemail">이메일로 찾기</label>
                    </div>
                    <!--input :이메일-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uemail"  name="uemail">
                    </div>
                </div>
                <!--확인 버튼 영역-->
                <div class="row item_mt-4 justify-content-center item_mb-3">
                    <button onclick="findpw()" class="btn btn-dark btn-lg item_width_20 btn-block">확인</button>
                </div>
               
                
            </div>
        </div>
    </div>
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>

       	
             