package com.korea.gfair.mapper;

import java.util.List;

import com.korea.gfair.domain.BoardVO;
import com.korea.gfair.domain.Criteria;

public interface FreeBoardMapper {
	
	public abstract List<BoardVO> selectList();		//전체 게시판 목록 조회
	public abstract List<BoardVO> getListWithPaging(Criteria cri);	//페이징 처리 된 게시판 목록조회
	
	public abstract BoardVO select(Integer bno);	//자세히 보기
	public abstract boolean insert(BoardVO vo);		//새로운 글 작성
	public abstract boolean update(BoardVO vo);		//글 수정하기
	public abstract boolean delete(Integer bno);	//특정 게시글 삭제
	public abstract void readcnt(Integer bno);		//조회수
	
	public abstract int getTotalCount(Criteria cri); //게시판 총 레코드 건수 얻기
	
}//end interface
