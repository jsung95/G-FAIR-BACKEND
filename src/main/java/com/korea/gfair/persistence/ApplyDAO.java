package com.korea.gfair.persistence;

import java.util.List;

import com.korea.gfair.domain.ApplyDTO;
import com.korea.gfair.domain.ApplyVO;
import com.korea.gfair.domain.BoothVO;
import com.korea.gfair.domain.ExhibitionVO;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.domain.MemberVO;
import com.korea.gfair.domain.PaymentVO;

public interface ApplyDAO {
	
	public MemberVO selectMemberInfo(MemberDTO dto) throws Exception;
	public List<BoothVO> selectBooth () throws Exception;
	public boolean insert(ApplyDTO dto) throws Exception;
	public boolean updateBooth(ApplyDTO dto) throws Exception;
	public List<ApplyVO> selectApplyInfo(MemberDTO dto) throws Exception;
	public List<ExhibitionVO> selectExhibition() throws Exception;
	public PaymentVO selectPaymentInfo(Integer applyno) throws Exception; 
	
}//end interface
