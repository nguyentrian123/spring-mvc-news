package com.laptrinhjavaweb.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.entity.CommentEntity;

@Component
public class CommentConverter {

	@Autowired
	private ModelMapper modelMapper;

	public CommentDTO toDTO(CommentEntity entity) {
		CommentDTO result = modelMapper.map(entity, CommentDTO.class);
		result.setNews_Id(entity.getNews().getId());
		return result;
	}

	public CommentEntity toEntity(CommentDTO dto) {
		CommentEntity result = modelMapper.map(dto, CommentEntity.class);
		return result;
	}

}
