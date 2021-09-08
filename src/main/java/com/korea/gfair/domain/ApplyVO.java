package com.korea.gfair.domain;

import lombok.Value;

@Value
public class ApplyVO {

	private Integer applyno;
	private Long cbno;
	private Integer fid;
	
	private String 	applycompany;
	private String	phone;
	private String 	email;
	private String	memberid;
	
	private String	payment_tf;
	private	String 	agrstate_tf;
	
	private	String	applyname;
	
	private	Integer pno;
	private	Integer	btno;
}//end class
