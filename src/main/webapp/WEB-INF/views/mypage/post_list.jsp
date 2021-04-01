<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<!-- 전체 컨텐츠 영역 -->	
<div class="container" style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">게시물관리</li>
    </ol>
    <br/>
	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">
    <!--제목-->
	<div class="titleyj">
		<p>게시물 관리</p>
	</div>
	<div class="my_button">
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage_update'">
		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/like_list'">
		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<!-- 게시물 종류 선택 -->
	<div class="sel_nav">
		<label>[내가 쓴 QnA]</label>
	</div>

	<!--게시판-->
	<table class="table">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th  width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post_list" items="${list}">
		      <tr>
		         <td>${post_list.boardno}</td>
		         <td><a href="<%=application.getContextPath()%>/community/qna_view?boardno=${post_list.boardno}">${post_list.btitle}</a></td>
		         <td>${post_list.userid}</td>
		         <td><fmt:formatDate value="${post_list.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${post_list.bcount}</td>
		      </tr>
		   </c:forEach>
		   
		   <tr>
		   	<td colspan="5" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-outline-primary btn-sm"
		   		   href="post_list?pageNo=1">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-outline-primary btn-sm"
			   		   href="post_list?pageNo=${pager.startPageNo-1}">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-success btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-danger btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-outline-primary btn-sm"
			   		   href="post_list?pageNo=${pager.endPageNo+1}">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-outline-primary btn-sm"
		   		   href="post_list?pageNo=${pager.totalPageNo}">맨끝</a>
		   	</td>
		   </tr>
		</tbody>
	</table>
	<hr/>
	<!--게시판-->
	
	<!--게시판-->
	<div class="sel_nav">
		<label>[내가 쓴 제품 QnA]</label>
	</div>
	
	<table class="table mb-7">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th  width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post_list" items="${list}">
		      <tr>
		         <td>${post_list.boardno}</td>
		         <td><a href="<%=application.getContextPath()%>/community/qna_view?boardno=${post_list.boardno}">${post_list.btitle}</a></td>
		         <td>${post_list.userid}</td>
		         <td><fmt:formatDate value="${post_list.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${post_list.bcount}</td>
		      </tr>
		   </c:forEach>
		   
		   <tr>
		   	<td colspan="5" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-outline-primary btn-sm"
		   		   href="post_list?pageNo=1">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-outline-primary btn-sm"
			   		   href="post_list?pageNo=${pager.startPageNo-1}">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-success btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-danger btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-outline-primary btn-sm"
			   		   href="post_list?pageNo=${pager.endPageNo+1}">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-outline-primary btn-sm"
		   		   href="post_list?pageNo=${pager.totalPageNo}">맨끝</a>
		   	</td>
		   </tr>
		</tbody>
	
	</table>
	<hr/>
	<!--게시판-->
	
	<!--게시판-->
	<div class="sel_nav">
		<label>[내가 쓴 제품리뷰]</label>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th  width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post_list" items="${list}">
		      <tr>
		         <td>${post_list.boardno}</td>
		         <td><a href="<%=application.getContextPath()%>/community/qna_view?boardno=${post_list.boardno}">${post_list.btitle}</a></td>
		         <td>${post_list.userid}</td>
		         <td><fmt:formatDate value="${post_list.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${post_list.bcount}</td>
		      </tr>
		   </c:forEach>
		   
		   <tr>
		   	<td colspan="5" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-outline-primary btn-sm"
		   		   href="post_list?pageNo=1">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-outline-primary btn-sm"
			   		   href="post_list?pageNo=${pager.startPageNo-1}">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-success btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-danger btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-outline-primary btn-sm"
			   		   href="post_list?pageNo=${pager.endPageNo+1}">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-outline-primary btn-sm"
		   		   href="post_list?pageNo=${pager.totalPageNo}">맨끝</a>
		   	</td>
		   </tr>
		</tbody>
	</table>
	<hr/>
	<!--게시판-->

    
    <br/>

	
	<div class="c_bottom">
		<input type="button" class="btn btn-dark" value="메인화면으로" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>