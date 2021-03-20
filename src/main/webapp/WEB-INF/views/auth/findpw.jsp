<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container-lg wrapper_content item_mt-18">
        <div class="row justify-content-center"  >
            <div class="col-8">
                <!--제목 부분-->
                <div class="text_center_sort item_mt-2"><h5>비밀번호 찾기</h3></div>
                <!--아이디 라벨과 input 영역-->
                <div class="row item_mt-2 justify-content-center">
                    <!--라벨 : 아이디-->
                    <div class="col-3 align-self-end ">
                        <label for="uid">아이디</label> 
                    </div>
                    <!--input : 아이디-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uid" name="uid">
                    </div>
                </div>
                <!--이름 라벨과 input 영역-->
                <div class="row item_mt-1 justify-content-center">
                    <!--라벨 : 이름-->
                    <div class="col-3 align-self-end ">
                        <label for="uname">이름</label> 
                    </div>
                     <!--input :이름-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uname" name="uname">
                    </div>
                </div>
                <div class="row item_mt-1 justify-content-center" >
                    <!--라벨 : 이메일-->
                    <div class="col-3  align-self-end">
                        <label for="uemail">이메일로 찾기</label>
                    </div>
                    <!--input :이메일-->
                    <div class="col-6">
                        <input type="text" class="form-control" id="uemail"  name="uname">
                    </div>
                </div>
                <!--확인 버튼 영역-->
                <div class="row item_mt-3 justify-content-center item_mb-3">
                    <button class="btn btn-dark btn-lg item_width_20 btn-block">확인</button>
                </div>
               
                
            </div>
        </div>
    </div>
    

       	
             