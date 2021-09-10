package com.korea.gfair.mapper;

import com.korea.gfair.domain.BoardSearchFileVO;
import com.korea.gfair.domain.UploadFileVO;



public interface UploadFileMapper {
	
	public abstract Integer insert(UploadFileVO fildVO);
	public abstract void delete(Integer fid);
	public abstract void modify(UploadFileVO fileVO);//첨부파일값 수정하기
	public abstract BoardSearchFileVO boardFile(Integer bno);
	//글번호로 첨부파일 찾기(게시글,첨부파일 게시판 조인)
	
	public abstract UploadFileVO fileByFid(Integer fid);//첨부파일 하나 찾기
	
	public abstract UploadFileVO fileByBno(Integer bno);
	
}//end interface
