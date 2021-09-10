package com.korea.gfair.persistence;

import java.util.List;

import com.korea.gfair.domain.Criteria;
import com.korea.gfair.domain.ExhibitionDTO;
import com.korea.gfair.domain.ExhibitionVO;


public interface ExhibitionDAO {

	public abstract List<ExhibitionVO> visitList() throws Exception;
	public abstract List<ExhibitionVO> exPagingList(Criteria cri) throws Exception;
	public abstract ExhibitionVO schedule(Integer exno) throws Exception;
	
	public abstract void insert(ExhibitionDTO exDTO) throws Exception;
	public abstract void update(ExhibitionDTO exDTO) throws Exception;
	public abstract void delete(List<Integer> exnoList) throws Exception;
	
	public abstract Integer totalCount(Criteria cri) throws Exception;
}//end interface
