<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 <script>
window.onload = function (){
   if(${sort}==5 || ${sort}==6 || ${sort}==7){
      document.getElementById('newitem').style.display="none";
      document.getElementById('productname').style.display="none";
      document.getElementById('lowprice').style.display="none";
      document.getElementById('highprice').style.display="none";
     
   }
   
}
 
 </script>
      
    <div class="container-xl" style="margin-top: 16em;" >
        <h4 class="font-weight-bold">${pcategoryname}</h4>
        
    </div>

      
    <div class="container-xl mt-4 border-bottom" id="sort_item" name="sort_item"><!-- 상품 개수, 필터 영역 -->
        <p id="itemNumber">${pager_pl.totalRows} PRODUCT ITEM</p>
   
         <div class="filterDiv">
            <a class="filterItem" id="newitem" href="<%=application.getContextPath()%>/product/product_list_user?pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=1">신상품</a>
            <a class="filterItem" id="productname" href="<%=application.getContextPath()%>/product/product_list_user?pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=2">상품명</a>
            <a class="filterItem" id="lowprice" href="<%=application.getContextPath()%>/product/product_list_user?pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=3">낮은가격</a>
            <a class="filterItem" id="highprice" href="<%=application.getContextPath()%>/product/product_list_user?pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=4">높은가격</a>
            
        </div>
    </div>

<div class="container-xl p-0 productBox" >
	
		<!-- 검색 안내문구 영역 -->

    	
    <div class="text-center">
		<c:if test="${empty list}">
			<span class="mt-5">
				검색결과가 없습니다.<br>
				정확한 검색어 인지 확인하시고 다시 검색해 주세요.
			</span>
	   	</c:if>
    	<c:if test="${not empty list}">
    		<c:forEach var="p_list" items="${list}">
        		<ul class="list"><!-- 상품 리스트 영역 -->
	            	<li class="product mt-4">
			            <a href="<%=application.getContextPath()%>/product/product_view_user?productno=${p_list.productno}" id="product_no">
			               <img class="productImg" style="width:100%" src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${p_list.isavename}&type=${p_list.imgtype}" id="product_img">	                
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
      
    
    

			<div class="container-xl d-flex justify-content-center" >
				<div class="row">
					<table>
				    	<tr>
							<td colspan="5" class="text-center">
							<div class="d-flex">
									<!-- [처음] [이전] 1 2 3 4 5 [다음][맨끝] -->
								<div class="flex-grow-1">
										<a class="btn btn-dark btn-sm" 
										href="product_list_user?pageNo=1&pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=${sort}&searchword=${searchword}">[처음]</a>
										
										<c:if test="${pager_pl.groupNo>1}">
											<a class="btn btn-outline-secondary btn-sm" 
											href="product_list_user?pageNo=${pager_pl.startPageNo-1}&pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=${sort}&searchword=${searchword}">이전</a>
										</c:if>
										
										<c:forEach var="i" begin="${pager_pl.startPageNo}" end="${pager_pl.endPageNo}">
											<c:if test="${pager_pl.pageNo!=i}">
												<a class="btn btn-outline-secondary btn-sm" 
												href="product_list_user?pageNo=${i}&pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=${sort}&searchword=${searchword}">${i}</a>
											</c:if>
											<c:if test="${pager_pl.pageNo==i}">
												<a class="btn btn-light btn-sm" 
													href="product_list_user?pageNo=${i}&pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=${sort}&searchword=${searchword}">${i}</a>
											</c:if>	
										</c:forEach>
										
						
										<c:if test="${pager_pl.groupNo<pager_pl.totalGroupNo}">
											<a class="btn btn-outline-secondary btn-sm" 
											href="product_list_user?pageNo=${pager_pl.endPageNo+1}&pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=${sort}&searchword=${searchword}">다음</a>
										</c:if>
										
										<a class="btn btn-dark btn-sm" 
										href="product_list_user?pageNo=${pager_pl.totalPageNo}&pcategory=${pcategory}&pcategoryname=${pcategoryname}&sort=${sort}&searchword=${searchword}">[맨끝]</a>
									</div>	
				
								</div> 
							</td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>