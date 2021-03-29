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
    <p class="titleyj">QnA 쓰기</p>

    <!--게시판-->
    <div class="table table-responsive">
        <table class="table">
            <tr>
                <th width="25%">글번호</th>
                <td><input type="text" class="form-control" id="btitle" name="boardno"></td>
                <th width="25%">조회수</th>
                <td><input type="text" class="form-control" id="bcount" name="bcount"></td>
            </tr>
            
            <tr>
                <th width="25%">작성자</th>
                <td><input type="text" class="form-control" id="userid" name="userid"></td>
                <th width="25%">작성일</th>
                <td><fmt:formatDate value="${communityqna.bdate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            
            <tr>
                <th>제목</th>
                <td colspan="3"><input type="text" id="btitle" name="btitle" style="width: 100%;"></td>
            </tr>
            
            <tr>
                <th>글내용</th>
                <td colspan="3"><textarea style="width: 100%;" id="bcontent" name="bcontent"></textarea></td>
            </tr>
        </table>

            <div class="q_w_bottom">
                <hr/>         
                <input type="button" class="btn btn-dark btn-sm" value="등록" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">
                <input type="button" class="btn btn-dark btn-sm" value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">
            </div>

        
    
    </div>
    <!--게시판-->

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>