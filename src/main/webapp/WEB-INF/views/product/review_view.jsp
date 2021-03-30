<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container-fluid" style="margin-top:15%">
		<div class="row" >
		<div class="col-5 text-center">
			<div class="title">
				<h2>
					<font color="33333">REVIEW</font>
				</h2>
				<p>상품 사용후기입니다.</p>
			</div>
			</div>
		</div>
			
			<div class="container-fluid">
				<div class="row justify-content-center">
					<table class="rv_table" style="width:70%;">		
					<tr>
					<th class="rv_table" colspan="2">
						<div id="rv_div1" class="col-2 content-left">
						<img src="<%=application.getContextPath()%>/resources/image/light2_sora.png" width="80%" height="80%" style="margin: 10px">
						</div>						
						<div id="rv_div2" class="col-9" >
							<b>북유럽식 식탁조명<br>50,000원</b>
							<hr style="color:lightgray"/>
              <a class="btn btn-dark"  href="product_view" role="button"> 상품상세보기 </a>
                       						
						</div>
					</th>
					</tr>	
					<c:forEach var="rv_board" items="${list}">
						<tr>
								<td class="rv_table">SUBJECT</td>
								<td class="rv_table" style="text-align: left; width:70%;">&nbsp;${rv_board.btitle}</td>
							</tr>
							<tr>
								<td class="rv_table">WRITER</td>
								<td class="rv_table" style="text-align: left">&nbsp;${rv_board.userid}</td>
							</tr>
							<tr>
								<td class="rv_table">DATE</td>
								<td class="rv_table" style="text-align: left">&nbsp;<fmt:formatDate value="${rv_board.bdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td class="rv_table" colspan="2" height="150">${rv_board.bcontent}</td>
							</tr>		
							
							</c:forEach>				
					</table>
					</div>
						<br>
               <div>
                   <a class="btn btn-light btn-outline-secondary" style="width:8%; margin-left:77.7%;" href="<%=application.getContextPath()%>/product/product_view" role="button"> 목록 </a>
              </div>
				<br><br>
</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
