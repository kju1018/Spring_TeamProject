<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
                <c:if test="${empty previews}">
	                <tr>
	                	<td colspan="5">글이 없습니다.</td>
	                </tr>	
								</c:if>
                <c:forEach var="rv_list" items="${previews}">
                	<tbody>
                    <tr>
                    <c:choose>
                    	<c:when test="${rv_list.borgimg != null}">
                        <td><img src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${rv_list.bsaveimg}&type=${rv_list.bimgtype}" style="width:100px; height:80px;"></td>
                       </c:when>
                       <c:otherwise>
                       	<td><div style="width:30%;"></div></td>                       
                       </c:otherwise>
                      </c:choose>
                        <td><a onclick="ReviewRead(${rv_list.boardno})" style="width:20%; cursor: pointer;" class="text-black-50">${rv_list.btitle}</a></td>
                        <td>${rv_list.userid}</td>
                        <td><fmt:formatDate value="${rv_list.bdate}" pattern="yyyy-MM-dd"/></td>
                        <td>${rv_list.bcount}</td>
                        
                    </tr>

                </tbody>
              </c:forEach>
            </table>
        </div> 
    </div> 
    <sec:authorize access="isAuthenticated()">
    <div style="margin-left: 82%;">    
        <button class="btn btn-white btn-outline-dark" onclick="reviewWriteForm(${products.productno})">글 작성</button>       
    </div>
		</sec:authorize>
	<c:if test="${not empty previews}">	
	<div class="container-xl d-flex justify-content-center" >
		<div class="row">
		<table>
	    <tr>
				<td colspan="5" class="text-center">
				<div class="d-flex">
						<!-- [처음] [이전] 1 2 3 4 5 [다음][맨끝] -->
					<div class="flex-grow-1">
							<button class="btn btn-dark btn-sm" 
							onclick="reviewList(1)">[처음]</button>
							
							<c:if test="${pager_pr.groupNo>1}">
								<button class="btn btn-light btn-sm" 
								onclick="reviewList(${pager_pr.startPageNo-1})">이전</button>
							</c:if>
							
							<c:forEach var="i" begin="${pager_pr.startPageNo}" end="${pager_pr.endPageNo}">
								<c:if test="${pager_pr.pageNo!=i}">
									<button class="btn btn-outline-secondary btn-sm" 
									onclick="reviewList(${i})">${i}</button>
								</c:if>
								<c:if test="${pager_pr.pageNo==i}">
									<button class="btn btn-light btn-sm" 
										onclick="reviewList(${i})">${i}</button>
								</c:if>	
							</c:forEach>
							
			
							<c:if test="${pager_pr.groupNo<pager.totalGroupNo}">
								<button class="btn btn-light btn-sm" 
								onclick="reviewList(${pager_pr.endPageNo+1})">다음</button>
							</c:if>
							
							<button class="btn btn-dark btn-sm" 
							onclick="reviewList(${pager_pr.totalPageNo})">[맨끝]</button>
						</div>	
	
					</div> 
				</td>
			</tr>
		</table>
		</div>
	</div>
	</c:if>



