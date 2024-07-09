package com.example.demo.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.vo.Member;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	private JavaMailSender javaMailSender;
	
	public MemberService(MemberDao memberDao, JavaMailSender javaMailSender) {
		this.memberDao = memberDao;
		this.javaMailSender = javaMailSender;
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

	public Member getMemberByNameAndCellAndEmail(String name, String cellphoneNum, String email) {
		return this.memberDao.getMemberByNameAndCellAndEmail(name, cellphoneNum, email);
	}
	
	public void sendEmail(String to, String subject, String text) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        javaMailSender.send(message);
    }

    public void sendPasswordRecoveryEmail(Member member, String tempPassword) {
        String subject = "임시 패스워드 발송";
        String text = "<html>"
                    + "<body>"
                    + "<h3>임시 패스워드 : " + tempPassword + "</h3>"
                    + "<a style='display:inline-block;padding:10px;border-radius:10px;border:5px solid black;font-size:4rem;color:inherit;text-decoration:none;' href='http://localhost:8081/usr/member/login' target='_blank'>로그인 하러가기</a>"
                    + "</body>"
                    + "</html>";
        sendEmail(member.getEmail(), subject, text);
    }
}
