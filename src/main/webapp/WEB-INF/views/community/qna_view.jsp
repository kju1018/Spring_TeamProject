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
    <p class="titleyj">QnA 상세</p>

    <!--게시판-->
    <div class="table table-responsive">
        <table class="table">
            <colgroup>
                <col style="width:150px";>
            </colgroup>
            <tr>
                <th width="25%">글번호</th>
                <td>1</td>
                <th width="25%">조회수</th>
                <td>95</td>
            </tr>
            
            
            <tr>
                <th width="25%">작성자</th>
                <td>이연정</td>
                <th width="25%">작성일</th>
                <td>2021-03-10</td>
            </tr>
            
            <tr>
                <th class="success">제목</th>
                <td colspan="3">사이즈 문의</td>
            </tr>
            
            <tr>
                <th class="success">글내용</th>
                <td colspan="3">전선의 길이는 어떤가여? 충분한지 궁금해여.... 방 구조상 좀더 길어야 할 것 같은데 좀 더 긴 사이즈는 없나여? 그리고 배송도 퀵으로 받을 수 있는 방법 없나요? 진짜 급한데 ㅠㅠ</td>
            </tr>
        </table>

            
            <div class="q_v_bottom">
                <hr/>
                <input type="button" class="btn btn-dark btn-sm" value="답글 쓰기" onclick="location.href='qna_write'">
                <input type="button" class="btn btn-dark btn-sm" value="수정하기" onclick="location.href='qna_write'">          
                <input type="button" class="btn btn-dark btn-sm" value="글작성" onclick="location.href='qna_write'">
                <input type="button" class="btn btn-dark btn-sm" value="목록보기" onclick="location.href='qna_list'">
            </div>
            
        
       
    </div>
    <!--게시판-->

</div>
 <!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>