package com.laptrinhjavaweb.api.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.exception.MyFileNotFoundException;
import com.laptrinhjavaweb.service.INewService;

@RestController(value = "newAPIOfAdmin")
public class NewAPI {
	private static org.slf4j.Logger log = LoggerFactory.getLogger(NewAPI.class);
	private static final String rootPath = new File("").getAbsolutePath();
	public static String uploadDirectory = rootPath  + "\\spring-mvc-spring-security\\src\\main\\webapp/uploads";
		
	@Autowired
	private INewService newService;

	@PostMapping(value = "api/new")
	public ResponseEntity<?> createNew(@ModelAttribute NewDTO newDTO, @RequestParam("file") MultipartFile[] files) throws IOException {
		
		  try { 
			com.laptrinhjavaweb.util.ValidationUtils.ValidateNews(newDTO, files);
			List<String> fileNames = new ArrayList<>();
			if (newDTO == null) {
				return null;
			}
			if (files.length == 0) { // Fail
				 return ResponseEntity.badRequest().body("No files uploaded");
			}else {
				for (MultipartFile file : files) {
					
			            String fileName = file.getOriginalFilename();
			            Path filePath = Paths.get(uploadDirectory, fileName);
			            File dest = new File(filePath.toString());
			            file.transferTo(dest);
			            fileNames.add(fileName);
				}
				
			}

			newDTO.setThumbnail(fileNames);
			return ResponseEntity.ok().body(newService.save(newDTO));
		} catch (MyFileNotFoundException ex) {
			  String errorMessage = ex.getMessage();
		       return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"detail\":\"" + errorMessage + "\"}");
		}

	}

	@PostMapping(value = "api/new/edit")
	public  ResponseEntity<?>  updateNew(@ModelAttribute NewDTO updateNew, @RequestParam(value = "file") MultipartFile[] files) throws IOException {

		try {
			com.laptrinhjavaweb.util.ValidationUtils.ValidateNews(updateNew, files);
			List<String> fileNames = new ArrayList<>();
			if (updateNew == null) {
				return null;
			}
			if (files[0].getSize() > 0) { // Fail
				for (MultipartFile file : files) {
					
		            String fileName = file.getOriginalFilename();
		            Path filePath = Paths.get(uploadDirectory, fileName);
		            File dest = new File(filePath.toString());
		            file.transferTo(dest);
		            fileNames.add(fileName);
				}
				updateNew.setThumbnail(fileNames);
			}
			return ResponseEntity.ok().body(newService.save(updateNew));
		} catch (MyFileNotFoundException ex) {
			  String errorMessage = ex.getMessage();
		       return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"detail\":\"" + errorMessage + "\"}");
		}
	}

	@DeleteMapping("api/new")
	public void deleteNew(@RequestBody long[] ids) {
		newService.delete(ids);
	}
}
