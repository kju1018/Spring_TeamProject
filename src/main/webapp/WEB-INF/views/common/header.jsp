<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
 
    <title>The Gray</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/css/bootstrap.min.css">
	<script src="<%=application.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link href="<%=application.getContextPath()%>/resources/css/thefive.css" rel="stylesheet" type="text/css">
   

</head>
<script>
	function move_page(movelink) {
		location.href = movelink;
	}
</script>

<script>

   // 생략	

	$(document).on('click', '#productSearch', function(e){
		alert("검색");
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/product/product_list";

		url = url + "?keyword=" + $('#keyword').val();

		location.href = url;

		console.log(url);

	});	

</script>
<body>
<header>
	
    <!----header-->
    <div class="columns">
        <div class="row align-items-center" >
            <!----search-->
            <div class="col-3" > 
                <div class="row align-items-center" >
                    
                        <div id="searching" class="col" style="text-align: end; margin: 0 auto; ">
                        	
                            <input type="text" name="keyword" id="keyword" style=" text-align: center;">
                            <button class="btn btn-sm btn-dark" name="productSearch" id="productSearch">검색</button>
                        	
                        </div>
                      
                </div>
            </div>
            <!----search-->
            <!---logo-->
            <div class="col-6"> 
                <div class="row align-items-end text-center">
                    <div class="col align-self-center" >
                        <a href="<%=application.getContextPath()%>"><img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="" height="130"></a>
                    </div>
                </div>
            </div>
            <!---logo-->
            <!-----auth info-->
            <div class="col-3"> 
                <div class="row align-items-end" style="padding-top: 0.6em;" >
                   
	    			
                <c:if test="${loginUid==null}">
                    <div class="col" >
                        <a href="<%=application.getContextPath()%>/auth/login" style="font-size: xx-small;text-decoration: none; color: black;">SignIn</a>
                    </div>
                    <div class="col"  >
                        <a href="<%=application.getContextPath()%>/auth/signup" style="font-size: xx-small;text-decoration: none; color: black;">SignUp</a>
                    </div>
                </c:if>
                <c:if test="${loginUid!=null}">
               	   <div class="col" >
                	 <a href="<%=application.getContextPath()%>/auth/logout" style="font-size: xx-small;text-decoration: none; color: black;">logout</a>               		
                   </div>
                </c:if>  
            
	    	
                    <div class="col"  >
                        <a href="<%=application.getContextPath()%>/mypage/mypage" style="font-size:xx-small;text-decoration: none; color: black;">MyPage</a>
                    </div>
                    <div class="col" >
                        <a href="<%=application.getContextPath()%>/mypage/cart"style="font-size:xx-small; text-decoration: none; color: black;">Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <!---auth info-->
        <!-----category text-->
        <div class="col" style=" text-align: center; border-bottom: 1px solid black; height: 3.5em;">
            <ul class="navul" style="display: inline-block;">
                <li class="navli pointer" onclick="move_page('<%=application.getContextPath()%>/company/about_us')"><a class=" header_a" style="text-decoration: none; color: black;">AboutUs</a></li>
 				<li class="navli pointer" onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pcategory=1&pcategoryname=인테리어조명')"><a class=" header_a" style="text-decoration: none; color: black;">인테리어조명</a></li>
 			    <li class="navli pointer" onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pcategory=2&pcategoryname=디퓨저/캔들')"><a class=" header_a" style="text-decoration: none; color: black;">디퓨저/캔들</a></li>
                <li class="navli pointer" onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pcategory=3&pcategoryname=액자')"><a class=" header_a" style="text-decoration: none; color: black;">액자</a></li>
                <li class="navli pointer" onclick="move_page('<%=application.getContextPath()%>/product/product_list_user?pcategory=4&pcategoryname=조화/화병')"><a class=" header_a" style="text-decoration: none; color: black;">조화/화병</a></li>
                <li class="navli pointer" onclick="move_page('<%=application.getContextPath()%>/community/notice_list')"><a class=" header_a" style="text-decoration: none; color: black;">커뮤니티</a></li>
            </ul>
        </div>
        <!-----category text-->
    </div>
    <!----header-->
</header>