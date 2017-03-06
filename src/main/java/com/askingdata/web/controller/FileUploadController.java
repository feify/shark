package com.askingdata.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.askingdata.common.DateUtils;
import com.askingdata.common.ResponseCode;
import com.askingdata.domain.internalDomain.Task;
import com.askingdata.domain.internalDomain.TaskGroup;
import com.askingdata.domain.internalDomain.User;
import com.askingdata.domain.internalDomain.UserDatasource;
import com.askingdata.domain.internalDomain.Task.TaskStatus;
import com.askingdata.domain.internalDomain.UserDatasource.DatasourceType;
import com.askingdata.persist.mongo.repositories.TaskGroupRespository;
import com.askingdata.persist.mongo.repositories.TaskRepository;
import com.askingdata.persist.mongo.repositories.UserDatasourceRespository;

/**
 * file upload
 * @author lizengfa
 *
 */
@Controller
public class FileUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	@Value("${file.dir}")
	private String FILEURI;
	
	@Autowired
	private UserDatasourceRespository userDatasourceRespository;
	
	@Autowired
	private TaskRepository taskRepository;
	
	@RequestMapping("/upload")
	public ModelMap upload(@RequestParam String taskName,@RequestParam String groupName,
			@RequestParam("file") MultipartFile file,HttpSession session,ModelMap model){
		
		User user = (User) session.getAttribute("curUser");
		String filePath = FILEURI + System.getProperty("file.separator") +
				user.getUsername() +"_"+groupName+DateUtils.nowLocalDateTime().toString();
		File dir = new File(filePath);
		if(!file.isEmpty()){
			try {
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(dir));
				FileCopyUtils.copy(file.getInputStream(), stream);
				stream.close();
				model.put("responseCode", ResponseCode.success.ordinal());
                Task task = new Task();
				task.setUserId(user.getId());
				task.setTaskName(taskName);
				task.setTaskCreateTime(DateUtils.nowLocalDateTime());
				task.setTaskStatus(TaskStatus.UNSTART.ordinal());
				taskRepository.save(task);
			     
				UserDatasource userDatasource = new UserDatasource();
			
				userDatasource.setDatasourceType(DatasourceType.LOCALFILE);
				userDatasource.setUserId(user.getId());
				userDatasource.setDatasourseUrl(filePath);
	            user.setUserDatasource(user.getId(), task.getId(), userDatasource);
	            userDatasourceRespository.save(userDatasource);
	            session.setAttribute("curUser", user);
	            
			} catch (Exception e) {
				logger.error("upload error", e);
				model.put("responseCode", ResponseCode.error.ordinal());
			}
		}
		
		return model;
		
	}

}
