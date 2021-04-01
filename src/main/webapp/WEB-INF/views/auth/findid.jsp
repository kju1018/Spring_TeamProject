<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>

		$(function () {
		    var token = $("input[name='_csrf']").val();
		    var header = "X-CSRF-TOKEN";
		    $(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		});
	const findId = () => {
		
		const uname = $("#uname").val();
		const uemail = $("#uemail").val();
		var result = true;
		console.log(uname);
		console.log(uemail);
		if(uname === "" || uemail === ""){
			result = false;
			alert("양식을 채워주세요.");
		}
		
		if(result){
		
			$.ajax({
				url : "findIdProcess",
				data : {uemail,uname},
				method: "post"
			})
			.then(data => {
				alert("당신의 아이디는 "+data.result+" 입니다.");
				window.location.href = "login";
			})
		}
		
	}

</script>
    
  <div class="container-lg wrapper_content item_mt-18">
        <div class="row justify-content-center border"  >
            <div class="col-8">
            	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <!--제목 부분-->
                <div class="text_center_sort item_mt-2"><h5>아이디 찾기</h3></div>
                    
                <div class="row item_mt-2 justify-content-center">
                    <!--label : 이름-->
                    <div class="col-3 align-self-end ">
                        <label for="uname">이름</label> 
                    </div>
                    <!--input : 이름-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uname" name="uname">
                    </div>
                </div>
                <div class="row item_mt-1 justify-content-center" >
                    <!--label : email-->
                    <div class="col-3  align-self-end">
                        <label for="uemail">이메일로 찾기</label>
                    </div>
                    <!--input : email-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uemail"  name="uemail">
                    </div>
                </div>
                <!--버튼-->
                <div class="row item_mt-4 justify-content-center item_mb-3">
                    <button onclick="findId()" class="btn btn-dark btn-lg item_width_20 btn-block">확인</button>
                </div>
               
                
            </div>
        </div>
    </div>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
       	
             