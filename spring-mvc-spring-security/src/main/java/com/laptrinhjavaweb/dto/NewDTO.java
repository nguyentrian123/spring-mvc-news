package com.laptrinhjavaweb.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NewDTO extends AbstractDTO<NewDTO> {
	@NotEmpty(message = "Short description must not be empty")
	private String title;
	private List<String> thumbnail;
	@NotEmpty(message = "Short description must not be empty")
    @Size(max = 100, message = "Short description must not exceed 100 characters")
	private String shortDescription;
	private String content;
	private Long categoryId;
	private String categoryCode;
	
	
	
}
