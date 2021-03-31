<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">

	$(function(){
	    getList();
	 });
	 
	 const getList = () => {
	 	
	 	$.ajax({
	 		url:"cartlist",
		    method: "get"
	 }).then(data => {
	 	  	$("#board").html(data);
	 	 });
	 };
	 
	 
	 const cartdelete = () => {
		 
		 if(confirm("장바구니를 비우시겠습니까?") == true){
			var cartArr = new Array();
			$("input[name=chk_box]:checked").each(function() {
					var test = $(this).val(); 
					cartArr.push(test);
			});
					
			$.ajax({
				    url: "delete_cart_selected",
				    data: {cartArr},
				    method: "get"
			 }).then(data => {
				  if(data.result=="success"){
					  console.log("성공");
					  getList();
				  }
		     });   
		   } else{
		        return ;
		    }
			   
	    };
		 
		
	 
	const updatecartquantity = (productno) => {
		  const cartquantity = document.getElementById('cartquantity'+productno).value;
		  location.href ="<%=application.getContextPath()%>/cart/update_quantity?cartquantity="+cartquantity+"&productno="+productno;
		};
		
	const cartorder = (productno) => {
		location.href ="<%=application.getContextPath()%>/order/order_form?productno="+productno;
	}

		
	const deleteAll = (cartlistlength) => {
			if(cartlistlength===0){
				alert("장바구니가 비어있습니다.");
			}else {
				if(confirm("장바구니를 비우시겠습니까?") == true){
					 location.href ="<%=application.getContextPath()%>/cart/delete_allcart";
			    } else{
			        return ;
			    }
			}	
	};
	
/* 	const test = () => {
		const query = 'input[name="chk_box"]:checked';
		  const selected = 
		      document.querySelectorAll(query);
		 
		  alert(typeof selected[0].value);
	} */
	
	
	/* const test = () => {
		var cartArr = new Array();
		$("input[name=chk_box]:checked").each(function() {
			  var test = $(this).val(); 
			  alert();
			  cartArr.push(test);
		});
		console.log(cartArr);
		
	}; 

 */
	
	
</script>


<!-- 전체 컨텐츠 영역 -->
<div class='container' style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">장바구니</li>
    </ol>
    <br/>
	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">
    <!--제목-->
	<p class='titleyj'>장바구니</p>
	
	<div class="my_button">
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage_update'">
		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/like_list'">
		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<div id="board">
		
	
	
   </div>
   
	<!--게시판-->
	<hr/>

	<div class="c-middle">
		<input type="button" class="btn btn-dark btn-sm" onclick="cartdelete()" value="선택상품삭제"/>
		<input type="button" class="btn btn-dark btn-sm" onclick="deleteAll(${cartList.size()})" value="상품전체 삭제"/>
	</div>	

	<!-- 페이지 -->
<%-- 	<ul class="pagenav" style="margin-top: 40px;">
		<li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
		<li class="page-item"><a href="#">PREV</a></li>
		<li class="page-item"><a href="#">1</a></li>
		<li class="page-item"><a href="#">NEXT</a></li>
		<li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
	</ul>
	<br/> --%>
	
	<div class="c_bottom">
		<a type="button" class="btn btn-dark" >상품전체주문</a>
		<input  type="button" class="btn btn-dark" value="쇼핑계속하기" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
								
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>