package com.example.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private int rentalId;
	private String	dateTime;
	private int inventoryId;
	private int	customerId;
	private String returnDate;
	private int	staffId;
	private String lastUpdate;
}
