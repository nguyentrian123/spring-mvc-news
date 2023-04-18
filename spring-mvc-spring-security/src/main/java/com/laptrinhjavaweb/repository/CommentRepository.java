package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.CommentEntity;

public interface CommentRepository extends JpaRepository<CommentEntity, Long> {
	List<CommentEntity> findByNews_id(Long newsId);
	List<CommentEntity> findByParentComment(Long id);
}
