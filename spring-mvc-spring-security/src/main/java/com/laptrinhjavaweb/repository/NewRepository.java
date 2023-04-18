package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.laptrinhjavaweb.entity.NewEntity;

@Repository
public interface NewRepository extends JpaRepository<NewEntity, Long> {
	List<NewEntity> findByTitleContaining(String title,Pageable pageable); // ddawjt tên theo yêu cầu chuẩn jpa, đúng field , đúng tên 
	List<NewEntity> findByTitleContaining(String title); // để getTotalItems theo Title
	List<NewEntity> findByCategoryCodeContaining(String code, Pageable pageable);
	List<NewEntity> findByCategoryCodeContaining(String code);
	NewEntity findById(Long id);
	
	
}

