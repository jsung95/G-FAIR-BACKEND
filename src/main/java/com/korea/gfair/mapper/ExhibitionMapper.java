package com.korea.gfair.mapper;

import java.util.List;

import org.zerock.myapp.domain.ExhibitionVO;

public interface ExhibitionMapper {
	public abstract ExhibitionVO get(Integer exno);
	
	public abstract List<ExhibitionVO> getList();
}//end class
