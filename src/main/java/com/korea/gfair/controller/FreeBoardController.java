package com.korea.gfair.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.korea.gfair.domain.BoardVO;
import com.korea.gfair.domain.Criteria;
import com.korea.gfair.domain.PageDTO;
import com.korea.gfair.service.FreeBoardService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/free/")
@Controller
public class FreeBoardController {
	
	@Setter(onMethod_=@Autowired)
	public FreeBoardService service;
	
	@GetMapping("list")
	public void list(Model model) {
		
		List<BoardVO> list = service.list();
		
		model.addAttribute("__LIST__",list);
		
	}//list
	
	
	@GetMapping("listPerPage")
	public String listPerPage(@ModelAttribute("cri") Criteria cri, Model model) {
		
		List<BoardVO> boards = service.getListPerPage(cri);
		
		Objects.requireNonNull(boards);
		
		boards.forEach(log::info);
		
		PageDTO pageDTO= new PageDTO(cri,service.getTotal(cri));
		
		model.addAttribute("__LIST__",boards);
		model.addAttribute("pageMaker",pageDTO);
		
		
		return "free/list";
		
	}//listPerPage
	
	@GetMapping({"read","modify"})
	public void read(@RequestParam("bno") Integer bno, Model model) {
		
		BoardVO read = service.read(bno);
		
		Objects.requireNonNull(read);
		
		model.addAttribute("__READ__",read);
	}//read
	
	
	@PostMapping("modify")
	public String modify(BoardVO vo) {
		
		service.modify(vo);
		
		return "redirect:/free/listPerPage";
	}//modify
	
	
	@GetMapping("write")
	public void write() {
		
		
	}//write
	
	@PostMapping("write")
	public String write(BoardVO vo) {
		boolean write = service.write(vo);
		
		Objects.requireNonNull(write);
		
		return "redirect:/free/listPerPage";
		
	}//write
	
	@PostMapping("remove")
	public String remove(@RequestParam("bno")Integer bno) {
		
		service.remove(bno);
		
		return "redirect:/free/listPerPage";
	}//remove
	
	
	
	

}//end class
