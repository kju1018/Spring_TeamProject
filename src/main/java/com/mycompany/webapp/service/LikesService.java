package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dto.Likes;

@Service
public class LikesService {
	@Autowired
	private Likes likes;
	
}
