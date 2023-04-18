package com.laptrinhjavaweb.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SysError {
	private String code;
	private ErrorParam errorParams;
}
