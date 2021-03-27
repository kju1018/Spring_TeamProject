<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="container-xl" style="margin-top: 16em;"> <!-- 전체 -->
        <div><!--주문 완료-->
            <h4 id="payment_c_box">
                주문완료
            </h4>
            <div>
            
            	
            
            
            </div>
            
            <div class="border-bottom p-5 text-center">
                <img src="<%=application.getContextPath()%>/resources/image/shopping-bag_kms.png" style="width: 50px;">
                <p class="font-weight-bold">고객님의 주문이<br>
                    정상적으로 완료되었습니다.</p>
            </div>
            <div class="mt-2">
                <table class="paymenttable">
                    <colgroup>
                        <col style="width: 150px;">
                        <col style="width: auto">
                    </colgroup>
                    <tr>
                        <th class="p-1">주문번호</th>
                        <td class="text-right">20210311-0000017</td>
                    </tr>
                    <tr>
                        <th class="p-1">결제금액</th>
                        <td class="text-right">50,000원</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="container-xl mt-5"><!--주문 상품 정보-->
            <div>
                <h5 class="border-bottom pb-2">주문상품</h5>
            </div>
            <div class="row ml-0 mr-0">
                <a href="#none">
                    <div>
                        <img class="paymentproductImg" src="<%=application.getContextPath()%>/resources/image/productList/productList_1.jpg">
                    </div>
                </a>
                <a href="#none" class="ml-3">
                    <h6>식탁 조명</h6>
                    <p>수량: 1개</p>
                    <p>상품구매금액: 50000원</p>
                </a>
            </div>
        </div>

        <div><!-- 배송지 정보-->
            <div class="mt-3"><!-- 주소정보-->
                <div class="border-bottom pt-2">
                    <h5>배송지</h5>
                </div>
                <div><!-- 배송지 양식 내용-->
                    <div class="border-bottom pb-3">
                        <table class="paymenttable">
                            <colgroup>
                                <col style="width: 15%;">
                                <col style="width: auto">
                            </colgroup>
                            <tr>
                                <th class="p-2">받는사람</th>
                                <td>Team5</td>
                            </tr>

                            <tr>
                                <th class="p-2 align-text-top">주소</th>
                                <td>서울특별시 송파구 중대로 135 아이티벤처타워</td>
                            </tr>
                            <tr>
                                    <th class="p-2">휴대전화</th>
                                    <td>010-1234-1234</td>
                            </tr>
                            <tr>
                                <th class="p-2">배송요청</th>
                                <td>없음</td>
                        </tr>
                        </table>
                    </div>
                </div><!-- 배송지 양식 내용-->
            </div><!-- 주소정보-->
        </div>
        <div class="mt-3"><!--결제 정보-->
            <div><!--결제 수단 정보-->
                <div>
                    <h5 class="border-bottom pb-2 font-weight-bold">결제 수단</h5>
                </div>
                <div>
                    <table class="border-bottom paymenttable">
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: auto">
                        </colgroup>
                        <tr>
                            <td class="p-1">결제수단</td>
                            <td >무통장 입금<br>입금자:테스트<br>
                                계좌번호: 국민은행: 607301-01-303584 김민석</td>
                        </tr>
                        
                    </table>
                </div>
            </div>
            <div><!--가격-->
                <div>
                    <h5 class="border-bottom pb-2 mt-3 font-weight-bold">결제 정보</h5>
                </div>
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
            </div>
        </div>
        <div class="pl-4 pr-4 mt-3 text-center">
            <a href="<%=application.getContextPath()%>" class="btn btn-dark" style="width: 50%;">쇼핑계속하기</a>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>