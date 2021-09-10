package com.korea.gfair.persistence;

import java.util.List;

import com.korea.gfair.domain.ApplyVO;

public interface AdminDAO {
	public List<ApplyVO> selectApply() throws Exception;
	public boolean updateApplyAgreeStatus(List<Integer> applynoList) throws Exception;
	public boolean insertPayment(List<Integer> applynoList) throws Exception;
	public boolean updateApplyPno(List<Integer> applynoList) throws Exception;
	public boolean updatePaymentStatus(List<Integer> applynoList) throws Exception;
	public boolean updateApplyPaymentTF(List<Integer> applynoList) throws Exception;
}//end interface
