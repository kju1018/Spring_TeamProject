<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>

   // 생략	

	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();

		var url = "${pageContext.request.contextPath}/community/qna_list";
		
		url = url + "?searchType=" + $("#searchType").val();
		url = url + "&keyword=" + $("#keyword").val();
		
		location.href = url;

		console.log(url);

	});	

</script>


<!-- 전체 컨텐츠 영역 -->
<div class="container" style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">커뮤니티 > </li>
        <li class="sm_nav">QnA</li>
    </ol>
    <br/>

    <!--제목-->
    <img src="<%=application.getContextPath()%>/resources/image/slide7.jpg" class="container">
	<p class="titleyj">QnA</p>
	<p class="sub_title">QnA입니다.</p>
	
	<!-- 공지사항 QnA 선택 버튼 -->
	<div class="select_nav">
		<input type="button" class="btn btn-outline-dark" value="공지사항" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'">
		<input type="button" class="btn btn-outline-dark" value="QnA" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">          
	</div>   
	       
    <div style="text-align: right; margin-bottom: 4px;">
        <input type="button" class="btn btn-dark btn-sm" value="글쓰기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_write'"> 
    </div>
    <!--게시판-->
     <table class="table">
            <thead>
                <tr>
                    <th width="10%">NO</th>
                    <th width="50%">SUBJECT</th>
                    <th width="15%">WRITER</th>
                    <th width="15%">DATE</th>
                    <th width="10%">READ</th>
                </tr>
            </thead>

            <tbody>
               <c:forEach var="communityqna" items="${list}">
		      <tr>
		         <td>${communityqna.boardno}</td>
		         <td><a href="qna_view?boardno=${communityqna.boardno}">${communityqna.btitle}</a></td>
		         <td>${communityqna.userid}</td>
		         <td><fmt:formatDate value="${communityqna.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${communityqna.bcount}</td>
		      </tr>
		   </c:forEach>
		   
		   
		   <tr>
		   	<td colspan="5" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-dark btn-sm"
		   		   href="qna_list?pageNo=1&searchType=${searchType}&keyword=${keyword}">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-light btn-sm"
			   		   href="qna_list?pageNo=${pager.startPageNo-1}&searchType=${searchType}&keyword=${keyword}">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-secondary btn-sm" href="qna_list?pageNo=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-secondary btn-sm" href="qna_list?pageNo=${i}&searchType=${searchType}&keyword=${keyword}">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-light btn-sm"
			   		   href="qna_list?pageNo=${pager.endPageNo+1}&searchType=${searchType}&keyword=${keyword}">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-dark btn-sm"
		   		   href="qna_list?pageNo=${pager.totalPageNo}&searchType=${searchType}&keyword=${keyword}">맨끝</a>
		   	</td>
		   </tr>
            </tbody>
    </table>
	
	<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="btitlebcontent" selected <c:if test="${param.searchType=='btitlebcontent'}">selected</c:if>>제목+본문</option>

					<option value="userid" <c:if test="${param.searchType=='userid'}">selected</c:if>>작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword" value="${param.keyword}" />

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>

		<!-- search{e} -->

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>