package com.korea.gfair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;
import com.korea.gfair.mapper.FreeBoardReplyMapper;

@Service
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService {

	@Autowired
	public FreeBoardReplyMapper remapper;
	
	
	
	@Override
	public List<ReplyVO> readReply(ReplyDTO rdto) {
		
		return remapper.selectReply(rdto);
	} //readReply

	@Override
	public void writeReply(ReplyDTO rdto) {
		
		remapper.insertReply(rdto);
		
	}//writeReply
	
}//end class
