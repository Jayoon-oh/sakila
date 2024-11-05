package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper //xml 쿼리를 실행하기 위해 만든 클래스.
public interface StaffMapper {
	// 수정하는거.
	int updateStaff(Staff staff); // 업데이터문 하나로 모든 컬럼을 개별수정 가능하도록. (myBatis 지원기능)
	
	int selectStaffCount();
	
	List<Staff> selectStaffList(Map<String,Object> map);
	
	int insertStaff(Staff staff);
	
	// /on/staffOne.jsp 
	Map<String, Object> selectStaffOne(int staffId);
	
	// /off/login 메소드
	Staff login(Staff staff);
	}

