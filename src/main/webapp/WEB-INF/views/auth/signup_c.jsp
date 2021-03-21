<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
  
  
   <div class="container-fluid item_mt-18 " >
        <div class="row justify-content-center " >
            <div class="col-6 border p-3">
                <h3 class="text_center_sort item_mb-1">회원가입이 완료 되었습니다</h3>
                    <div class="container wrapper_content item_pb-1" >
                        <div class="row ">
                            <div class=" container-fluid p-1 header_border_bottom item_mb-05" style="background-color: lightgray; ">
                                <img src="common/image/alert_sihyun.svg" alt="">
                                <span class="align-middle fontsize-sm"></span>저희 쇼핑몰을 이용해 주셔서 감사합니다.</span>
                            </div>
                            <div class="col ">
                               
                                <div class="row justify-content-start">
                                    <div class="col-2 item_p mr-1 item_pt-017 item_mr-07">
                                        <img src="<%=application.getContextPath()%>/resources/image/user.png" alt="userprofile"width="85">
                                    </div>
                                    <div class="col">
                                        <div class="row item_pb-1">
                                            <div class="col-3 item_pt-1">
                                                <p>아이디</p>
                                                <p>이름</p>
                                                <p>이메일</p>
                                            </div>
                                            <div class="col item_pt-1">
                                                <p>si0852</p>
                                                <p>박시현</p>
                                                <p>sihyun@naver.com</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="col text_center_sort item_mt-3"><p>박시현님은[일반회원]입니다.</p></div>
                <div class="col text_center_sort"><a href="<%=application.getContextPath()%>" class="btn btn-outline-dark btn-lg btn-block">메인으로 이동</a></div>
            </div>
            
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>