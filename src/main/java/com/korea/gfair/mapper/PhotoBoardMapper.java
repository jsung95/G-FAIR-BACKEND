package com.korea.gfair.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.PhotoDTO;
import org.zerock.myapp.domain.PhotoVO;
import org.zerock.myapp.domain.PhotoVO2;

public interface PhotoBoardMapper {

	public abstract List<PhotoVO2> getList();
	
	public abstract List<PhotoVO2> getListWithPaging(Criteria cri);
	
	public abstract int insert(@Param("uploadFile")PhotoDTO uploadFile);
	
	public abstract int insertSelectKey(PhotoDTO uploadFile);
	
	public abstract PhotoVO read(Integer fid);
	
	public abstract int update(@Param("updateFile")PhotoDTO updateFile);

	public abstract int delete(Integer fid);
	
	public abstract int getTotalCount(Criteria cri);   // 게시판의 총 레코드 건수 얻기

}//end interface
