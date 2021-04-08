package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.mycompany.webapp.controller.AuthContoller;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	
	
	

	  private static final Logger logger =
				LoggerFactory.getLogger(LoginFailureHandler.class);
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
        String errormsg = null;
        
        if(exception instanceof BadCredentialsException) {
            errormsg ="아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
        } else if(exception instanceof DisabledException) {
            errormsg = "계정이 비활성화되었습니다. 관리자에게 문의해주세요";
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = "비밀번호 유효기간이 만료되었습니다. 관리자에게 문의하세요";
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("errormsg", errormsg);
     
        super.onAuthenticationFailure(request, response, exception);


		
	}


	
	

}
