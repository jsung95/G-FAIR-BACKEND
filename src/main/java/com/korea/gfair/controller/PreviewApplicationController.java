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
import com.korea.gfair.domain.ExhibitionVO;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.domain.MemberVO;
import com.korea.gfair.domain.PreApplicationDTO;
import com.korea.gfair.service.ExhibitionService;
import com.korea.gfair.service.MemberService;
import com.korea.gfair.service.PreApplicationService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2


@Controller
@RequestMapping("/pre/")
public class PreviewApplicationController {
	
	
	//Service 주입
	@Setter(onMethod_= {@Autowired})
	private PreApplicationService preAppService;
	
	@Setter(onMethod_= {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_= {@Autowired})
	private ExhibitionService exhibitionService;
	
	
	@GetMapping("sample")
	public String sample(RedirectAttributes rttrs, HttpServletRequest req) {
		log.debug("sample(rttrs, req) invoked.");
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberid("dannywon91");
		dto.setMemberpw("dnsjtmdeo1234");
		
		HttpSession session = req.getSession();
		session.setAttribute("__LOGIN__", dto);
		
		return "redirect:/event/listPerPage";
	}//sample()
	
	
	@GetMapping("register")
	public void registerui(MemberVO memberVO, Model model) {
		log.debug("registerui(memberVO, model) invoked.");
		log.info("\t+ memberVO: {}",  memberVO);
		
		List<ExhibitionVO> lists = this.exhibitionService.getList();
		//memberVO = this.memberService.get(1);
		
		
		model.addAttribute("__EXHI__", lists);
		//model.addAttribute("member", memberVO);
	}//registerui()
	
	
	
	@PostMapping("registerAction")
	public String registerAction(PreApplicationDTO applications, RedirectAttributes rttrs) {
		log.debug("register(applications, rttrs) invoked.");
		log.info("\t+ applications: {}", applications);
		
		this.preAppService.register(applications);
		
		return "redirect:/event/listPerPage";
	}//register()
	
}//end class
