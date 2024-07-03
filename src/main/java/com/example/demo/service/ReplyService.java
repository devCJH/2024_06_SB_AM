package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;
import com.example.demo.vo.Reply;

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

	public List<Reply> getReplies(String relTypeCode, int relId) {
		return this.replyDao.getReplies(relTypeCode, relId);
	}

	public void deleteReply(int id) {
		this.replyDao.deleteReply(id);
	}

	public Reply getReplyById(int id) {
		return this.replyDao.getReplyById(id);
	}

	public void modifyReply(int id, String body) {
		this.replyDao.modifyReply(id, body);
	}
}
