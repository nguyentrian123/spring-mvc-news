package com.laptrinhjavaweb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

public interface INewService {
	List<NewDTO> findAll(Pageable pageable);
	List<NewDTO> findAlls();
	int getTotalItem();
	int getTotalItem(String title);
	int getTotalItems(String code);
	NewDTO findById(long id);
	NewDTO save(NewDTO dto);
	void delete(long []ids);
	List<NewDTO> findByTitleContaining(String name,Pageable pageable);
	List<NewDTO> findByCategoryCode(String code,Pageable pageable);
	
}
