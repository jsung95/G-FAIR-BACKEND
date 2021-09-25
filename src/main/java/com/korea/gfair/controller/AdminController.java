package com.korea.gfair.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korea.gfair.domain.ApplyVO;
import com.korea.gfair.domain.MemberVO;
import com.korea.gfair.service.AdminService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/admin/")
@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
//	뷰 역할만 하는 Mapping
	@GetMapping({"adminPage"})
	public void view() {
		
	}//view
	
	@GetMapping("apply")
	public void apply(Model model) throws Exception {
		log.debug("apply() invoked.");
		
		List<ApplyVO> applyList =this.service.getApplyInformation();
		
		model.addAttribute("__APPLY__", applyList);
	}//apply
	
	@PostMapping("applyUpdateAgree")
	public String applyUpdateAgree(@RequestParam("applyno") List<Integer> applynoList) throws Exception {
		log.debug("applyUpdateAgree({}) invoked.",applynoList);
		
		this.service.modifyApplyStatus(applynoList);
		this.service.registerPaymentInfo(applynoList);
		this.service.modifyApplyPno(applynoList);
		
		return "redirect:/admin/apply";
	}//applyUpdateAgree
	
	@PostMapping("applyUpdatePayment")
	public String applyUpdatePayment(@RequestParam("applyno") List<Integer> applyno,RedirectAttributes attrs) throws Exception {
		
		boolean isSucceed =this.service.modifyPaymentStatusAndApplyPaymentTF(applyno);
		
		if(!isSucceed) {
			attrs.addFlashAttribute("__RESULT__", "결제상태 업데이트에 실패하였습니다.");
		}//if
		
		return "redirect:/admin/apply";
	}//applyUpdatePayment
	
	//이진성 - 관리자페이지 > 회원관리
	@GetMapping("memberList")
	public void memberList(Model model) {
		
		List<MemberVO> members = this.service.getMemberList();
		
		model.addAttribute("members", members);
	}
	
	
	
	
	@PostMapping("delMember")
	public String delMember(@RequestParam("mno")List<Integer> mnoList) {
		log.info("mno List : {}", mnoList);
		
		this.service.delMember(mnoList);
		
		return "redirect:/admin/memberList";
		
	}
	
	
	
}//end class
