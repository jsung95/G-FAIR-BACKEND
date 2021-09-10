package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> getReply(ReplyDTO dto) throws Exception;
	public boolean registerReply (ReplyDTO dto) throws Exception;
	public boolean removeReply(ReplyDTO dto) throws Exception;
	
}//end interface
