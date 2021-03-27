package com.mycompany.webapp.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UsersDao;
import com.mycompany.webapp.dto.User;

@Service
public class UsersService {
	
	private static final Logger logger =
			LoggerFactory.getLogger(UsersService.class);
	
	@Autowired
	private UsersDao usersDao;
	
	public void join(User user) {
	
		user.setUjoindate(new Date());
		user.setUexit(0);
		user.setUauthority(0);
		
		usersDao.userInsert(user);
	}
	
	public String duplicateId(User user) {
		User dbUser=usersDao.selectbyUserid(user.getUserid());
		 if(dbUser != null) {
			 logger.info("존재하는 ");
			 return "wrongUid";
		 }
		 
		 return "success";
	}


}
