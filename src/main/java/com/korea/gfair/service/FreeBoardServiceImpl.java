package com.korea.gfair.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.korea.gfair.domain.BoardVO;
import com.korea.gfair.domain.Criteria;
import com.korea.gfair.mapper.FreeBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	



	@Setter(onMethod_= @Autowired)
	private FreeBoardMapper mapper;
	
	@Override
	public List<BoardVO> list() {
		log.debug("getList() invoked.");
		
		List<BoardVO> list = mapper.selectList();
		
		return list;
	}//getList
	
	@Override
	public List<BoardVO> getListPerPage(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		Objects.requireNonNull(mapper);
		
		return mapper.getListWithPaging(cri);
	}//getListPerPage
	
	
	@Override
	public int getTotal(Criteria cri) {
		log.debug("getListPerPage({}) invoked.",cri);
		
		Objects.requireNonNull(mapper);
		
		return mapper.getTotalCount(cri);
		
	}//getTotal
	
	@Override
	public BoardVO read(Integer bno) {
		log.debug("read() invoked.");
		
		readcnt(bno);
		BoardVO read = mapper.read(bno);
		
		return read;

	}//readcnt

	@Override
	public boolean write(BoardVO vo) {

		log.debug("write() invoked.");
		
		boolean write = mapper.write(vo);
		
		if(write) {
			return true;
		}else {
			return false;
		}//if-else
		
	}//write

	@Override
	public boolean modify(BoardVO vo) {
		
		log.debug("modify() invoked.");
		
		boolean modify = mapper.modify(vo);
		
		return modify;
		
	}//modify

	@Override
	public boolean remove(Integer bno) {

		log.debug("remove() invoked.");
		
		boolean remove = mapper.delete(bno);
		
		if(remove) {
			return true;
		}else {
			return false;
		}//if-else
		
	}//remove

	@Override
	public void readcnt(Integer bno) {
		
		log.debug("readcnt() invoked.");
		
		mapper.readcnt(bno);
		
		
	}//readcnt


	
	
}//end class
