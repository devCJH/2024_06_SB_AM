package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.vo.Member;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void joinMember(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		this.memberDao.joinMember(loginId, loginPw, name, nickname, cellphoneNum, email);
	}
	
	public Member getMemberById(int id) {
		return this.memberDao.getMemberById(id);
	}

	public int getLastInsertId() {
		return this.memberDao.getLastInsertId();
	}

	public Member getMemberByLoginId(String loginId) {
		return this.memberDao.getMemberByLoginId(loginId);
	}

	public void memberModify(int loginedMemberId, String name, String nickname, String cellphoneNum, String email) {
		this.memberDao.memberModify(loginedMemberId, name, nickname, cellphoneNum, email);
	}

	public void doPasswordModify(int loginedMemberId, String loginPw) {
		this.memberDao.doPasswordModify(loginedMemberId, loginPw);
	}
}
