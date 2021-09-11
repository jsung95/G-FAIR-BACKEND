package com.korea.gfair.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import com.korea.gfair.domain.Criteria;
import com.korea.gfair.domain.PhotoDTO;
import com.korea.gfair.domain.PhotoVO;
import com.korea.gfair.domain.PhotoVO2;
import com.korea.gfair.mapper.PhotoBoardMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;


@Log4j2
@NoArgsConstructor

@Service
public class PhotoBoardServiceImpl 
	implements PhotoBoardService{
	
	@Setter(onMethod_= {@Autowired})
	private PhotoBoardMapper mapper;
	
	//=========================== 1. getList ==========================//
	@Override
	public List<PhotoVO2> getList() {
		log.debug("getList() invoked.");
		
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getList();
		
	}//getList()

	
	
	//=========================== 2. getListPerPage ==========================//
	@Override
	public List<PhotoVO2> getListPerPage(Criteria cri) {
		log.debug("getListPerPage(cri) invoked.");
		log.info("\t+ cri: " + cri);
		
		return this.mapper.getListWithPaging(cri);
		
	}//getListPerPage()

	
	
	//=========================== 3. register ==========================//
	@Override
	public boolean register(MultipartFile uploadFile) {
		log.debug("register() invoked.");
		log.info("\t+ uploadFile: " + uploadFile);
		
		String uploadFolder = 
				"D:/opt/eclipse/workspace/JEE/aphotogallery2/src/main/webapp/resources/img";
		
		//오늘날짜를 문자열로 반환하는 getFolder()메소드를 호출하고 반환된 문자열"yyyy/MM/dd/"을 detailFolderPath에 저장
		String detailFolderPath = getFolder();
		log.info("\t+ detailFolderPath: " + detailFolderPath);
		
		
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
		
		//UUID 생성
		UUID uuid = UUID.randomUUID();
		log.info("\t+ uuid: " + uuid);
		
		//uuid_파일명
		String freName = uuid.toString() + "_" + forName;
		log.info("\t+ uuid + orginal파일명: " + freName);
		
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
		
		PhotoDTO dto = new PhotoDTO();
		
		dto.setForname(forName);
		dto.setFpath(detailFolderPath);
		dto.setFrename(freName);
		return this.mapper.insert(dto) == 1;
		
	}//register()

	
	
	//=========================== 4. modify ==========================//
	@Override
	public boolean modify(PhotoDTO updateFile) {
		log.debug("modify() invoked.");
		log.info("\t+ updateFile: " + updateFile);
		
		
		return (this.mapper.update(updateFile)) == 1;
		
	}//modify()

	
	
	//=========================== 5. remove ==========================//
	@Override
	public boolean remove(Integer fid) {
		log.debug("remove() invoked.");
		log.info("\t+ fid: " + fid);
		
		
		return (this.mapper.delete(fid)) == 1;
		
	}//remove()

	
	
	//=========================== 6. get ==========================//
	@Override
	public PhotoVO read(Integer fid) {
		log.debug("get() invoked.");
		log.info("\t+ fid: " + fid);
		
		return this.mapper.read(fid);
		
	}//get()

	
	
	//=========================== 7. getTotal ==========================//
	@Override
	public int getTotal(Criteria cri) {
		log.debug("getTotal() invoked.");
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
		
	}//getFolder()
	
	
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



	//JUnit 테스트용
//	@Override
//	public boolean register(PhotoDTO uploadFile) {
//		this.mapper.insert(uploadFile);
//		return false;
//	}//register()
	
	
}//end class
