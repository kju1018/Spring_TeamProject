<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

   <div class="container-lg wrapper_content item_mt-18">
        <div class="row justify-content-center"  >
            <div class="col-6">
                <!--제목부분-->
                <div class="text_center_sort item_mt-2"><h5>회원로그인</h3></div>
                <!--아이디 입력-->
                <div class=" item_mt-2">
                    <input type="text" class="form-control" id="id"  placeholder="ID">
                </div>
                <!--비밀번호 입력-->
                <div class="item_mt-1" >
                    <input type="password" class="form-control" id="upassword"  placeholder="PASSWORD">
                </div>
                <!--로그인 버튼-->
                <div class="item_mt-1">
                    <button class="btn btn-dark btn-lg item_width_100 btn-block">로그인</button>
                </div>
                <!-- span 태그-->
                <div class="item_mt-05  item_pl-1">
                    <span class="fontsize-sm">아이디 찾기 |</span>
                    <span class="fontsize-sm">비밀번호 찾기</span>
                </div>
                <!--회원가입 버튼-->
                <div class="item_mt-05 item_mb-3">
                    <button class="btn btn-secondary btn-lg item_width_100 btn-block">회원가입</button>
                </div>
                
            </div>
        </div>
    </div>