<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--제품 리뷰-->
    <div style="clear: both;">
        <p style="margin-left:12%; margin-bottom: 0px; font-size: large;">REVIEW</p>
    </div><br>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <table class="table col-9" style="text-align: center";>
                <thead class="thead">
                    <tr style="background-color: lightgray;">
                        <th scope="col">번호</th>
                        <th scope="col" style="width:20%">상품정보</th>
                        <th scope="col" style="width:30%">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회</th>
                    </tr>
                </thead>
                <%-- <c:forEach var="review_list" items="list">
                 --%>    <tbody>
                    <tr>
                        <th scope="row">3</th>
                        <td><img src="<%=application.getContextPath()%>/resources/image/light2_sora.png" style="width:30%">${previews.productno}</td>
                        <td><a href="<%=application.getContextPath()%>/product/review_view" class="text-black-50">${previews.bcontent}</a></td>
                        <td>ㅎㅎ</td>
                        <td>2021-03-10</td>
                        <td>10</td>
                        
                    </tr>

                </tbody>
               <%--  </c:forEach> --%>
            </table>
        </div> 
    </div> 
    <div style="margin-left: 83%;">
        <a class="btn btn-white btn-outline-dark" href="<%=application.getContextPath()%>/product/review_write" role="button">글 작성</a>
        </div>

    <div class="row justify-content-md-center">
        <a href="#none"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></a> 
        <a href="#none" class="text-black-50">PREV</a> 
        <a href="#none" class="thisPageNumber text-black-50">1</a>
        <a href="#none" class="text-black-50">NEXT</a>
        <a href="#none"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></a>
    </div><br><br><br>




