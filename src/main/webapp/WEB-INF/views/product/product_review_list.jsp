<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <!--제품 리뷰-->
    <div style="clear: both;">
        <p style="margin-left:12%; margin-bottom: 0px; font-size: large;">REVIEW</p>
    </div><br>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <table class="table col-9" style="text-align: center";>
                <thead class="thead">
                    <tr style="background-color: lightgray;">
                        <th scope="col" style="width:20%">상품정보</th>
                        <th scope="col" style="width:30%">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회</th>
                    </tr>
                </thead>
                <c:forEach var="rv_list" items="${previews}">
                	<tbody>
                    <tr>
                        <td><img src="<%=application.getContextPath()%>/resources/image/light2_sora.png" style="width:30%">${rv_list.btitle}</td>
                        <td><a href="<%=application.getContextPath()%>/product/review_view" class="text-black-50">${rv_list.bcontent}</a></td>
                        <td>${rv_list.userid}</td>
                        <td><fmt:formatDate value="${rv_list.bdate}" pattern="yyyy-MM-dd"/></td>
                        <td>${rv_list.bcount}</td>
                        
                    </tr>

                </tbody>
              </c:forEach>
            </table>
        </div> 
    </div> 
    <div style="margin-left: 82%;">
    
        <button class="btn btn-white btn-outline-dark" onclick="reviewWriteForm()">글 작성</button>
       
    </div>

	<c:if test="${not empty previews}">	
	<div class="container-xl d-flex justify-content-center" >
		<div class="row">
		<table>
	    <tr>
				<td colspan="5" class="text-center">
				<div class="d-flex">
						<!-- [처음] [이전] 1 2 3 4 5 [다음][맨끝] -->
					<div class="flex-grow-1">
							<button class="btn btn-outline-secondary btn-sm" 
							onclick="reviewList(1)">[처음]</button>
							
							<c:if test="${pager.groupNo>1}">
								<button class="btn btn-outline-secondary btn-sm" 
								onclick="reviewList(${pager.startPageNo-1})">이전</button>
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo!=i}">
									<button class="btn btn-outline-secondary btn-sm" 
									onclick="reviewList(${i})">${i}</button>
								</c:if>
								<c:if test="${pager.pageNo==i}">
									<button class="btn btn-danger btn-sm" 
										onclick="reviewList(${i})">${i}</button>
								</c:if>	
							</c:forEach>
							
			
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<button class="btn btn-outline-secondary btn-sm" 
								onclick="reviewList(${pager.endPageNo+1})">다음</button>
							</c:if>
							
							<button class="btn btn-outline-secondary btn-sm" 
							onclick="reviewList(${pager.totalPageNo})">[맨끝]</button>
						</div>	
	
					</div> 
				</td>
			</tr>
		</table>
		</div>
	</div>
	</c:if>



