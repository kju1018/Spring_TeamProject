<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			if(confirm("선택된 상품들을 삭제하시겠습까?") == true){
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
		const cartquantity = $("#cartquantity"+productno).val();
		$.ajax({
				url: "update_quantity",
				data: {productno, cartquantity},
				method: "get"
		}).then(data => {
			if(data.result=="success"){
				alert("변경이 완료되었습니다");
				getList();
			} else if(data.result=="failure"){
				alert("1개이상 설정해주세요.");
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
		
	};

	//모든 물품들의 체크박스가 체크 되어있으면 전체체크박스 체크
	//하나라도 체크가 안되어있으면 전체체크박스 체크 해제
	//체크되어있는 물품들의 가격 계산
	const check = (cartlistlength) => {
		const query = $("input[name=chk_productno]:checked");
		if(query.length==cartlistlength){
			$("input:checkbox[id='checkbox_All']").prop("checked", true);
		} else{
			$("input:checkbox[id='checkbox_All']").prop("checked", false);
		}
		var totalprice = 0;
		query.each(function() {
			var box_productno = $(this).val(); 
			var price = $("#productprice"+box_productno).text();

			totalprice += parseInt(price);
		});
		 $("#totalprice").text(totalprice);
		 
		 var fee = $("#fee").text()
		 totalprice += parseInt(fee);
		 $("#totalprice2").text(totalprice);
	};
	
	//전체 체크박스 
	const checkAll = () => {
		 if ($("#checkbox_All").is(':checked')) {
             $("input[type=checkbox]").prop("checked", true);
             const query = $("input[name=chk_productno]:checked");
             var totalprice = 0;
             query.each(function() {
     			var box_productno = $(this).val(); 
     			var price = $("#productprice"+box_productno).text();

     			totalprice += parseInt(price);
     		});
             $("#totalprice").text(totalprice);
             $("#totalprice2").text(totalprice);
         } else {
             $("input[type=checkbox]").prop("checked", false);
             $("#totalprice").text(0);
             $("#totalprice2").text(0);
         }
	};
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
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypageupdate'">

		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/likes/likelist?pageNo=1'">

		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<div id="board">
		
	
	
   </div>

								
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>