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

    <!--제목-->
    <img src="<%=application.getContextPath()%>/resources/image/slide8.png" class="container">
    <p class="titleyj">답글 상세보기</p>
    
    <table class="table">
        <tr>
            <th style="width:15%">글번호</th>
            <td>1</td>
            <th style="width:15%">조회수</th>
            <td>28</td>
        </tr>
        <tr>
            <th style="width:15%">작성자</th>
            <td>관리자</td>
            <th style="width:15%">작성일</th>
            <td>2021-03-10</td>
        </tr>
        <tr>
            <th style="width:15%">제목</th>
            <td colSpan=3>[Re: 사이즈 문의]</td>
        </tr>
        <tr>
            <th style="width:15%">글내용</th>
            <td colSpan=3>현재 저희 사이트에서 판매하는 조명의 전선 길이는 한가지 사이즈 밖에 없습니다.</td>
        </tr>
    </table>
        
            <div class="a_v_bottom">
                <hr/>
                <input type="button" class="btn btn-dark btn-sm" value="답글 쓰기">
                <input type="button" class="btn btn-dark btn-sm" value="수정하기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_write'">          
                <input type="button" class="btn btn-dark btn-sm"value="삭제하기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">
                <input type="button" class="btn btn-dark btn-sm" value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">
            </div>
       
    
   
</div>
 

<%@ include file="/WEB-INF/views/common/footer.jsp" %>