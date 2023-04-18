package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String name, int status);
	List<UserEntity> findByUserName(String name);
	List<UserEntity> findByFullNameContaining(String fullname);
}
