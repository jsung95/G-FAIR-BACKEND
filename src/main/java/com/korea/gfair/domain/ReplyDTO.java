package com.korea.gfair.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private Integer reno;
	private Integer bno;
	private String recontent;
	private String memberid;
	private Date redate;

	
}//end class
