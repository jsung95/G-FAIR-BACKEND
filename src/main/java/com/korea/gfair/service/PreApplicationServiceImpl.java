package com.korea.gfair.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.myapp.domain.PreApplicationDTO;
import org.zerock.myapp.mapper.PreApplicationMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class PreApplicationServiceImpl implements PreApplicationService {
	
	@Setter(onMethod_= {@Autowired})
	private PreApplicationMapper mapper;
	
	@Override
	public boolean register(PreApplicationDTO dto) {
		log.debug("register(dto) invoked.");
		log.info("\t+ dto: {}", dto);
		
		Objects.requireNonNull(this.mapper);
		
		int affectedLines = this.mapper.insert(dto);
		
		return (affectedLines == 1) ? true : false;
		
	}//register()
	
}//end class