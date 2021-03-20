<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
 
    <title>The Gray</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  	<link href="${pageContext.request.contextPath}/resources/css/thefive.css" rel="stylesheet" type="text/css">
   
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .navul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: white;
        }
        .navli {
            float: left;
            margin-right: 4em;
        }
        .header_a{
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .imgsize {
            width: 200px;
            height: 200px;
        }
        .img-thumbnail {
            width: 150px;
            height: 150px;
        }
        .aft::after {
            content : ">";
        }
    
        header {
        background-color: white;
        
            position : fixed;
            left : 0;
            top :0;
            width: 100%;
            z-index:4;
        }
      
    </style>

</head>
<body>
<header>
	
    <!----header-->
    <div class="columns">
        <div class="row align-items-center" >
            <!----search-->
            <div class="col-3" > 
                <div class="row align-items-center" >
                    
                        <div id="searching" class="col"style="text-align: end; margin: 0 auto; ">
                            <input type="text" style=" text-align: center;">
                            <i class="fa fa-search" aria-hidden="true" onclick="location.href='productList'"></i>
                        </div>
                      
                </div>
            </div>
            <!----search-->
            <!---logo-->
            <div class="col-6"> 
                <div class="row align-items-end text-center">
                    <div class="col align-self-center" >
                        <a href="<%=application.getContextPath()%>"><img  src="${pageContext.request.contextPath}/resources/image/logo.png" alt="" height="130"></a>
                    </div>
                </div>
            </div>
            <!---logo-->
            <!-----auth info-->
            <div class="col-3"> 
                <div class="row align-items-end" style="padding-top: 0.6em;" >
                    <div class="col" >
                        <a href="<%=application.getContextPath()%>/auth/login" style="font-size: xx-small;text-decoration: none; color: black;">SignIn</a>
                    </div>
                    <div class="col"  >
                        <a href="<%=application.getContextPath()%>/auth/signup" style="font-size: xx-small;text-decoration: none; color: black;">SignUp</a>
                    </div>
                    <div class="col"  >
                        <a href="/<%=application.getContextPath()%>/auth/mypage" style="font-size:xx-small;text-decoration: none; color: black;">MyPage</a>
                    </div>
                    <div class="col" >
                        <a href="<%=application.getContextPath()%>/auth/cart"style="font-size:xx-small; text-decoration: none; color: black;">Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <!---auth info-->
        <!-----category text-->
        <div class="col" style=" text-align: center; border-bottom: 1px solid black; height: 3.5em;">
            <ul class="navul" style="display: inline-block;">
                <li class="navli" onclick="location.href ='<%=application.getContextPath()%>/aboutus'"><a class=" header_a" style="text-decoration: none; color: black;">AboutUs</a></li>
                <li class="navli" onclick="location.href ='<%=application.getContextPath()%>/product_list'"><a class=" header_a" style="text-decoration: none; color: black;">인테리어조명</a></li>
                <li class="navli" onclick="location.href ='<%=application.getContextPath()%>/product_list'"><a class=" header_a" style="text-decoration: none; color: black;">디퓨져/캔들</a></li>
                <li class="navli" onclick="location.href ='<%=application.getContextPath()%>/product_list'"><a class=" header_a" style="text-decoration: none; color: black;">액자</a></li>
                <li class="navli" onclick="location.href ='<%=application.getContextPath()%>/product_list"><a class=" header_a" style="text-decoration: none; color: black;">조화/화병</a></li>
                <li class="navli" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'"><a class=" header_a" style="text-decoration: none; color: black;">커뮤니티</a></li>
            </ul>
        </div>
        <!-----category text-->
    </div>
    <!----header-->
</header>