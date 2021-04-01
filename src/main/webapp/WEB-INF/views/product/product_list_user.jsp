<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 <script>
 const newitem = () => {

 };
 
 const productname = () => {
	 alert("test");
 };
 
 const lowprice = () => {
	 alert("test");
 };
 
 const highprice = () => {
	 alert("test");
 };
 
 const like = () => {
	 alert("test");
 };
 
 
 </script>
		
    <div class="container-xl" style="margin-top: 16em;" >
        <h4 class="font-weight-bold">${pcategoryname}</h4>
        
    </div>

    <div class="container-xl mt-4 border-bottom"><!-- 상품 개수, 필터 영역 -->
        <p id="itemNumber">${pager.totalRows} PRODUCT ITEM</p>
		
		<%-- <c:forEach var="" items="">
		</c:forEach>
     --%>    <ul class="filterDiv">
            <li class="filterItem" id="newitem" onclick="newitem()">신상품</li>
            <li class="filterItem" id="productname" onclick="productname()">상품명</li>
            <li class="filterItem" id="lowprice" onclick="lowprice()">낮은가격</li>
            <li class="filterItem" id="highprice" onclick="highprice()">높은가격</li>
            <li class="filterItem" id="like" onclick="like()">좋아요</li>
            
        </ul>
    </div>
 		
 	
    <div class="container-xl p-0 productBox" ><!-- 검색 안내문구 영역 -->
        <p class="findResult text-center">
            검색결과가 없습니다.<br>
            정확한 검색어 인지 확인하시고 다시 검색해 주세요.
        </p>
    
    		<c:forEach var="p_list" items="${list}">
        <ul class="list"><!-- 상품 리스트 영역 -->
        <%--  onclick="location.href='<%=application.getContextPath()%>/product/product_view'" --%>
            <li class="product mt-4">
            
	            <a href="<%=application.getContextPath()%>/product/product_view_user?productno=${p_list.productno}" id="product_no">
	                <div>
	                    <img class="productImg" style="width:100%" src="<%=application.getContextPath()%>/resources/image/productList/productList_1.jpg" id="product_img">
	                </div>
	                <div class="productTitle" id="product_name">
	                    ${p_list.pname}
	                </div>
	                <div class="productContent" id="product_price">
	                    ${p_list.pprice} 원
	                </div>
	            </a>
	          
          </li>
    <!--         onclick="location.href='product/product_view'" -->

        </ul><!-- 상품 리스트 영역 -->
        </c:forEach>
    </div>
    
	<div class="container-xl d-flex justify-content-center" >
		<div class="row">
		<table>
	    <tr>
				<td colspan="5" class="text-center">
				<div class="d-flex">
						<!-- [처음] [이전] 1 2 3 4 5 [다음][맨끝] -->
					<div class="flex-grow-1">
							<a class="btn btn-outline-secondary btn-sm" 
							href="product_list_user?pageNo=1&pcategory=${pcategory}&pcategoryname=${pcategoryname}">[처음]</a>
							
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-secondary btn-sm" 
								href="product_list_user?pageNo=${pager.startPageNo-1}&pcategory=${pcategory}&pcategoryname=${pcategoryname}">이전</a>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo!=i}">
									<a class="btn btn-outline-secondary btn-sm" 
									href="product_list_user?pageNo=${i}&pcategory=${pcategory}&pcategoryname=${pcategoryname}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo==i}">
									<a class="btn btn-danger btn-sm" 
										href="product_list_user?pageNo=${i}&pcategory=${pcategory}&pcategoryname=${pcategoryname}">${i}</a>
								</c:if>	
							</c:forEach>
							
			
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-secondary btn-sm" 
								href="product_list_user?pageNo=${pager.endPageNo+1}&pcategory=${pcategory}&pcategoryname=${pcategoryname}">다음</a>
							</c:if>
							
							<a class="btn btn-outline-secondary btn-sm" 
							href="product_list_user?pageNo=${pager.totalPageNo}&pcategory=${pcategory}&pcategoryname=${pcategoryname}">[맨끝]</a>
						</div>	
	
					</div> 
				</td>
			</tr>
		</table>
		</div>
		</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>