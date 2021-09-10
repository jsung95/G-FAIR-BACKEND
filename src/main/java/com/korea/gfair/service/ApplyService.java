package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.ApplyDTO;
import com.korea.gfair.domain.ApplyVO;
import com.korea.gfair.domain.BoothVO;
import com.korea.gfair.domain.ExhibitionVO;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.domain.MemberVO;
import com.korea.gfair.domain.PaymentVO;

public interface ApplyService {

	public MemberVO getMemberInfo(MemberDTO dto) throws Exception;
	public List<BoothVO> getBoothList() throws Exception;
	public boolean applyExhibition(ApplyDTO dto) throws Exception;
	public boolean boothIsSelected(ApplyDTO dto) throws Exception;
	public List<ApplyVO> getApplyInfo(MemberDTO dto) throws Exception;
	public List<ExhibitionVO> getExhibitionInfo() throws Exception;
	public PaymentVO getPaymentInfo(Integer applyno) throws Exception;

}//end interface
