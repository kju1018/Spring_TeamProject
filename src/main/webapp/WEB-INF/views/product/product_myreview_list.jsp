<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 전체 컨텐츠 영역 -->
<div class="row justify-content-center">
	<table class="table mt-4" style="text-align: center;">
		<thead class="thead">
			<tr style="background-color: lightgray;">
				<th width="10%">사진</th>
				<th  width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${empty list}">
				<tr class="cart_list" >
					<td colspan="8" class="text-center p-5">
						글이 없습니다.
					</td>
				</tr>
				<c:set var="total" value="${0}"/>
			</c:if>
			<c:if test="${not empty list}">
	            <c:forEach var="review" items="${list}">
	            	<tbody>
		                <tr>
		                    <td>
		                    	<c:if test="${review.borgimg != null}">
		                    		<img src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${review.bsaveimg}&type=${review.bimgtype}" style="width:100px; height:90px;">
		                    	</c:if>
		                    </td>
		                    <td><a href="<%=application.getContextPath()%>/product/product_view_user?productno=${review.productno}" style="width:20%" class="text-black-50">${review.btitle}</a></td>
		                    <td>${review.userid}</td>
		                    <td><fmt:formatDate value="${review.bdate}" pattern="yyyy-MM-dd"/></td>
		                    <td>${review.bcount}</td>   
		                </tr>
	
	            	</tbody>
	          	</c:forEach>
			   
				<tr>
				   	<td colspan="5" class="text-center">
				   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
				   		<a class="btn btn-dark btn-sm"
				   		    onclick="getProductReview(1)">[처음]</a>
				   		    
				   		<c:if test="${pager.groupNo>1}">
					   		<a class="btn btn-light btn-sm"
					   		   onclick="getProductReview(${pager.startPageNo-1})">이전</a>
					   	</c:if>
				   		
				   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				   			<c:if test="${pager.pageNo!=i}">
				   				<a class="btn btn-outline-secondary btn-sm"  onclick="getProductReview(${i})">${i}</a>
				   			</c:if>
				   			<c:if test="${pager.pageNo==i}">
				   				<a class="btn btn-secondary btn-sm" onclick="getProductReview(${i})">${i}</a>
				   			</c:if>
				   		</c:forEach>
				   		
				   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
					   		<a class="btn btn-light btn-sm"
					   		   onclick="getProductReview(${pager.endPageNo+1})">다음</a>
					   	</c:if>
				   		<a class="btn btn-dark btn-sm"
				   		   onclick="getProductReview(${pager.totalPageNo})">맨끝</a>
				   	</td>
				</tr>
			</c:if>
		</tbody>	
	</table>
</div>
<!--전체 컨텐츠 영역--> 





