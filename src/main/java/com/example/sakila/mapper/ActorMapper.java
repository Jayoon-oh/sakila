package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorMapper {

	// /on/removeActorFile : Service안에서 필요. -> 이거 뭐냐?
	ActorFile selectActorFileOne(int actorFileId);
	
	// /on/filmOne
	List<Actor> selectActorListByFilm(int filmId);
	
	//	/on/actorOne
	Actor selectActorOne(int actorId);
	
	List<Actor> selectActorList(Map<String, Object> map);
	
	int insertActor(Actor actor);
	
	int selectTotalCount(); // 전체 배우 수를 반환하는 메서드
	
	int selectTotalCountBySearch(Map<String, Object> map);
}