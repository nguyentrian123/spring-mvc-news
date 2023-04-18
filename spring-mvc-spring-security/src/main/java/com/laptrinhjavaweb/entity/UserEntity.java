package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname")
	private String fullName;

	@Column
	private Integer status;

	@ManyToMany(fetch = FetchType.LAZY) // khai báo lazy để có thể lấy Role lên
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), 
								  inverseJoinColumns = @JoinColumn(name = "roleid"))
	private List<RoleEntity> roles = new ArrayList<>();
	
	@OneToMany(mappedBy = "user")
	private List<CommentEntity> comments ;
	

	
}
