package com.dog.walker.manage.dao;

import java.util.List;

import com.dog.walker.manage.dto.ManageDto;

import com.dog.walker.petwalker.dto.PetwalkerDto;


public interface ManageDao {
   public int getCount(ManageDto dto);
   public void insert(ManageDto dto);
   public List<ManageDto> reviewgetList(ManageDto dto);

   public void profileinsert(ManageDto dto);
   public void profileupdate(ManageDto dto);
   public ManageDto getData2(String id);
   public ManageDto check(int num);
   
   public void reservationinsert(ManageDto dto);
   public List<ManageDto> reservegetList(ManageDto dto);
   public void update(ManageDto dto);
   public void delete(int num);
   public ManageDto getData(int num);
   public List<ManageDto> rgetList(ManageDto dto);
   public List<ManageDto> getList(String input_address);

   public ManageDto pwkGetData(String nickname);
   public ManageDto DgetData(ManageDto dto);
   public List<ManageDto> DtgetList(String nickname);

   public List<ManageDto> getStarsList(String input_address);
   public List<ManageDto> getFilePath(String input_address);
   
   public ManageDto rsvgetData(String id);
   
}

