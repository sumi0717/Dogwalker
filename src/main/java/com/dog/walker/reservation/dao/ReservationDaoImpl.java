package com.dog.walker.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dog.walker.petusers.dto.PetusersDto;
import com.dog.walker.reservation.dto.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	   
	// 의존객체 DI
	@Autowired
	private SqlSession session;
	   

	@Override
	public void insert(ReservationDto dto) {
		session.insert("rsv.insert", dto);
		
	}

	@Override
	public List<ReservationDto> reservationgetList(ReservationDto dto) {
		return session.selectList("rsv.getList", dto);

	}
	
	@Override
	   public PetusersDto pUserGetData(String id) {
	      PetusersDto dto=session.selectOne("rsv.pUserGetData", id);
	      return dto;
	   }

	@Override
	public List<ReservationDto> reservationgetList2(ReservationDto dto) {
		return session.selectList("rsv.getList2", dto);
	}

	@Override
	public void rsvConfirm(int num) {
		session.update("rsv.rsvConfirm", num);
		
	}

	@Override
	public void rsvConfirmX(int num) {
		session.update("rsv.rsvConfirmX",num);
		
	}

}
