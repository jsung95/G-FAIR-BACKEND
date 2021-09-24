package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.ApplyVO;
import com.korea.gfair.domain.MemberVO;

public interface AdminService {
	public List<ApplyVO> getApplyInformation () throws Exception;
	public boolean modifyApplyStatus(List<Integer> applynoList) throws Exception;
	public boolean registerPaymentInfo(List<Integer> applynoList) throws Exception;
	public boolean modifyApplyPno(List<Integer> applynoList) throws Exception;
	public boolean modifyPaymentStatusAndApplyPaymentTF(List<Integer> applynoList) throws Exception;

	//이진성 - 관리자페이지 > 회원관리
	public List<MemberVO> getMemberList(String membertype);
}//end interface
