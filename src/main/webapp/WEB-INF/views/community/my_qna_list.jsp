<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 전체 컨텐츠 영역 -->
<div class="row justify-content-center">
	<table class="table mt-4" style="text-align: center;">
		<thead class="thead">
			<tr style="background-color: lightgray;">
				<th width="10%">번호</th>
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
				<c:forEach var="post_list" items="${list}">
			      <tr>
			         <td>${post_list.boardno}</td>
			         <td><a href="<%=application.getContextPath()%>/community/myqna_view?boardno=${post_list.boardno}">${post_list.btitle}</a></td>
			         <td>${post_list.userid}</td>
			         <td><fmt:formatDate value="${post_list.bdate}" pattern="yyyy-MM-dd"/></td>
			         <td>${post_list.bcount}</td>
			      </tr>
				</c:forEach>
			   
				<tr>
				   	<td colspan="5" class="text-center">
				   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
				   		<a class="btn btn-dark btn-sm"
				   		    onclick="getMyQnA(1)">처음</a>
				   		    
				   		<c:if test="${pager.groupNo>1}">
					   		<a class="btn btn-light btn-sm"
					   		   onclick="getMyQnA(${pager.startPageNo-1})">이전</a>
					   	</c:if>
				   		
				   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				   			<c:if test="${pager.pageNo!=i}">
				   				<a class="btn btn-outline-secondary btn-sm"  onclick="getMyQnA(${i})">${i}</a>
				   			</c:if>
				   			<c:if test="${pager.pageNo==i}">
				   				<a class="btn btn-secondary btn-sm" onclick="getMyQnA(${i})">${i}</a>
				   			</c:if>
				   		</c:forEach>
				   		
				   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
					   		<a class="btn btn-light btn-sm"
					   		   onclick="getMyQnA(${pager.endPageNo+1})">다음</a>
					   	</c:if>
				   		<a class="btn btn-dark btn-sm"
				   		   onclick="getMyQnA(${pager.totalPageNo})">맨끝</a>
				   	</td>
				</tr>
			</c:if>
		</tbody>	
	</table>
</div>
<!--전체 컨텐츠 영역--> 
