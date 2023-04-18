package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.exception.MyFileNotFoundException;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.ValidationUtils;

@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {
	
	@Autowired
	private ICategoryService categoryService;
	
	@PostMapping("api/category")
	public ResponseEntity<?> createCategory(@RequestBody CategoryDTO categoryDTO)
	{
		try {
			ValidationUtils.ValidateCategory(categoryDTO);
			return ResponseEntity.ok().body(categoryService.save(categoryDTO));

		} catch (MyFileNotFoundException ex) {
			  String errorMessage = ex.getMessage();
		       return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"detail\":\"" + errorMessage + "\"}");
		}
	}
	
	@PutMapping("api/category")
	public ResponseEntity<?>  updateCategory(@RequestBody CategoryDTO updateDTO)
	{
		try {
			ValidationUtils.ValidateCategory(updateDTO);
			return ResponseEntity.ok().body(categoryService.save(updateDTO));

		} catch (MyFileNotFoundException ex) {
			  String errorMessage = ex.getMessage();
		       return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"detail\":\"" + errorMessage + "\"}");
		}
	}
	
	@DeleteMapping("api/category")
	public void deleteNew(@RequestBody long[] ids) // xoa 1 or nhieu bviet nen tao mang
	{
		categoryService.delete(ids);
		
	}
	
}
