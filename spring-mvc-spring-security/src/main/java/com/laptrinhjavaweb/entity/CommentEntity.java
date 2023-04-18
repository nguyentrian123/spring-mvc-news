package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "comment")
public class CommentEntity extends BaseEntity{
	@Column(name ="content")
	private String content;
	
	@Column(name ="parentcomment")
	private Long parentComment;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "news_id")
	private NewEntity news;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity user;

	
	
}
