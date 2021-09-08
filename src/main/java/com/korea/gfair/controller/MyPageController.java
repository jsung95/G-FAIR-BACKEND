package com.korea.gfair.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.korea.gfair.domain.BoardReplyJoinVO;
import com.korea.gfair.domain.Criteria;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.domain.PageDTO;
import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.service.MyPageService;
import com.korea.gfair.util.ApiCaptchaImage;
import com.korea.gfair.util.ApiCaptchaNkey;
import com.korea.gfair.util.ApiCaptchaNkeyResult;
import com.korea.gfair.util.Captcha;
import com.korea.gfair.util.UUIDGenerator;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@RequestMapping("/mypage/")
@Controller
public class MyPageController {

	@Setter(onMethod_=@Autowired)
	MyPageService service;
	
	@Autowired
	private JavaMailSender mailSender;
//	---------------------------------------------------------------
	@GetMapping("sample")
	public String sample(RedirectAttributes attrs,HttpServletRequest req) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		log.debug("sample() invoked.");
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberid("dani125");
		
		String pw  =UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest("12345");
		
		dto.setMemberpw(pw);
		
		HttpSession session =req.getSession();
		session.setAttribute("__LOGIN__", dto);
		
		return "redirect:/question/list";
	}//sample
	
//	----------------------------------------------------------------
	
	@PostMapping("captchaAuth")
	public ResponseEntity<String> captchaAuth(
			String key, String value
			) {
		log.debug("captchaAuth(key = {}, value= {}) controller invoked..! ",key, value);
		
		String result =ApiCaptchaNkeyResult.getResult(key, value);
		
		log.info("result : {}", result);
		
		ResponseEntity<String> response = new ResponseEntity<>(result, HttpStatus.OK);
		
		
		return response;
	}//captcha
	
	@GetMapping("captchaReload")
	public ResponseEntity<String> captchaReload(Model model) {
		log.debug("captchaReload() invoked");
		
		String key =ApiCaptchaNkey.captchaNkey();
		String imgPathAndName=ApiCaptchaImage.getImageRequest(key);
		
		
		model.addAttribute("__KEY__", key);
		model.addAttribute("__CAPTCHA_IMG__",imgPathAndName);
		
		Captcha cap = new Captcha();
		cap.setImgPathAndName(imgPathAndName);
		cap.setKey(key);
		
		Gson gson = new Gson();
		String json=gson.toJson(cap);
		
		ResponseEntity<String> response = new ResponseEntity<>(json, HttpStatus.OK);
		
		return response;
	}//captchaImg
	
	@GetMapping("modifypassword")
	public void modifyPasswordUI(Model model) throws InterruptedException {
		String key =ApiCaptchaNkey.captchaNkey();
		String imgPathAndName=ApiCaptchaImage.getImageRequest(key);
		
		
		model.addAttribute("__KEY__", key);
		model.addAttribute("__CAPTCHA_IMG__",imgPathAndName);
		
	}//end class
	
	@PostMapping("modifypassword")
	public String modifyPassword(
			RedirectAttributes attrs, 
			MemberDTO dto, 
			String newMemberpw,
			HttpServletRequest req
			) throws Exception {
		
		log.debug("modifyPassword({},{}) invoked.", dto, newMemberpw);

		//기존의 비밀번호 암호화해서 dto에 저장. 
		String currentPassword =UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest(dto.getMemberpw());
		dto.setMemberpw(currentPassword);
		
		HttpSession session =req.getSession();
		MemberDTO sessionDto =(MemberDTO)session.getAttribute("__LOGIN__");
		
		log.info("parameter dto password : {}",dto.getMemberpw());
		log.info("session dto password : {}", sessionDto.getMemberpw());
		
		
		//입력한 기존비밀번호와 세션영역에 올라온 비밀번호가 일치했을때 
		if(sessionDto.getMemberpw().equals(dto.getMemberpw())) {
			
			
			//1. 새 비밀번호 암호화 
			String encodedNewPassword =
			UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest(newMemberpw);
			//2. 새 비밀번호로 sessiondto에 set
			sessionDto.setMemberpw(encodedNewPassword);
			//3. 서비스 메소드 호출 
			boolean result=this.service.modifyPassword(sessionDto);
			
				if(result) {	//업데이트 성공시 
					attrs.addFlashAttribute("__RESULT__", "비밀번호 변경 성공");
					
					return "redirect:/login/login";
				}else {			//업데이트 실패시. 
					attrs.addFlashAttribute("__RESULT__",
							"요청을 처리하는 도중 문제가 발생하였습니다. 지속적으로 이러한 현상이 반복될 경우 관리자에게 문의하세요.");
					
					return "redirect:/mypage/modifypassword";
				}//if-else
			
			
		}else {//입력한 기존 비밀번호가 틀렸을 때. 
			attrs.addFlashAttribute("__RESULT__", "잘못된 접근입니다. ");
			return "redirect:/mypage/modifypassword";
		} //if else
		
	}//modifyPassword
	
	@GetMapping({"dropauth"})
	public void dropAuth() {	//회원 탈퇴메뉴 눌렀을때 화면. 
		log.debug("dropauth() invoked.");
		
	}//dropAuth
	
	@PostMapping({"drop"})
	public void passAuth(MemberDTO dto, HttpServletRequest req,Model model ) 
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		log.debug("passAuth({}) invoked.", dto);
		
		String currentPassword =UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest(dto.getMemberpw());
		dto.setMemberpw(currentPassword);
		
		HttpSession session =req.getSession();
		MemberDTO sessionDto =(MemberDTO)session.getAttribute("__LOGIN__");
		
		if(!sessionDto.getMemberpw().equals(dto.getMemberpw())) {	//만약 기존 비밀번호 틀릴경우
			model.addAttribute("__RESULT__","false");
		}//if
		
		
	}//passAuth
	
	
	@GetMapping("sendemail")
	public ResponseEntity<String> emailCode(HttpServletRequest req) throws Exception {
		log.debug("emailCode(req) invoked.");
		HttpSession session =req.getSession();
		
		MemberDTO dto = (MemberDTO)session.getAttribute("__LOGIN__");
		//------------------------------------------------------------------		
		//1. session에 올라간 dto이용해 email 가져오기 
		//------------------------------------------------------------------		
		String toEmail =this.service.getEmail(dto);
		//------------------------------------------------------------------		
		//2. email 발송
		//------------------------------------------------------------------
		log.debug("send() invoked.");

		Random random = new Random();
        int code = random.nextInt(888888) + 111111;
		
		String subject 	="Mail send test";
		String content 	="G-FAIR 인증 메일<br> <strong>인증 코드: </strong>"+code;
		 
		String from   	="gfairkor@gmail.com";
//		String to		="daninoel125@gmail.com";
		
		try {
			
			MimeMessage mail = this.mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			
			mailHelper.setFrom(from);
			mailHelper.setTo(toEmail);
			mailHelper.setSubject(subject);
			mailHelper.setText(content,true);
			
			this.mailSender.send(mail);	//메일 보내기 
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}//try-catch
		
		
		
		
		//"{\"result\" : \"true\"}"
		ResponseEntity<String> response = new ResponseEntity<>("{\"result\" :\""+code+"\"}", HttpStatus.OK);
		return response;
	}//emailCode
	
	
	@PostMapping("beforefire")
	public void beforefire() {
		log.debug("beforefire () invoked.");
	}//beforefire
	
	@PostMapping("fire")
	public String fire(HttpServletRequest req,RedirectAttributes attrs) throws Exception {
		log.debug("fire() invoked.");
		
		HttpSession session =req.getSession();
		
		MemberDTO dto = (MemberDTO)session.getAttribute("__LOGIN__");
		
		boolean result = this.service.fireMember(dto);
		
		if(result) {
			session.invalidate();
			return "/mypage/fired";
		}else {
			attrs.addAttribute("__RESULT__","요청을 처리하는 도중 문제가 발생하였습니다.");
			return "redirect:/mypage/beforefire";
		}//if-else
		
	}//fire
	
	@GetMapping("replymanage")
	public void replyManage(HttpServletRequest req,@ModelAttribute("cri") Criteria cri,Model model) throws Exception{
		log.debug("replyManage(req,{},model) invoked.",cri);
		
		HttpSession session =req.getSession();
		
		MemberDTO dto = (MemberDTO)session.getAttribute("__LOGIN__");
		
		PageDTO pageDTO = new PageDTO(cri,this.service.getReplyTotalCount(cri,dto));
		
		List<BoardReplyJoinVO> replyList =this.service.getReplyList(cri,dto);
		
		model.addAttribute("__REPLY__", replyList);
		model.addAttribute("__PAGE__",pageDTO);
	}//replyManage
	
	@PostMapping("replydelete")
	public String replyDelete(RedirectAttributes attrs, @RequestParam("reno") List<Integer> renoList) 
			throws Exception {
		log.debug("replyDelete({},{}) invoked.", attrs, renoList);
		
		log.info("reno list : {}", renoList.toString());
		log.info("reno length : {}",renoList.size());
		
		boolean result =this.service.removeReply(renoList);
		
		if(result) {
			attrs.addFlashAttribute("__RESULT__","성공적으로 삭제하였습니다.");
		}else {
			attrs.addFlashAttribute("__RESULT__","요청을 처리하는 도중 문제가 발생하였습니다. 다시 시도해주세요.");
		}//if-else
		
		return "redirect:/mypage/replymanage";
	}//replyDelete
	
}//end class
