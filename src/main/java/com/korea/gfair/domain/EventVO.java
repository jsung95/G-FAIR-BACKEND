package com.korea.gfair.domain;

import java.util.Date;

import lombok.Value;

@Value
public class EventVO {
	private Integer bno;
	private Integer repRoot;
	private Integer repStep;
	private Integer repIndent;
	private String title;
	private String content;
	private String memberID;
	private Date insert_ts;
	private Date update_ts;
	private Integer readcnt;
	private String bName;
	private Integer fid;
	private String del_tf;
	private String notice_tf;
	private String public_tf;
	private String reply_tf;
	
}//end class
