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
	/// 회원가입 시 회원추가
	public void join(User user) {
	
		user.setUjoindate(new Date());
		user.setUexit(0);
		user.setUauthority(0);
		
		usersDao.userInsert(user);
	}
	/// 아이디가 존재하는지 아닌지 여부를 확인하기 위한 절차
	public String duplicateId(User user) {
		User dbUser=usersDao.selectbyUserid(user.getUserid());
		logger.info(user.getUserid());
		 if(dbUser != null) {
			 return "wrongUid";
		 }		 
		 return "success";
	}
	
	public String loginProcess(User user) {
		User dbUser=usersDao.selectbyUserid(user.getUserid());
		 if(!user.getUpassword().equals(dbUser.getUpassword()) || dbUser == null) {
				 return "fail";
		}
		 
		 return "success";
	}


}
