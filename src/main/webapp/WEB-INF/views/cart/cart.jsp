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
		var cartArr = new Array();
		$("input[name=chk_productno]:checked").each(function() {
				var test = $(this).val(); 
				cartArr.push(test);
		});
		
		if(cartArr.length == 0){
			alert("선택된 상품이 없습니다.")
		} else {
			if(confirm("선택된 상품들을 삭제하시겠습니다?") == true){
				$.ajax({
						url: "delete_cart_selected",
						data: {cartArr},
						method: "get"
				}).then(data => {
					if(data.result=="success"){
						getList();
					}
				});   
			} else{
				return ;
			}			
		}
	   
	};
	
	const updatecartquantity = (productno) => {
		const cartquantity = document.getElementById('cartquantity'+productno).value;
		$.ajax({
				url: "update_quantity",
				data: {productno, cartquantity},
				method: "get"
		}).then(data => {
			if(data.result=="success"){
				alert("변경이 완료되었습니다");
				getList();
			}
		});   
		   
	};
	const deleteAll = (cartlistlength) => {
		if(cartlistlength===0){
			alert("장바구니가 비어있습니다.");
		} else {
			if(confirm("장바구니를 비우시겠습니까?") == true){
				$.ajax({
					url: "delete_allcart",
					method: "get"
				}).then(data => {
					if(data.result=="success"){
						alert("모두 삭제되었습니다.");
						getList();
					}
				});
		    } else{
		        return ;
		    }
		} 
		   
	};

	function checkCart() {
		event.preventDefault();
		var cartArr = new Array();
		var quantity="";
		$("input[name=chk_productno]:checked").each(function() {
				var box_productno = $(this).val(); 
				cartArr.push(box_productno);
				var temp = $("#cartquantity"+box_productno).val();
				/* 선택한 productno를 이용하여 cartquantity id를 찾음  */
				quantity += temp+" ";
		});
		
		if(cartArr.length == 0){
			alert("선택된 상품이 없습니다.")
		} else {
			var cart_form = document.querySelector("#cart_form");
		    $('#quantity').val(quantity);
		    cart_form.submit();
		} 
		
	}
	
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

								
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>