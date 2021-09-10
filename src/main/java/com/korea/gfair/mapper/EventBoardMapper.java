package com.korea.gfair.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.EventDTO;
import org.zerock.myapp.domain.EventVO;

public interface EventBoardMapper {
	
	public abstract int insert(EventDTO dto);
	
	public abstract int insertSelectKey(@Param("dto")EventDTO dto);
	
	public abstract List<EventVO> getListWithPaging(Criteria cri);
	
	public abstract EventVO read(Integer bno);
	
	public abstract int update(EventDTO dto);
	
	public abstract int delete(Integer bno);
	
	public abstract int getTotalCount(Criteria cri);
	
	public abstract boolean readcnt(Integer bno);
}//end interface
