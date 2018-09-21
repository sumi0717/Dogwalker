package com.dog.walker.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dao.ManageDao;
import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.petwalker.dao.PetwalkerDao;
import com.dog.walker.petwalker.dto.PetwalkerDto;
import com.dog.walker.search.dao.SearchDao;
import com.dog.walker.search.dto.SearchDto;
import com.dog.walker.search.dto.StarDto;



@Service
public class SearchServiceImpl implements SearchService{

   @Autowired
   private PetwalkerDao petwalkerdao;
   
   @Autowired
   private SearchDao searchdao;
   
   @Autowired
   private ManageDao managedao;

   @Override
   public void getAllInfo(String input_address, ModelAndView mView) {
	   List<SearchDto> searchList = searchdao.getList(input_address);//select 한 결과
	   List<StarDto> starList = searchdao.getStarList(input_address);//nickname과 star평균 들어감
	   
	   mView.addObject("searchList", searchList);
	   mView.addObject("starList",starList);
   }
   
   
   @Override
   public void getWalkerTotal(String input_address, ModelAndView mView) {
      int num = petwalkerdao.getCount(input_address);
      mView.addObject("TotalNum",num);
   }

   
   @Override
   public void findPetWalker(String input_address, ModelAndView mView) {
      List<PetwalkerDto> findWalker = petwalkerdao.getList(input_address);
      mView.addObject("findWalker",findWalker);
   }

	@Override
	public void getProfile(String input_address, ModelAndView mView) {
		List<ManageDto> profileWalker = managedao.getList(input_address);//이게 디테일 사진 
		mView.addObject("profileWalker",profileWalker);
	}
	
	
	/*@Override
	public void finalresult(String input_address, ModelAndView mView) {
		
		//List<ManageDto> starList = new ArrayList<>();
		for(int i = 0;i<starList.size();i++) {

			List<ManageDto> starList = managedao.getStarsList(input_address);
			List<ManageDto> filePathList = managedao.getFilePath(input_address);
			//List<plzDto> plzDto = managedao.
			//INSERT INTO plz_table () VALUES ()
			
		}
		
	}*/
	
	
	@Override
	public void getStars(String input_address,ModelAndView mView) {
		
		//List<ManageDto> star_avg = managedao.getStarsList(input_address);
		
		/*ManageDto newDto = new ManageDto();
		newDto.setNickname();*/
		
		//mView.addObject("star_avg",star_avg);
		
		
	}
	
}
