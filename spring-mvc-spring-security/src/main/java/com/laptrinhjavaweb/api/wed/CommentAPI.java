package com.laptrinhjavaweb.api.wed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.service.ICommentService;

@RestController(value = "CommentApiOfWeb")
@RequestMapping("/api/comment")
public class CommentAPI {
	
	@Autowired
	private ICommentService commentService;
	
	@PostMapping
	public CommentDTO addComment(@RequestBody CommentDTO commentDTO) {
		CommentDTO result = commentService.saveComment(commentDTO);
		return result;
	}
	
	@PutMapping
	public CommentDTO editComment(@RequestBody CommentDTO commentDTO) {
		if(commentDTO.getId() == null) {
			return null;
		}
		CommentDTO result = commentService.saveComment(commentDTO);
		return result;
	}
	
	@DeleteMapping
	public void deleteComment(@RequestBody Long[] ids )
	{
		commentService.deleteComment(ids);
	}




}
