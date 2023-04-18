package com.laptrinhjavaweb.converter;

import java.util.Arrays;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

@Component 
public class NewConverter {
	
	@Autowired
	private ModelMapper modelMapper;
	
	// chuyển lại DTO để lưu vào db
	public NewDTO toDTO(NewEntity entity)
	{
		NewDTO result = modelMapper.map(entity, NewDTO.class);
		result.setThumbnail(Arrays.asList(entity.getThumbnail().split(",")));
		return result;
	}
	
	
	public NewEntity toEntity(NewDTO dto)
	{
		NewEntity result = modelMapper.map(dto, NewEntity.class);	
		String fileNameAslist = dto.getThumbnail().stream().collect(Collectors.joining(","));
		result.setThumbnail(fileNameAslist);
		return result;
	}
	
	
	// tạo phương thức mới cho New cũ , dùng tính chất OVERLOADING
	// set laj content cho NewEntity(model ánh xạ vs csdl)
	public NewEntity toEntity(NewEntity result,NewDTO dto)
	{	
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setContent(dto.getContent());
		if(dto.getThumbnail() == null) {
			result.setThumbnail(result.getThumbnail());
		}else {
			String fileNameAslist = dto.getThumbnail().stream().collect(Collectors.joining(","));
			result.setThumbnail(fileNameAslist);
		}	
		return result;
	}
}
