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
                    <td>A12341234</td>
                </tr>
                <tr>
                    <th>주문일자</th>
                    <td>2021-03-08</td>
                </tr>
                <tr>
                    <th>결제방법</th>
                    <td>[무통장 입금] KOSA은행 110-4234-2342342 (THE, FIVE)</td>
                </tr>
                <tr>
                    <th>주문자</th>
                    <td>이연정</td>
                </tr>
                </table> 
                <br/><br/>
                
                <p>배송지 정보</p> 
                <table class="table"> 
                <tr>
                    <th>받으시는분</th>
                    <td>이연정</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>서울특별시 송파구 송파대로 257(가락동)</td>
                </tr>
                
                <tr>
                    <th>휴대전화</th>
                    <td colspan="3">010-1234-1234</td>
                </tr>
                
                <tr>
                    <th>배송메시지</th>
                    <td colspan="3">문 앞에 놔주세요</td>
                </tr>
            </table>

            <div class="o_v_bottom">
                <input type="button" class="btn btn-dark" value="주문 목록으로" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
            </div>


            </div>
        </div>    
    
    
 </div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>