package com.xx.base.handler;

import javax.servlet.http.HttpServletRequest;   
import javax.servlet.http.HttpServletResponse;   
  
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerExceptionResolver;   
import org.springframework.web.servlet.ModelAndView;   
  
public class ExceptionHandler implements HandlerExceptionResolver {   
  
    @Override  
    public ModelAndView resolveException(HttpServletRequest request,   
            HttpServletResponse response, Object handler, Exception ex) {   
        // TODO Auto-generated method stub   
    	
    	// 视图显示专门的错误页
        ModelAndView modelAndView = new ModelAndView("exception/error");
        return modelAndView;
        
//        return new ModelAndView("exception/page_500");   
    }   
//    public String login1(HttpServletRequest request, Model model) throws Exception {
////		return "login/login";
//		return "exception/page_500";
//	}
  
} 