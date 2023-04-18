package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired 
	private CategoryRepository categoryRepository;
	
	@Autowired 
	private CategoryConverter categoryConverter;
	
	
	@Override
	public Map<String,String> findAll() {
		Map<String,String> result = new HashMap<>();
		
		List<CategoryEntity>entities = categoryRepository.findAll();
		for(CategoryEntity item:entities)
		{
			result.put(item.getCode(), item.getName()); // casi key nay se matching vs categories code ngoai trang edit
		}
		return result;
	}



	@Override
	public List<CategoryDTO> findAlls() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for(CategoryEntity item : entities) {
			CategoryDTO categoryDTO = categoryConverter.toDTO(item);
			models.add(categoryDTO);
			
		}
		return models;
	}



	@Override
	public CategoryDTO findById(long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return categoryConverter.toDTO(entity); // ddwa vao trung gian DTO
	}
	



	@Override
	@Transactional
	public CategoryDTO save(CategoryDTO categoryDTO) {
		
		CategoryEntity categoryEntity = new CategoryEntity();
		List<CategoryEntity> entities = categoryRepository.findAll();
		if(categoryDTO.getId() != null)
		{
			CategoryEntity oldCategory = categoryRepository.findOne(categoryDTO.getId());
			
			categoryEntity = categoryConverter.toEntity(oldCategory,categoryDTO);
		}
		else
		{
			
			categoryEntity = categoryConverter.toEntity(categoryDTO);
			for(CategoryEntity item : entities)
			{
				if(categoryEntity.getCode().equals(item.getCode()))
				{
					return null;
				}
			}
		}

		return categoryConverter.toDTO(categoryRepository.save(categoryEntity));
	}



	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id :ids )
		{
			categoryRepository.delete(id);
		}
		
	}



	@Override
	public CategoryDTO findByCode(String code) {
		CategoryEntity entity = categoryRepository.findOneByCode(code);
		return categoryConverter.toDTO(entity);
	}
	
	
}
