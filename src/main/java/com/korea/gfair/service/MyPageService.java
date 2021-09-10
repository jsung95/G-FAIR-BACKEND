package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.BoardReplyJoinVO;
import com.korea.gfair.domain.Criteria;
import com.korea.gfair.domain.MemberDTO;

public interface MyPageService {

	public boolean modifyPassword(MemberDTO dto) throws Exception;
	public String getEmail(MemberDTO dto) throws Exception;
	public boolean fireMember(MemberDTO dto) throws Exception;
	public List<BoardReplyJoinVO> getReplyList (Criteria cri,MemberDTO dto) throws Exception;
	public int getReplyTotalCount(Criteria cri, MemberDTO dto) throws Exception;
	public boolean removeReply(List<Integer> renoList) throws Exception;
}//end interface
