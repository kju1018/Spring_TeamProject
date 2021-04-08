package com.mycompany.webapp.provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.mycompany.webapp.dao.UsersDao;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UsersService;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	private static final Logger logger =
			LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	@Autowired
	private UsersService userservice;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
		
        String password = (String) authentication.getCredentials();
        
     
        
        User user = (User)userservice.finduser(username);
        
        if(!matchPassword(password, user.getUpassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
        
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());

	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	 private boolean matchPassword(String loginPwd, String password) {
	        return loginPwd.equals(password);
	    }


}
