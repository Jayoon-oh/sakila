package com.example.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper //xml 쿼리를 실행하기 위해 만든 클래스.
public interface StaffMapper {
	// /staffOne.jsp 
	Map<String, Object> selectStaffOne(int StaffId);
	
	// /login 메소드
	Staff login(Staff staff);
	}

