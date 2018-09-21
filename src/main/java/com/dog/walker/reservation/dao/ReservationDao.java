package com.dog.walker.reservation.dao;

import java.util.List;

import com.dog.walker.petusers.dto.PetusersDto;
import com.dog.walker.reservation.dto.ReservationDto;

public interface ReservationDao {

		public void insert(ReservationDto dto);
		public List<ReservationDto> reservationgetList(ReservationDto dto);
		public List<ReservationDto> reservationgetList2(ReservationDto dto);
		public PetusersDto pUserGetData(String id);
		public void rsvConfirm(int num);
		public void rsvConfirmX(int num);
}
