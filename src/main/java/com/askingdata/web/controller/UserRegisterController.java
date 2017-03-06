package com.askingdata.web.controller;
import java.util.Objects;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.askingdata.common.ResponseCode;
import com.askingdata.domain.internalDomain.User;
import com.askingdata.persist.mongo.repositories.UserRepository;

/**
 * 
 * @author lizengfa
 *
 */
@Controller
@SessionAttributes("curUser")
public class UserRegisterController {
    
	private static Logger logger = LoggerFactory.getLogger(UserRegisterController.class);
	
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * url:http://ip:port/userRegist
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET,value="/userRegist")
	public String loadRegisterPage(){
		
		return "userRegist";
	}
	
	
	@RequestMapping(method = RequestMethod.GET,value="/checkUsername")
	public @ResponseBody int ajaxCheckUsername(@RequestParam String username){
		if(StringUtils.hasText(username)){
			if(validIsExistingUsername(username))
				return ResponseCode.success.ordinal();
			else
				return ResponseCode.notUnique.ordinal();		
		}else{
			return ResponseCode.IllegalValue.ordinal();
		}
		
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/checkEmail")
	public @ResponseBody int ajaxCheckEmail(@RequestParam String email){
		
		if(StringUtils.hasText(email)){
			if(validIsExistingUsername(email))
				return ResponseCode.success.ordinal();
			else
				return ResponseCode.notUnique.ordinal();
		}else{
			return ResponseCode.IllegalValue.ordinal();
		}
		
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/register")
	public String register(HttpSession session,@RequestBody @Valid User user,BindingResult result){
		
		if(result.hasErrors()){
			return "redirect:userRegist";
		}
		
		String username = user.getUsername();
		if(!validIsExistingUsername(username))
			return "redirect:userRegist";
		
		String email = user.getEmail();
		if(!validExistingEmail(email))
			return "redirect:userRegist";
		
		userRepository.save(user);
		session.setAttribute("curUser", user);
		logger.info("register success,user: "+user);
		
		return "redirect:fopenindex";
		
	}
	
	/**
	 * valid username is or is not existing
	 * @param username
	 * @return
	 */
	private boolean validIsExistingUsername(String username){
		
		User existUser = userRepository.findUserByUserName(username);
		if(Objects.nonNull(existUser))
			return false;
		
		return true;
		
	}
	
	/**
	 * valid email is or is not existing
	 * @param username
	 * @param email
	 * @return
	 */
	private boolean validExistingEmail(String email){
		
		User existUser = userRepository.findUserByUserName(email);
		if(Objects.nonNull(existUser))
			return false;
		
		return true;
		
	}
	
	
}
