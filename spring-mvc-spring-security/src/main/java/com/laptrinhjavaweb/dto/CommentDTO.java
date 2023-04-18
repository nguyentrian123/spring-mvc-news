package com.laptrinhjavaweb.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
	private Long id;
	private Long user_Id;
	private String fullNameComment;
	private Long news_Id;
	private String content;
	private Long parentComment;
	private String userNameParentComment;
	private List<CommentDTO> listChildComments;
	private Long userAuth ;
	
	
	
}
