package com.korea.gfair.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korea.gfair.domain.ApplyDTO;
import com.korea.gfair.domain.ApplyVO;
import com.korea.gfair.domain.BoothVO;
import com.korea.gfair.domain.ExhibitionVO;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.domain.MemberVO;
import com.korea.gfair.domain.PaymentVO;
import com.korea.gfair.service.ApplyService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/apply/")
@Controller
public class ApplyController {
	
	@Autowired
	ApplyService service;
	
	@GetMapping("app")
	public void appui() {
		log.debug("app() invoked.");
		
	}//appui
	
	@PostMapping("appform")
	public void applyFormUi(HttpServletRequest req, Model model) throws Exception {
		log.debug("applyForm() invoked.");
		
//		1. session에 올라간 회원 id 를 이용해 CBNO, FID, PHONE, EMAIL, MEMBERID 가져옴
		HttpSession session = req.getSession();
		MemberDTO memberDto =(MemberDTO)session.getAttribute("__LOGIN__");
		//sevice 메소드 호출
		MemberVO member= this.service.getMemberInfo(memberDto);
		
//	 	2. APPLYNAME 이름으로 EXNAME 가져옴 - select 박스 
		List<ExhibitionVO> exhibition =this.service.getExhibitionInfo();
		
//		3. 부스 리스트 가져옴 
		List<BoothVO> booths=this.service.getBoothList();
		
//		4. model에 올리기. 
		
		model.addAttribute("__EXHI__", exhibition);
		model.addAttribute("__MEMBERINFO__", member);
		model.addAttribute("__BOOTH__",booths);

	}//applyForm
	
	@PostMapping("applyform")
	public String applyForm(ApplyDTO dto, RedirectAttributes attrs) throws Exception {
		log.debug("applyForm({}) invoked.", dto);
		
		//0. 동일 전시회에 신청 이력이 있는지 검사. 
		
		//전시회 신청한 아이디로 MemberDTO객체 생성
		MemberDTO memberDto = new MemberDTO();
		memberDto.setMemberid(dto.getMemberid());
		
		//아이디로 전시회 신청 정보 있는지 확인. 
		List<ApplyVO> applyInfo =this.service.getApplyInfo(memberDto);
		
		//신청한 전시회가 새롭게 신청한 전시회와 같은지 확인. 
		if(applyInfo.get(0).getApplyname().equals(dto.getApplyname())) {
			attrs.addFlashAttribute("__RESULT__","신청 내역이 이미 존재합니다.");
			return "redirect:/apply/applystatus";
		}//if
		
		//1. 부스 상태 업데이트하기. 
		boolean isSelected = this.service.boothIsSelected(dto);
		if(!isSelected) {//만약 업데이트 실패했다면
			attrs.addFlashAttribute("__RESULT__","이미 선택된 부스입니다. ");
			return "redirect:/apply/appform";
		}
		//2. 참가신청 서비스 호출. 
		boolean result =this.service.applyExhibition(dto);
		if(!result) {	//만약 신청 실패했다면.
			
			attrs.addFlashAttribute("__RESULT__","요청을 처리하는 도중 문제가 발생하였습니다.");
			return "redirect:/apply/appform";
		}else {
			attrs.addFlashAttribute("__RESULT__","신청이 완료되었습니다.");
			return "redirect:/apply/applystatus";
		}//if-else
		
	}//applyForm
	
	@SuppressWarnings("unused")
	@GetMapping("applystatus")
	public void applyStatus(Model model, HttpServletRequest req) throws Exception {
		log.debug("applyStatus() invoked.");
		
		HttpSession session = req.getSession();
		MemberDTO memberDto =(MemberDTO)session.getAttribute("__LOGIN__");
		
		//1. Apply info 가져오기 
		List<ApplyVO> applyInfo =this.service.getApplyInfo(memberDto);
		
		//2. Payment info 가져오기 
		int applyno=applyInfo.get(0).getApplyno();
		PaymentVO paymentInfo=this.service.getPaymentInfo(applyno);
		
		if(applyInfo != null) {
			model.addAttribute("__APPLY__",applyInfo);
			model.addAttribute("__PAYMENT__", paymentInfo);
		}else{
			model.addAttribute("__RESULT__", "신청정보가 없습니다.");
		}//if-else
		
	}//applyStatus
	
	//=== 진성 - 전시장 배치도 페이지 매핑 === 	
	@GetMapping("map")
	public void map() {
		
	}
	
	
}//end class
