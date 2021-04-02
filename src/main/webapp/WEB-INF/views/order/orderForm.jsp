<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	const newAddress = () => {
		$("#oreceiver").val("");
		$("#oreceiver").removeAttr("readonly");
		
		$("#ozipcode").val("");
		
		$("#oaddress").val("");
		$("#oaddress").removeAttr("readonly");
		
		$("#subaddress").attr("placeholder", "나머지 주소")
		$("#subaddress").removeAttr("readonly");

		$("#onumber").val("");
		$("#onumber").removeAttr("readonly");
	}
	
	const userAddress = () => {

		$("#oreceiver").val("<c:out value='${user.uname}'/>");
		$("#oreceiver").attr("readonly",true);
		
		$("#ozipcode").val("<c:out value='${user.uzipcode}'/>");
		
		$("#oaddress").val("<c:out value='${user.uaddress}'/>");
		$("#oaddress").attr("readonly",true);
		
		$("#subaddress").attr("placeholder", "")
		$("#subaddress").attr("readonly",true);

		$("#onumber").val("<c:out value='${user.utel}'/>");
		$("#onumber").attr("readonly",true);
	}

</script>

    <div class="container-xl" style="margin-top: 16em;">
        <h4 class="font-weight-bold border-bottom pb-2">결제하기</h4>
    </div>
    <div class="container-xl mt-3"><!--결재하기 전체 div-->
    	        <!--form 전체 -->
    	<form id=" paymentForm" method="post" action="<%=application.getContextPath()%>/order/create_order">
    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	        <div><!--주문상품 div-->
	            <div>
	                <h5 class="border-bottom pb-2">주문상품</h5>
	            </div>
	            <c:forEach var="product" items="${list}" varStatus="status">
		            <div class="row ml-0 mr-0 mt-3">
		                <a href="#none">
		                    <div>
		                        <img class="paymentproductImg" src="<%=application.getContextPath()%>/resources/image/productList/productList_1.jpg">
		                    </div>
		                </a>
		                <a href="#none" class="ml-3">
		                    <h5>상품명: ${product.pname}</h5>
		                    <p>수량: ${quantityArr[status.index]}</p>
		                    <p>상품구매금액: ${product.pprice*quantityArr[status.index]}</p>
		                </a>
		            </div>
		            <input type="hidden" name="order_productno" value="${product.productno}"/>
	           		<input type="hidden" name="order_quantity" value="${quantityArr[status.index]}"/>
		        </c:forEach>
	        </div><!--주문상품 div-->
           	<c:forEach var="product" items="${list}" varStatus="status">
	          
	        </c:forEach>
            <div><!-- form안에 div 전체 틀 content-->
                <div class="border mt-3"><!-- 주소정보-->
                    <div class="border-bottom pl-2 pt-2">
                        <h5>배송지</h5>
                    </div>
                    <div><!-- 배송지 양식 내용-->
                        <div class="p-2">
                            <input type="radio" name="select_address" onclick="userAddress()" checked>주문자 정보와 동일
                            <input type="radio" name="select_address" onclick="newAddress()" class="ml-2">새로운 배송지
                        </div>
                        <div class="border-bottom pb-3"><!--입력하는곳-->
                            <table class="paymenttable">
                                <colgroup>
                                    <col style="width: 15%;">
                                    <col style="width: auto">
                                </colgroup>
                                <tr>
                                    <th class="p-2">받는사람</th>
                                    <td><input type="text" class="paymentinput" id="oreceiver" name="oreceiver" value="${user.uname}"></td>
                                </tr>

                                <tr>
                                    <th class="p-2 align-text-top">주소</th>
                                    <td>
                                        <!-- readOnly -->
                                        <input type="text" class="paymentinput2" placeholder="우편번호" id="ozipcode" name="ozipcode" value="${user.uzipcode}" readonly>
                                        <a href="#none" class="btn btn-dark btn-sm ml-2 mb-1">주소검색</a><br>
                                        <input type="text" class="paymentinput" placeholder="기본주소" id="oaddress" name="oaddress" value="${user.uaddress}" readonly> <br>
                                        <input type="text" class="paymentinput" id="subaddress" name="oaddress" readonly>
                                    </td>
                                </tr>
                                <tr>
                                        <th class="p-2">휴대전화</th>
                                        <td> 
                                            <input class="paymentinput2" type="text" id="onumber" name="onumber" value="${user.utel}" readonly>
                                        </td>
                                </tr>
                            </table>
                        </div><!--입력하는곳-->
                        <div class="p-4"><!-- 메시지-->
                            <select class="paymentSelect item_width_100" name="omessage">
                                <option value="selectNo">--메시지 선택(선택사항)--</option>
                                <option value="배송전에 미리 연락바랍니다.">배송전에 미리 연락바랍니다.</option>
                                <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                                <option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
                                <option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
                            </select>                            
                        </div><!-- 메시지-->
                    </div><!-- 배송지 양식 내용-->
                </div><!-- 주소정보-->
                <div class="mt-3"><!--결제 정보-->
                    <div>
                        <h5 class="border-bottom pb-2">결제 정보</h5>
                    </div>
                    <div class="pl-4 pr-4"><!--가격-->
                        <table class="paymenttable">
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: auto">
                            </colgroup>
                            <tr>
                                <th class="p-1">주문상품</th>
                                <td class="text-right">50000원</td>
                            </tr>
                            <tr>
                                <th class="p-1">배송비</th>
                                <td class="text-right">0원</td>
                            </tr>
                        </table>
                        <div class="mt-2 p-2" style="background-color: #dee2e6;">
                            <h5 style="display: inline-block;">결제 금액</h5>
                            <h5 style="float: right;">50,000원</h5>
                        </div>

                        <h5 class="mt-2">결제수단</h5>
                        <div class="border border-dark">
                            <div class="p-3" style="background-color: #dee2e6;">
                                <h6 class="font-weight-bold mb-0">결제수단 선택</h6>
                            </div>
                            <div class="p-3">
                            	<div class="form-group">
                                	<input type="radio" name="omethod" value="무통장 입금" checked> 무통장 입금
                                </div>
                            </div>
                        </div>
                        <div>
                            <table class="paymenttable">
                                <colgroup>
                                    <col style="width: 110px;">
                                    <col style="width: auto">
                                </colgroup>
                                <tr>
                                    <th class="p-2">입금은행</th>
                                    <td>
                                         국민은행: 607301-01-303584 김민석
                                    </td>
                                </tr>

                                <tr>
                                    <th class="p-2">입금자명</th>
                                    <td><input type="text" class="item_width_100" name="odepositor"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="pl-4 pr-4"><!--약관 동의-->
                    <table class="paymenttable">
                        <colgroup>
                            <col style="width: 50px;">
                            <col style="width: auto">
                        </colgroup>
                        <tr class="border-bottom">
                            <th class="p-2"><input type="checkbox"></th>
                            <th>
                                모든 약관 동의
                            </th>
                        </tr>

                        <tr class="border-bottom">
                            <th class="p-2"><input type="checkbox"></th>
                            <td>
                                [필수] 구매조건 확인 및 결제진행 동의
                            </td>
                        </tr>

                        <tr>
                            <th class="p-2"><input type="checkbox"></th>
                            <td>
                                [필수] 쇼핑몰 이용약관 동의
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="pl-4 pr-4 mt-3">
                    <button type="submit" class="btn btn-dark item_width_100">50,000원 결제하기</button>
                </div>
            </div><!-- form안에 div 전체 틀 content-->
        </form>

    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>