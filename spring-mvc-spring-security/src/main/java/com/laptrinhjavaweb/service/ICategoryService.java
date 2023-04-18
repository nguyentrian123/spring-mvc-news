package com.laptrinhjavaweb.service;

import java.util.List;
import java.util.Map;

import com.laptrinhjavaweb.dto.CategoryDTO;

public interface ICategoryService {
	Map<String,String> findAll();
	List<CategoryDTO> findAlls();
	CategoryDTO findById(long id);
	CategoryDTO findByCode(String code);
	CategoryDTO save(CategoryDTO categoryDTO);
	void delete(long []ids);
}
