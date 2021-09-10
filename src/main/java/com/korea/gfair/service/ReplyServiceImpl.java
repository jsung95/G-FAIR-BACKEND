package com.korea.gfair.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;
import com.korea.gfair.persistence.ReplyDAO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= @Autowired)
	ReplyDAO dao;
	
	@Override
	public List<ReplyVO> getReply(ReplyDTO dto) throws Exception {
		log.debug("getReply({}) invoked.", dto);
		
		List<ReplyVO> reply =this.dao.select(dto);
		
		return reply;
	}//getReply

	@Override
	public boolean registerReply(ReplyDTO dto) throws Exception {
		log.debug("registerReply({}) invoked.", dto);
		
		return this.dao.insert(dto);
	}//registerReply

	@Override
	public boolean removeReply(ReplyDTO dto) throws Exception {
		log.debug("removeReply({}) invoked.", dto);
		return this.dao.delete(dto);
	}//removeReply

}//end class
