package com.korea.gfair.service;

import java.io.File;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.EventDTO;
import org.zerock.myapp.domain.EventVO;

public interface EventBoardService {
	
	public abstract List<EventVO> getListPerPage(Criteria cri);
	
	public abstract boolean register(String path, EventDTO dto, MultipartFile uploadFile);
	
	public abstract EventVO get(Integer bno);
	
	public abstract int modify(EventDTO dto);
	
	public abstract boolean remove(Integer bno);
	
	public abstract int getTotal(Criteria cri);
	
	public abstract boolean checkImageType(File file);
	
	public abstract String getFolder();
	
	public abstract ResponseEntity<byte[]> getFile(String fileName);

	public abstract boolean readcnt(Integer bno);
}//end interface
