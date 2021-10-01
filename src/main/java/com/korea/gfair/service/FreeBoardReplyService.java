package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.BoardDTO;
import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;

public interface FreeBoardReplyService {
	
	public abstract List<ReplyVO> readReply(ReplyDTO rdto);
	public abstract void writeReply(ReplyDTO rdto);
	

}//end interface
