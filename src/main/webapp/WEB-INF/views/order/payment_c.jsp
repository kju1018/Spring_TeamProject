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
            <div class="border-bottom p-5 text-center">
                <img src="<%=application.getContextPath()%>/resources/image/shopping-bag_kms.png" style="width: 50px;">
                <p class="font-weight-bold">고객님의 주문이<br>
                    정상적으로 완료되었습니다.</p>
            </div>
            <div class="row justify-content-center mt-5">
            	<a class="btn btn-dark m-2" href="<%=application.getContextPath()%>">쇼핑계속하기</a>
            	<a class="btn btn-outline-dark m-2" href="<%=application.getContextPath()%>/mypage/ordered_list">주문내역보기</a>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>