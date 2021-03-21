<%-- page 지시자 --%>
<!-- page 지시자 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>

<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="container-xl" style="margin-top: 18em;" >
        <form action="<%=application.getContextPath()%>/auth/signup" method="post">
            <div class="col" style=" text-align: center;"><h3>회원가입</h3></div>
            <div class="col mb-3" style=" text-align: start;"><h3>기본정보</h3></div>
            
            <div class="container-xl mb-5 border border-secondary"><!-- 전체 영역-->
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2">
                        <label class="signup-label" for="uid">아이디</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="text" class="signup-input" id="uid" name="uid">
                            </div>
                            <div class="col-8 align-self-center">
                                <span class="signup-span">(영문소문자/숫자, 4 ~ 16자)</span>
                            </div>
                        </div>
                    </div>
                    
                </div>
            
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2">
                        <label class="signup-label" for="upassword">비밀번호</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="password" class="signup-input" id="upassword" name="upassword">
                            </div>
                            <div class="col-8 align-self-center">
                                <span class="signup-span">(영문대소문자/특수문자 중 2가지 이상 조합, 10 ~ 16자)</span>
                            </div>
                        </div>
                    </div>    
                </div>
                
                <div class="row align-items-center border-bottom border-secondary">
                    <div class="col-2">
                        <label class="signup-label" for="urepassword">비밀번호 확인</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="password" class="signup-input" id="urepassword" name="urepassword">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                        <label class="signup-label" for="id">이름</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row">
                            <div class="col-4">
                                <input type="text" class="signup-input" id="uname" name="uname">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2">주소</div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <input type="text" style="width: 100%;" name="uaddress1">
                            </div>
                            <div class="col-2 pl-0">
                                <a href="#" class="btn btn-outline-dark btn-sm">우편번호</a>
                            </div>
                        </div>
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <input type="text" style="width: 100%;">
                            </div>
                            <div class="col-8">
                               <span class="signup-span">기본주소</span>
                            </div>
                        </div>
                        <div class="row align-items-center mt-1 mb-1">
                            <div class="col-4">
                                <input type="text" style="width: 100%;">
                            </div>
                            <div class="col-8">
                               <span class="signup-span">나머지 주소(선택입력가능)</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                    	<label class="signup-label" for="id">전화번호</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center">
                            <div class="col-2">
                                <select id="inputState" class="signup-input" name="unumber1">
                                    <option selected value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="02">02</option>
                                </select>
                            </div>
                            <span class="ml-1">-</span>
                            <div class="col-2">
                                <input type="text" class="signup-input" name="unumber2">
                            </div>
                            <span class="ml-1">-</span>
                            <div class="col-2" >
                                <input type="text" class="signup-input" name="unumber3">
                            </div>
                        </div>
                    </div>
                </div>
                
               	<div class="row align-items-center border-bottom border-secondary" >
                    <div class="col-2" >
                        <label class="signup-label" for="id">이메일</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <input type="email" class="signup-input" name="uemail">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row align-items-center">
                    <div class="col-2" >
                    	<label class="signup-label" for="id">생년월일</label>
                    </div>
                    <div class="col-10 border-left border-secondary">
                        <div class="row align-items-center" style="margin-top: 0.2em;">
                            <div class="col-2">
                                <input type="text" class="signup-input" name="uyear">
                            </div>
                            <span>년</span>
                            <div class="col-2">
                                <input type="text" class="signup-input" name="umonth">
                            </div>
                            <span>월</span>
                            <div class="col-2">
                                <input type="text" class="signup-input" name="uday">
                            </div>
                            <span class="mr-4">일</span>
                            <div class="col" >
                                <div class="row ">
                                    <div class="col-5" >
                                        <div class="row align-items-center">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="inlineCheckbox1" value="option1">
                                                <label class="form-check-label" for="inlineCheckbox1">양력</label>
                                              </div>
                                              <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" id="inlineCheckbox2" value="option2">
                                                <label class="form-check-label" for="inlineCheckbox2">음력</label>
                                              </div>
                                        </div>
                                        
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg" style=" text-align: start;"><h3>전체동의</h3></div>
            <div class="border pl-4 pr-4"><!--약관 동의-->
                <table style="width: 100%;">
                    <colgroup>
                        <col style="width: 50px;">
                        <col style="width: auto">
                    </colgroup>
                    <tr class="border-bottom">
                        <th class="p-2"><input type="checkbox"></th>
                        <th>
                            모든 약관 동의
                        </th>
                    </tr>

                    <tr class="border-bottom">
                        <th class="p-2"><input type="checkbox"></th>
                        <td>
                            [필수] 구매조건 확인 및 결제진행 동의
                        </td>
                    </tr>

                    <tr>
                        <th class="p-2"><input type="checkbox"></th>
                        <td>
                            [필수] 쇼핑몰 이용약관 동의
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col text-center mt-5">
            	<button type="submit" class="btn btn-lg btn-dark">회원가입</button>  
            </div>
        </form>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>