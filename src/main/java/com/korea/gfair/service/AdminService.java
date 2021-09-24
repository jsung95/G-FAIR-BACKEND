package com.korea.gfair.service;

import java.util.List;

import com.korea.gfair.domain.ApplyVO;

public interface AdminService {
	public List<ApplyVO> getApplyInformation () throws Exception;
	public boolean modifyApplyStatus(List<Integer> applynoList) throws Exception;
	public boolean registerPaymentInfo(List<Integer> applynoList) throws Exception;
	public boolean modifyApplyPno(List<Integer> applynoList) throws Exception;
	public boolean modifyPaymentStatusAndApplyPaymentTF(List<Integer> applynoList) throws Exception;


}//end interface
