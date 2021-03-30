<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <form action="create" method="post">
    <div class="table table-responsive">
        <table class="table">
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
                <button type="submit" class="btn btn-dark btn-sm">등록</button>
                <input type="button" class="btn btn-dark btn-sm" value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">
            </div>
    </div>
    </form>
    <!--게시판-->

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>