//package com.askingdata.web.user;
//
//import java.util.Map;
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
//import com.askingdata.ApplicationMain;
//import com.askingdata.common.Page;
//import com.askingdata.common.ResponseCode;
//import com.askingdata.persist.mongo.repositories.UserRepository;
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
//public class UserLoginControllerTest {
//	
//private RestTemplate restTemplate = new TestRestTemplate();
//	
//	@Autowired
//	private UserRepository userRepository;
//	
//	public static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();
//	
//	@Before
//	public void init() throws JsonProcessingException{
//		
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
//		
//	}
//	
//	@Test
//	public void testLogin() throws JsonProcessingException{
//		
//		HttpHeaders requestHeaders = new HttpHeaders();
//	    requestHeaders.setContentType(MediaType.APPLICATION_JSON);
//		Map<String,Object> forms = Maps.newHashMap();
//		forms.put("username", "Jack");
//		forms.put("password", "123456");
//		HttpEntity<String> httpEntity = 
//		        new HttpEntity<String>(OBJECT_MAPPER.writeValueAsString(forms), requestHeaders);
//		String code = restTemplate.postForObject("http://localhost:8080/login", httpEntity,String.class,Maps.newHashMap());
//		assertEquals("error", code);
//		
//		forms.put("password", "213123123");
//		httpEntity = 
//		        new HttpEntity<String>(OBJECT_MAPPER.writeValueAsString(forms), requestHeaders);
//		code = restTemplate.postForObject("http://localhost:8080/login", httpEntity,String.class,Maps.newHashMap());
//		assertEquals(ResponseCode.success.ordinal(), code);
//		
//	}
//	
//	@After
//	public void destory(){
//		
//		userRepository.removeByPropertyName("username", "Jack");
//	}
//
//}
