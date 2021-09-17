package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.BoardVO;
import com.korea.gfair.domain.Criteria;

public interface FreeBoardService {
	
	public abstract List<BoardVO> list();		//게시판 목록조회
	public abstract List<BoardVO> getListPerPage(Criteria cri); //한 페이지 분량만큼만 목록 조회
	
	public abstract BoardVO read(Integer bno);	//게시판 상세보기
	public abstract boolean write(BoardVO vo);	//게시글 작성하기
	public abstract boolean modify(BoardVO vo); //게시글 수정하기
	public abstract boolean remove(Integer bno);//게시글 삭제하기
	public abstract void readcnt(Integer bno);	//조회수
	
	public abstract int getTotal(Criteria cri);	//총 게시글 갯수를 조회하여 반환
}//end class
