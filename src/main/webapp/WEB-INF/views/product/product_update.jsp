<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <div class="container-xl" style="margin-top: 18em;" >
        <form id="update" name="update" action="<%=application.getContextPath()%>/product/update" method="post" >
            <div class="col" style=" text-align: center;"><h3>상품 수정</h3></div>
            <div class="col mb-3" style=" text-align: start;"><h3>상품 정보</h3></div>
            
            <div class="container-xl mb-5 border border-secondary"><!-- 전체 영역-->
           
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-4">
                        <label class="signup-label" for="pcategory">PCATEGORY</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="number" class="signup-input" id="pcategory" name="pcategory">
                            </div>
                        </div>
                    </div>    
                </div>
                
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-4">
                        <label class="signup-label" for="pname">PNAME</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="text" class="signup-input" id="pname" name="pname">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="pprice">PPRICE</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="number" class="signup-input" id="pprice" name="pprice">
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="psalescount">PSALESCOUNT</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="number" class="signup-input" id="psalescount" name="psalescount">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="pstock">PSTOCK</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="number" class="signup-input" id="pstock" name="pstock">
                            </div>                            
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="penable">PENABLE</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="text" class="signup-input" id="penable" name="penable">
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="detailimgoname">DETAILIMGONAME</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="text" class="signup-input" id="detailimgoname" name="detailimgoname">
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="detailimgsname">DETAILIMGSNAME</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="text" class="signup-input" id="detailimgsname" name="detailimgsname">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-4">
                        <label class="signup-label" for="detailimgtype">DETAILIMGTYPE</label>
                    </div>
                    <div class="col-8 border-left border-secondary">
                        <div class="row">
                            <div class="col-12">
                                <input type="text" class="signup-input" id="detailimgtype" name="detailimgtype">
                            </div>
                        </div>
                    </div>
                </div>
							</div>
            <div class="col text-center mt-5">
            <!-- <%=application.getContextPath()%>/auth/signup_complete -->
            	<button type="submit" class="btn btn-lg btn-dark">상품 수정</button>  
            </div>
        </form>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>