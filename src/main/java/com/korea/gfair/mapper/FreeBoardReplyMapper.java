package com.korea.gfair.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.korea.gfair.domain.BoardReplyCountVO;
import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;

public interface FreeBoardReplyMapper {
	
	public abstract List<ReplyVO> selectReply(ReplyDTO rdto);	//댓글 리스트 조회
	public abstract void insertReply(ReplyDTO dto);				//댓글 작성
	public abstract void updateReply(ReplyDTO dto);				//댓글 수정
	public abstract void deleteReply(ReplyDTO dto);				//댓글 삭제
	public abstract List<BoardReplyCountVO> countReply(@Param("bname")String bname);				//댓글 갯수
	
}
