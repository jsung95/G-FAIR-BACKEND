package com.korea.gfair.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.myapp.domain.PreApplicationDTO;

public interface PreApplicationMapper {
	
	public abstract int insert(@Param("dto") PreApplicationDTO dto);
	
}//end interface
