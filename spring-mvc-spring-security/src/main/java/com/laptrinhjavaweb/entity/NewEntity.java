package com.laptrinhjavaweb.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "new")
public class NewEntity extends BaseEntity {
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "thumbnail")
	private String thumbnail;
	
	@Column(name = "shortdescription", columnDefinition = "TEXT")
	private String shortDescription;
	
	@Column(name = "content", columnDefinition = "TEXT")
	private String content;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private CategoryEntity category;
	
	
	@OneToMany(mappedBy ="news")
	private List<CommentEntity> comments;
	
	
}
