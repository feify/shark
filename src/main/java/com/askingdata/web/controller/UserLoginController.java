package com.askingdata.web.controller;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.askingdata.common.Pagination;
import com.askingdata.common.ResponseCode;
import com.askingdata.domain.internalDomain.Task;
import com.askingdata.domain.internalDomain.User;
import com.askingdata.persist.mongo.repositories.TaskRepository;
import com.askingdata.persist.mongo.repositories.UserRepository;
/**
 * 
 * @author lizengfa
 *
 */

@Controller
public class UserLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private TaskRepository taskRepository;
	
	@RequestMapping(value="/faster")
	public String loadHomePage(){
		
		return "index";
	}
	
	@RequestMapping(value="/charData")
	public String loadHomePage1(){
		
		return "charData";
	}
	
	@RequestMapping(value="/userLogin")
	public String loadLoginPage(){
		
		return "userLogin";
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/login")
	public String login(@RequestBody User user,ModelMap model,HttpSession session){
		
		String username =user.getUsername();
		String password = user.getPassword();
		user = userRepository.findUserByUserName(username);
		if(password.equals(user.getPassword())){
			session.setAttribute("curUser", user);
			Pagination<Task> pagination = taskRepository.findTasksPageByUserId(1, user.getId());
			model.put("tasks", pagination.getDatas());
			logger.info("login success,user: "+user);
			return "redirect:fopenindex";
		}else{
			model.put("responseCode", ResponseCode.IllegalValue.ordinal());
			logger.info("login fail,user: "+user);
			return "redirect:index";
		}
	}
}
