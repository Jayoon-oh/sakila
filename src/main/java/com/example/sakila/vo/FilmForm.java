package com.example.sakila.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
public class FilmForm {
	private String title;
	 private String description; // NULL
	 private Integer releaseYear; // NULL
	 private int languageId;
	 private Integer originalLanguageId; // NULL
	 private int rentalDuration;
	 private double rentalRate;
	 private Integer length; // 기본값
	 private double replacementCost;
	 private String rating;
	 
	 private List<String> specialFeatures;
	 // == private String[] specialFeautures;
	 public Film changeFilm() {
		 Film f = new Film();
		 f.setTitle(this.title);
		 return f;
	 }
}