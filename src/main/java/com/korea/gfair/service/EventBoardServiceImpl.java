package com.korea.gfair.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.EventDTO;
import org.zerock.myapp.domain.EventVO;
import org.zerock.myapp.domain.PhotoDTO;
import org.zerock.myapp.mapper.EventBoardMapper;
import org.zerock.myapp.mapper.PhotoBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;


@Log4j2
@NoArgsConstructor

@Service
public class EventBoardServiceImpl 
	implements EventBoardService{

	@Setter(onMethod_= {@Autowired})
	private EventBoardMapper mapper;

	@Setter(onMethod_= {@Autowired})
	private PhotoBoardMapper photoMapper;
	
	
	
	//=========================== 2. getListPerPage ==========================//
	@Override
	public List<EventVO> getListPerPage(Criteria cri) {
		log.debug("getListPerPage() invoked.");
		log.info("\t+ cri: " + cri);
		
		return this.mapper.getListWithPaging(cri);
		
	}//getListPerPage()
	
	
	
	
	//=========================== 3. register ==========================//
	@Override
	public boolean register(String path, EventDTO boardDTO, MultipartFile uploadFile) {
		log.debug("register(dto) invoked.");
		log.info("\t+ uploadFile: " + uploadFile);
		
		PhotoDTO photoDTO = new PhotoDTO();
		
		
		String uploadFolder =
				"D:/opt/eclipse/workspace/JEE/aphotogallery2/src/main/webapp/resources/"+path;
		//오늘날짜를 문자열로 반환하는 getFolder()메소드를 호출하고 반환된 문자열"yyyy/MM/dd/"을 detailFolderPath에 저장
		String detailFolderPath = getFolder();
		log.info("\t+ detailFolderPath: " + detailFolderPath);
		
		photoDTO.setFpath(detailFolderPath);
		
		
		//위 uploadFolder와 detailFolderPath을 +해서 uploadPath에 저장
		File uploadPath = new File(uploadFolder, detailFolderPath);
		log.info("\t+ uploadPath: " + uploadPath);
		
		//uploadPath에 해당폴더가 존재하지않으면 mkdir
		if(uploadPath.exists() == false) {
			log.info("mkdir!!!!!!!!!!!!!!!!!!!!!!!!!!");
			uploadPath.mkdirs();
		}//if
		
		log.info("----------------------------------------");
		log.info("Upload File Name: " + uploadFile.getOriginalFilename());
		log.info("Upload File Size: " + uploadFile.getSize());
		log.info("----------------------------------------");
		
		//original 파일명을 forName에 저장 
		String forName = uploadFile.getOriginalFilename();
		
		photoDTO.setForname(forName);
		
		//UUID 생성
		UUID uuid = UUID.randomUUID();
		log.info("\t+ uuid: " + uuid);
		
		//uuid_파일명
		String freName = uuid.toString() + "_" + forName;
		log.info("\t+ uuid + orginal파일명: " + freName);
		
		photoDTO.setFrename(freName);
		
		
		
		try {
			log.info("try!!!!!!!!!!!!!!!!!!");
			//"D:/opt/eclipse/workspace/JEE/aphotogallery/src/main/webapp/resources/img"+getFolder()에 
			File saveFile = new File(uploadPath, freName);

			log.info("try!!!!!!!!!!!!!!!!!!");
			
			//MultipartFile객체의 transferTo메소드를 사용해서 원하는 위치(saveFile)에 저장
			uploadFile.transferTo(saveFile);
			
			log.info("try!!!!!!!!!!!!!!!!!!");
			
			//만약 saveFile의 MIME type이 image이ㅁ
			if(checkImageType(saveFile)) {
				FileOutputStream thumbnail =
						new FileOutputStream(
								new File(uploadPath, "s_" + freName)
								);
				
				Thumbnailator.createThumbnail(
						uploadFile.getInputStream(),
						thumbnail, 100, 100
					);
				
				thumbnail.close();
				
			}//if		
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}//try-catch
		
		
//		dto.setForname(forName);
//		dto.setFpath(detailFolderPath);
//		dto.setFrename(freName);
			
		
		photoMapper.insertSelectKey(photoDTO);
		
		boardDTO.setFid(photoDTO.getFid());
		
		return this.mapper.insertSelectKey(boardDTO) == 1;
	}//register()
	
	
	
	
	//=========================== 6. get ==========================//
	@Override
	public EventVO get(Integer bno) {
		log.debug("get(bno) invoked.");
		log.info("\t+ bno: " + bno);
		
		
		
		return this.mapper.read(bno);
	}//get()
	
	
	
	
	//=========================== 4. modify ==========================//
	@Override
	public int modify(EventDTO dto) {
		log.debug("modify(bno) invoked.");
		
		return this.mapper.update(dto);
	}//modify()
	
	
	
	
	//=========================== 5. remove ==========================//
	@Override
	public boolean remove(Integer bno) {
		log.debug("remove(bno) invoked.");
		log.info("\t+ bno: " + bno);

		return this.mapper.delete(bno) == 1;
	}//remove()

	
	
	//=========================== 7. getTotal ==========================//
	@Override
	public int getTotal(Criteria cri) {
		log.debug("getTotal(cri) invoked.");
		log.info("\t+ cri: " + cri);

		return this.mapper.getTotalCount(cri);
	}//getTotal()
	
	
	
	//=========================== 8. getFolder ==========================//
	@Override
	public String getFolder() {
		log.debug("getFolder() invoked.");
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy/MM/dd/");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		log.info(str);
		
		return str;
		
	}

	
	
	//=========================== 9. checkImageType ==========================//
	@Override
	public boolean checkImageType(File file) {
		log.debug("checkImageType() invoked.");
		log.info("\t+ file: " + file);
		
		try {
			                     //파일의 확장자를 이용하여 마임타입을 판단함
			String contentType = Files.probeContentType(file.toPath());
			log.info("\t+ contentType : " + contentType);
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
			
		}//try-catch
		
		return false;
	}//checkImageType()

	
	
	//=========================== 10. getFile ==========================//
	@Override
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.debug("getFile(fileName: {}) invoked.", fileName);
		
		File file = new File("C:/temp/upload/temp/" + fileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add(
					"Content-Type",  
					Files.probeContentType(file.toPath()));
			
			result = 
					new ResponseEntity<>(
							FileCopyUtils.copyToByteArray(file), 
							header, 
							HttpStatus.OK
						);
			
		}catch(IOException e) {
			e.printStackTrace();
			
		}//try-catch
		
		return result;
		
	}//getFile()
	
	
	//=========================== 11. readCount ==========================//
	@Override
	public boolean readcnt(Integer bno) {
		log.debug("readcnt(bno) invoked.");
		log.info("\t+ bno: " + bno);

		return this.mapper.readcnt(bno);
	}//readCount

	
}//end class