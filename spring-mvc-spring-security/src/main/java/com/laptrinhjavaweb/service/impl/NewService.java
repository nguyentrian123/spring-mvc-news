package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;

@Service
public class NewService extends HttpServlet implements INewService {
	

	
	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private NewConverter newConverter;
	
	@Autowired
	ServletContext application;
	
	@Override
	public List<NewDTO> findAll(Pageable pageable) {
		List<NewDTO> models = new ArrayList<>();
		List<NewEntity> entities = newRepository.findAll(pageable).getContent();
	
		for(NewEntity item : entities) {
			NewDTO newDTO = newConverter.toDTO(item);
			models.add(newDTO);
			
		}
		return models;
	}
	
	
	@Override
	public List<NewDTO> findByCategoryCode(String code,Pageable pageable) {
		List<NewDTO> models = new ArrayList<>();
		List<NewEntity> list = newRepository.findByCategoryCodeContaining(code,pageable);
		
		for(NewEntity item : list) {
			NewDTO newDTO = newConverter.toDTO(item);
			models.add(newDTO);
			
		}

		return models;
	}

	



	@Override
	public List<NewDTO> findByTitleContaining(String name,Pageable pageable) {
		List<NewDTO> models =  new ArrayList<>();
		List<NewEntity> list = newRepository.findByTitleContaining(name,pageable);
		
		for(NewEntity item : list) {
			NewDTO newDTO = newConverter.toDTO(item);
			models.add(newDTO);
		}

		return models;
		
	}
	
	// Laasy toong
	@Override
	public int getTotalItem() {

		return (int)newRepository.count();
	}
	
	//take Sum follow categorycode
	@Override
	public int getTotalItems(String code) {
		
		List<NewEntity> list = newRepository.findByCategoryCodeContaining(code);
		int s = 0;
		for(NewEntity item : list) {
			s = s+1;
			
		}
		return s;
	}
	
	//take Sum follow title 
	@Override
	public int getTotalItem(String title) {
		
		List<NewEntity> list = newRepository.findByTitleContaining(title);
		int s = 0;
		for(NewEntity item : list) {
			s = s+1;
			
		}
		return s;
	}

	

	@Override
	public NewDTO findById(long id) {
		NewEntity entity = newRepository.findOne(id);
		return newConverter.toDTO(entity);
	}
	

	
	@Override
	@Transactional 
	public NewDTO save(NewDTO dto) {
		CategoryEntity  category = categoryRepository.findOneByCode(dto.getCategoryCode());
		NewEntity newEntity = new NewEntity();
		//dto.setContent(dto.getContent().substring(1));
		// update
		if(dto.getId()!= null) 
		{
			NewEntity oldNew = newRepository.findOne(dto.getId());
			oldNew.setCategory(category);
			newEntity = newConverter.toEntity(oldNew, dto);
		}
		else 
		{
			newEntity = newConverter.toEntity(dto);
			newEntity.setCategory(category);
		}
		return newConverter.toDTO(newRepository.save(newEntity));
	}




	@Override
	@Transactional
	public void delete(long []ids) {
		for(long id: ids)
		{
			newRepository.delete(id);
		}
		
	}

	@Override
	public List<NewDTO> findAlls() {
		List<NewDTO> models = new ArrayList<>();
		List<NewEntity> entities = newRepository.findAll();
		for(NewEntity item : entities) {
			NewDTO newDTO = newConverter.toDTO(item);
			models.add(newDTO);	
		}
		return models;
	}


	
	

	
}
