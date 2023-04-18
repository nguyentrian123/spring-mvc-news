package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.dto.CommentDTO;

public interface ICommentService {
	CommentDTO saveComment(CommentDTO commentDTO);
	void deleteComment(Long[] ids);
	List<CommentDTO> findCommentByNewsId(Long newsId);
}
