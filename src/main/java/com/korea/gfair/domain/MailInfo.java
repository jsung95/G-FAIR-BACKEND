package com.korea.gfair.domain;

import lombok.Getter;


@Getter
public class MailInfo {

	//6자리 랜덤수 생성(111111~999999)
	private String setFrom;
	private String toMail;
	private String title;
	private String content;
			
	
	public MailInfo(int number,String toMail) {
		this.setFrom = "지페어코리아<gfairkor@gmail.com>";
		this.toMail = toMail;
		this.title = "Gfair 회원가입 진행을 위해 요청하신 인증번호를 알려드립니다.";
		this.content = "<h1>지페어코리아 가입 하기위해 요청하신 인증번호를 알려드립니다.<br>"+number+" 입니다.</h1>"
						+ "<br> 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	}//constructor
}//end class
