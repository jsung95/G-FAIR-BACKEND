package com.korea.gfair.mapper;

import java.util.List;

import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;

public interface FreeBoardReplyMapper {
	
	public abstract List<ReplyVO> selectReply(ReplyDTO rdto);
	public abstract void insertReply(ReplyDTO dto);

}
