package com.korea.gfair.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReplyPageDTO {

	
	private List<ReplyVO> list;
	private int replyCnt;
	
}//end class
