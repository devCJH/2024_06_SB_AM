package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;

@Service
public class ReplyService {
	
	private ReplyDao replyDao;
	
	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	
	public void writeReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		this.replyDao.writeReply(loginedMemberId, relTypeCode, relId, body);
	}

	public int getLastInsertId() {
		return this.replyDao.getLastInsertId();
	}
}
