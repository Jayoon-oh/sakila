package com.example.sakila.vo;

import lombok.Data;

//VO : Value Object
@Data
public class Staff {
	private int staffId; // PK
	private String firstName;
	private String lastName;
	private int addressId; // FK
	private String email;
	private int storeId; // FK
	private int active; 
	private String username; // 로그인 
	private String password; // 로그인.
	private String lastUpdate;
	
}
