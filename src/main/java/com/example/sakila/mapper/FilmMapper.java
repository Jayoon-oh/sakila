package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	Integer updateFilm(Film film);
	
	Integer deleteFilmByKey(Integer filmId);
	
	// category 있을때 filmList
	List<Map<String, Object>> selectFilmListByCategory(Map<String, Object> paramMap);
	
	// category 없을때 filmList
	List<Map<String, Object>> selectFilmList(Map<String, Object> paramMap);
	
	
	// on/actorOne 에서 필름 검색시 사용.
	List<Film> selectFilmListByTitle(String searchTitle);
	
	int insertFilm(Film film);
	
	
	// film X language
	Map<String, Object> selectFilmOne(int filmId);
	
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}