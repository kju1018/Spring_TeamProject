<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="/WEB-INF/views/common/header.jsp" %>


 <!-- 전체 컨텐츠 영역 -->
<div class="container" style="margin-top: 12em;">
    <!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">커뮤니티 > </li>
        <li class="sm_nav">QnA</li>
    </ol>
    <br/>

	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">    
        <div class="deliver_info">
            <p class="titleyj">주문내역 상세</p>

            <div class="table table-responsive">
                <p>주문 정보</p>
                <table class="table">
                <tr>
                    <th>주문번호</th>
                    <td>${order.orderno}</td>
                </tr>
                <tr>
                    <th>주문일자</th>
                    <td>${order.odate}</td>
                </tr>
                <tr>
                    <th>결제방법</th>
                    <td>[${order.omethod}] KOSA은행 110-4234-2342342 (THE, FIVE)</td>
                </tr>
                <tr>
                    <th>주문자</th>
                    <td>${order.userid}</td>
                </tr>
                <tr>
                    <th>주문 상태</th>
                    <td>${order.ostatus}</td>
                </tr>
                </table> 
                <br/><br/>
                
                <p>배송지 정보</p> 
                <table class="table"> 
                <tr>
                    <th>받으시는분</th>
                    <td>${order.oreceiver}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${order.oaddress}</td>
                </tr>
                
                <tr>
                    <th>휴대전화</th>
                    <td colspan="3">${order.onumber}</td>
                </tr>
                
                <tr>
                    <th>배송메시지</th>
                    <td colspan="3">${order.omessage}</td>
                </tr>
            </table>

            <div class="o_v_bottom">
                <input type="button" class="btn btn-dark" value="주문 목록으로" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
            </div>


            </div>
        </div>    
    
    
 </div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>