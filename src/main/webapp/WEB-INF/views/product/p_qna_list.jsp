<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.webapp.dto.*" %>


<div >
	<p style="margin-left:12%; margin-bottom: 0px; font-size: large;">Q&A</p>
</div>

<div class="row justify-content-center">
	<table class="table col-9" style="text-align: center;">
		<thead class="thead">
			<tr style="background-color: lightgray;">
				<th scope="col">번호</th>
                <th scope="col">제품번호</th>
                <th scope="col" style="width:33%">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="productqna" items="${list}">
				<tr>
					<td>${productqna.boardno}</td>
	                <td>${productqna.productno}</td>
	                <td><a href="<%=application.getContextPath()%>/product/p_qna_view?boardno=${productqna.boardno}" class="text-black-50">${productqna.btitle}</a></td>
	                <td>${productqna.userid}</td>
	                <td><fmt:formatDate value="${productqna.bdate}" pattern="yyyy-MM-dd"/></td>
	                <td>${productqna.bcount}</td>
				</tr>
			</c:forEach>
 			
 			<tr>
				<td colspan="5" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-dark btn-sm"
		   		  onclick="qnaList(1)">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-light btn-sm"
			   		   onclick="qnaList(${pager.startPageNo-1})">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-secondary btn-sm" onclick="qnaList(${i})">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-outline-secondary btn-sm" onclick="qnaList(${i})">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-light btn-sm" onclick="qnaList(${pager.endPageNo+1})">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-dark btn-sm" onclick="qnaList(${pager.totalPageNo})">맨끝</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>
        
<div style="margin-left: 80%;">
	<a class="btn btn-white btn-outline-dark" href="<%=application.getContextPath()%>/product/p_qna_write?productno=${pager.pcategory}" role="button">상품문의하기</a>
</div>
							 