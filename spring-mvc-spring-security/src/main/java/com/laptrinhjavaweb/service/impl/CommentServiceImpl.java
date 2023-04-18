package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.swing.text.html.parser.DTD;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.CommentConverter;
import com.laptrinhjavaweb.dto.CommentDTO;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.entity.CommentEntity;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.ICommentService;

@Service
public class CommentServiceImpl implements ICommentService {

	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private CommentConverter commentConverter;
	@Autowired
	private NewRepository newRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional
	public CommentDTO saveComment(CommentDTO commentDTO) {
		CommentEntity commentEntity = new CommentEntity();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser) authentication.getPrincipal();
		commentDTO.setUser_Id(myUser.getId());

		if (commentDTO.getId() != null && commentRepository.exists(commentDTO.getId())) {
			CommentEntity oldComment = commentRepository.findOne(commentDTO.getId());
			oldComment.setContent(commentDTO.getContent());
			commentEntity = oldComment;
			
		} else if (commentDTO.getId() != null && !commentRepository.exists(commentDTO.getId())) {
			return new CommentDTO();
		}
		if (commentDTO.getId() == null) {
			commentEntity = commentConverter.toEntity(commentDTO);
			commentEntity.setNews(newRepository.findById(commentDTO.getNews_Id()));
			commentEntity.setUser(userRepository.findOne(commentDTO.getUser_Id()));
		}

		return commentConverter.toDTO(commentRepository.save(commentEntity));
	}

	@Override
	public List<CommentDTO> findCommentByNewsId(Long newsId) {
		List<CommentDTO> commentDTOs = new ArrayList<>();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<CommentEntity> commentEntities = commentRepository.findByNews_id(newsId);
		
		if(authentication != null && authentication.isAuthenticated() && !(authentication instanceof AnonymousAuthenticationToken)) {
			MyUser myUser = (MyUser) authentication.getPrincipal();
			//get all comment by newsId
				
				commentEntities.forEach(entity -> {
					CommentDTO commentDTO = commentConverter.toDTO(entity);
					if(entity.getParentComment() != null) {
						CommentEntity cmEntity= commentRepository.findOne(entity.getParentComment());
						commentDTO.setUserNameParentComment(cmEntity.getUser().getFullName());
					}
					commentDTO.setNews_Id(entity.getNews().getId());
					commentDTO.setUser_Id(entity.getUser().getId());
					commentDTO.setFullNameComment(entity.getUser().getFullName());
					commentDTO.setUserAuth(myUser.getId());
					
					commentDTOs.add(commentDTO);
				});
		}else {
			commentEntities.forEach(entity -> {
				CommentDTO commentDTO = commentConverter.toDTO(entity);
				if(entity.getParentComment() != null) {
					CommentEntity cmEntity= commentRepository.findOne(entity.getParentComment());
					commentDTO.setUserNameParentComment(cmEntity.getUser().getFullName());
				}
				commentDTO.setNews_Id(entity.getNews().getId());
				commentDTO.setUser_Id(entity.getUser().getId());
				commentDTO.setFullNameComment(entity.getUser().getFullName());		
				commentDTOs.add(commentDTO);
			});
		}
		

		for (CommentDTO parentCommentDTO : commentDTOs) {
			List<CommentDTO> childCommentDTOs = new ArrayList<>();
			if (parentCommentDTO.getParentComment() == null) { // lay dc 1 parentComment
				
				List<CommentDTO> listCommentHierarchy = new ArrayList<>(Arrays.asList());
				List<CommentDTO> listCommentSearch = new ArrayList<>(Arrays.asList(parentCommentDTO));
				List<CommentDTO> listChildComment;
				while (listCommentSearch.size() > 0) {
					listChildComment = (List<CommentDTO>)commentDTOs.stream() 
										.filter(dto -> dto.getParentComment() == listCommentSearch.get(0).getId()) 
										.collect(Collectors.toList());
					
					if(listChildComment.size() > 0) {
						listCommentHierarchy.addAll(listChildComment);
						listCommentSearch.addAll(listChildComment);
					}
					listCommentSearch.remove(0);
				}
				childCommentDTOs.addAll(listCommentHierarchy);
				parentCommentDTO.setListChildComments(childCommentDTOs);
			}
		}

		return commentDTOs;
	}

	@Override
	@Transactional
	public void deleteComment(Long[] ids) {
		for (Long id : ids) {
			List<CommentEntity> commentEntities = commentRepository.findByParentComment(id);
			if(commentEntities.size() == 0) {
				commentRepository.delete(id);
				
			}else { // find all child of parent comment and delete
				CommentEntity parentCommentEntity = commentRepository.findOne(id);
				List<CommentEntity> listCommentHierarchy = new ArrayList<>(Arrays.asList(parentCommentEntity));
				List<CommentEntity> listCommentSearch = new ArrayList<>(Arrays.asList(parentCommentEntity));
				List<CommentEntity> listChildComment;
				while (listCommentSearch.size() > 0) {
					listChildComment = commentRepository.findByParentComment(listCommentSearch.get(0).getId());
					if(listChildComment.size() > 0) {
						listCommentHierarchy.addAll(listChildComment);
						listCommentSearch.addAll(listChildComment);
					}
					listCommentSearch.remove(0);
				}
				listCommentHierarchy.forEach(comment->{
					commentRepository.delete(comment.getId());
				});
			}
			
			
		}
	}
	

}
