package com.korea.gfair.domain;

import lombok.Data;

@Data
public class BoardDTO {

	private Integer bno;
	private Integer reproot;
	private Integer repstep;
	private Integer repindent;
	
	private String title;
	private String content;
	private String memberid;
	private String bname;
	
	private Integer readcnt;
	private Integer fid;
	
	private String notice_tf;
	private String public_tf;
	private String reply_tf;
	
	
}//end class
