//package com.askingdata.web.user;
//import java.util.Map;
//
//
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.SpringApplicationConfiguration;
//import org.springframework.boot.test.TestRestTemplate;
//import org.springframework.boot.test.WebIntegrationTest;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.MediaType;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.web.client.RestTemplate;
//
//import com.askingdata.common.ResponseCode;
//import com.askingdata.persist.mongo.repositories.UserRepository;
//import com.askingdata.ApplicationMain;
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.common.collect.Maps;
//
//import static org.junit.Assert.*;
//
///**
// * 
// * @author lizengfa
// *
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@SpringApplicationConfiguration(classes = ApplicationMain.class)
//@WebIntegrationTest
//public class UserRegisterControllerTest {
//	
//	private RestTemplate restTemplate = new TestRestTemplate();
//	
//	@Autowired
//	private UserRepository userRepository;
//	
//	public static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();
//	
//	@Before
//	public void init() throws JsonProcessingException{
//		HttpHeaders requestHeaders = new HttpHeaders();
//	    requestHeaders.setContentType(MediaType.APPLICATION_JSON);
//		Map<String,Object> forms = Maps.newHashMap();
//		forms.put("username", "Jack");
//		forms.put("password", "213123123");
//		forms.put("email", "Jack@gmail.com");
//		forms.put("userType", 1);
//		HttpEntity<String> httpEntity = 
//			        new HttpEntity<String>(OBJECT_MAPPER.writeValueAsString(forms), requestHeaders);
//		restTemplate.postForObject("http://localhost:8080/register", httpEntity,Integer.class,Maps.newHashMap());
//	}
//	
//	@Test
//	public void testRegister() throws JsonProcessingException{
//		HttpHeaders requestHeaders = new HttpHeaders();
//	    requestHeaders.setContentType(MediaType.APPLICATION_JSON);
//		Map<String,Object> forms = Maps.newHashMap();
//		forms.put("username", "Jack");
//		forms.put("password", "213123123");
//		forms.put("email", "Jack@gmail.com");
//		forms.put("userType", 1);
//		HttpEntity<String> httpEntity = new HttpEntity<String>(OBJECT_MAPPER.writeValueAsString(forms), requestHeaders);
//		
//		int code = restTemplate.postForObject("http://localhost:8080/register", httpEntity,Integer.class,Maps.newHashMap());
//		assertEquals(ResponseCode.notUnique.ordinal(), code);
//		
//		forms.put("email", "sdsdfsdf");
//		httpEntity = new HttpEntity<String>(OBJECT_MAPPER.writeValueAsString(forms), requestHeaders);
//		userRepository.removeByPropertyName("username", "Jack");
//		code = restTemplate.postForObject("http://localhost:8080/register", httpEntity,Integer.class,Maps.newHashMap());
//		assertEquals(ResponseCode.IllegalValue.ordinal(), code);
//		
//		forms.put("email", "Jack@gmail.com");
//		httpEntity = new HttpEntity<String>(OBJECT_MAPPER.writeValueAsString(forms), requestHeaders);
//		code = restTemplate.postForObject("http://localhost:8080/register", httpEntity,Integer.class,Maps.newHashMap());
//	}
//	
//	@Test
//	public void testAjaxCheckUsername(){
//		
//		HttpHeaders requestHeaders = new HttpHeaders();
//	    requestHeaders.setContentType(MediaType.APPLICATION_JSON);
//	   
//	    Object code =  restTemplate.getForObject("http://localhost:8080/checkUsername?username=lzf",Object.class, Maps.newHashMap());
//	    assertEquals(ResponseCode.success.ordinal(), code);
//	    code =  restTemplate.getForObject("http://localhost:8080/checkUsername?username=",Object.class, Maps.newHashMap());
//	    assertEquals(ResponseCode.IllegalValue.ordinal(), code);
//	}
//	
//	@Test
//	public void testAjaxCheckEmail(){
//		HttpHeaders requestHeaders = new HttpHeaders();
//	    requestHeaders.setContentType(MediaType.APPLICATION_JSON);
//	   
//	    Object code =  restTemplate.getForObject("http://localhost:8080/checkEmail?email=",Object.class, Maps.newHashMap());
//	    assertEquals(ResponseCode.IllegalValue.ordinal(), code);
//	    code = restTemplate.getForObject("http://localhost:8080/checkEmail?email=21121212@qq.com",Object.class, Maps.newHashMap());
//	    assertEquals(ResponseCode.success.ordinal(), code);
//	    
//	}
//	
//	@After
//	public void destory(){
//		userRepository.removeByPropertyName("username", "Jack");
//	}
//}
