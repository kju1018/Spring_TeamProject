<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
 

    <div class="container-xl" style="margin-top: 16em;" >
        <h4 class="font-weight-bold">상품 목록</h4>
        
    </div>

    <div class="container-xl mt-4 border-bottom"><!-- 상품 개수, 필터 영역 -->
        <p id="itemNumber">10 PRODUCT ITEM</p>

        <ul class="filterDiv">
            <li class="filterItem">신상품</li>
            <li class="filterItem">상품명</li>
            <li class="filterItem">낮은가격</li>
            <li class="filterItem">높은가격</li>
            <li class="filterItem">좋아요</li>
            
        </ul>
    </div>
 
 	
    <div class="container-xl p-0 productBox" style="background: yellow;"><!-- 검색 안내문구 영역 -->
        <p class="findResult text-center">
            검색결과가 없습니다.<br>
            정확한 검색어 인지 확인하시고 다시 검색해 주세요.
        </p>
    
    		<c:forEach var="p_list" items="${list}">
        <ul class="list"><!-- 상품 리스트 영역 -->
        <%--  onclick="location.href='<%=application.getContextPath()%>/product/product_view'" --%>
            <li class="product mt-4">
            
	            <a href="<%=application.getContextPath()%>/product/product_view?productno=${p_list.productno}">
	                <div>
	                    <img class="productImg" style="width:100%" src="<%=application.getContextPath()%>/resources/image/productList/productList_1.jpg">
	                </div>
	                <div class="productTitle">
	                    ${p_list.pname}
	                </div>
	                <div class="productContent">
	                    15000원
	                </div>
	            </a>
	          
          </li>
    <!--         onclick="location.href='product/product_view'" -->

        </ul><!-- 상품 리스트 영역 -->
        </c:forEach>
    </div>

    <ul class="pagenav pt-4">
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
        <li class="page-item"><a href="#">PREV</a></li>
        <li class="page-item"><a href="#">1</a></li>
        <li class="page-item"><a href="#">NEXT</a></li>
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
    </ul>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>