<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript">
</script>

    <div class="container-xl" style="margin-top: 18em;" >
        <form id="update_num" name="update_num" action="<%=application.getContextPath()%>/product/update_num" method="post" >
            <div class="col" style=" text-align: center;"><h3>상품 수정</h3></div>
            <div class="col mb-3" style=" text-align: start;"><h3>상품 번호</h3></div>
            
            <div class="container-xl mb-5 border border-secondary"><!-- 전체 영역-->
           
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-4">
                        <label class="signup-label" for="productno">PRODUCTNO</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="number" class="signup-input" id="productno" name="productno">
                            </div>
                        </div>
                    </div>    
                </div>
             </div>
            <div class="col text-center mt-5">
            <!-- <%=application.getContextPath()%>/auth/signup_complete -->
            	<button type="submit" class="btn btn-lg btn-dark">번호 확인</button>  
            </div>
        </form>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>