package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InterCommand {
	
	public abstract void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 인터페이스는에는 public abstract 이 생략되어져 있다.	
	
}
