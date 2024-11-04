package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	@Autowired StaffMapper staffMapper;
	@Autowired StoreMapper storeMapper;
	@Autowired AddressMapper addressMapper;
	
	// 1) leftMunu <a>태그 통해서 넘어오는 방법, 2) addStaff.jsp 통해서 주소검색을 통해 넘어오는 방법. 차이점 : 첫번째, leftMenu 는 매개값으로 아무것도 안넘김, 2번째는 searchAddress 값이 넘어옴. 
	@GetMapping("/on/addStaff")
	public String addStaff(Model model
						,@RequestParam(defaultValue = "") String searchAddress) { 
		// model(storeList)
		log.debug("searchAddress: ",searchAddress);
		
		List<Store> storeList = storeMapper.selectStoreList();
		model.addAttribute("storeList",storeList);
		
		// model(addressList) <- serachAddress가 공백이 아니면 검색 후 
		if(searchAddress.equals("") == false) {
			List<Address> addressList = addressMapper.selectAddressListByWord(searchAddress);
			log.debug(addressList.toString());
			model.addAttribute("addressList",addressList);
		}
		return "on/addStaff";
	}	// 지점 선택-> 지점리스트 넘겨줘야 함. 
	
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) { // -> 커멘드 객체라고 불림. 1) 커멘드객체.set(request.getParameter())를 실행. 2) 매개변수 이름과 comment 이름이 같을때 set을 실행함. 
		// insert 호출.
		return "redirect:/on/staffList";	
	}	// 지점 선택-> 지점리스트 넘겨줘야 함. 
	
	@GetMapping("/on/staffList")
	public String staffList(Model model
							, @RequestParam(defaultValue = "1") int currentPage) {
		// model(staffList)
		return "on/staffList";
	}
	
	@GetMapping("/on/staffOne") //데이터베이스에서 받아서, Return으로 jsp파일 열기.
	public String staffOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff",staff);
		log.debug(staff.toString());
		return "on/staffOne";
	}
	
}

//데이터베이스 (mapper) 조회 및 , 컨트롤러 수행 역할 후 jsp 파일 열기.