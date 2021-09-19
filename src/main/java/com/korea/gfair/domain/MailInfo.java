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
		this.setFrom = "지페어<love8038@naver.com>";
		this.toMail = toMail;
		this.title = "이메일주소 변경 인증 이메일 입니다.";
		this.content = "<br><br>인증 번호는 "+number+"입니다. "
						+ "<br> 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	}//constructor
}//end class
