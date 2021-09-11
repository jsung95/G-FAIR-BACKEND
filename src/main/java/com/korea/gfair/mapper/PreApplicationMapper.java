package com.korea.gfair.mapper;

import org.apache.ibatis.annotations.Param;
import com.korea.gfair.domain.PreApplicationDTO;

public interface PreApplicationMapper {
	
	public abstract int insert(@Param("dto") PreApplicationDTO dto);
	
}//end interface
