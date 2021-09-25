package com.korea.gfair.persistence;

import java.util.List;

import com.korea.gfair.domain.ApplyVO;
import com.korea.gfair.domain.MemberVO;

public interface AdminDAO {
	public List<ApplyVO> selectApply() throws Exception;
	public boolean updateApplyAgreeStatus(List<Integer> applynoList) throws Exception;
	public boolean insertPayment(List<Integer> applynoList) throws Exception;
	public boolean updateApplyPno(List<Integer> applynoList) throws Exception;
	public boolean updatePaymentStatus(List<Integer> applynoList) throws Exception;
	public boolean updateApplyPaymentTF(List<Integer> applynoList) throws Exception;
	
	//이진성 - 관리자페이지 > 회원관리
	public List<MemberVO> selectMemberList();
	public void dropMember(List<Integer> mnoList);
}//end interface
