package com.askingdata.web.controller;

import java.util.Objects;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.askingdata.common.Pagination;
import com.askingdata.common.ResponseCode;
import com.askingdata.core.datahandle.localFile.LocalFileDataFlow;
import com.askingdata.domain.internalDomain.Task;
import com.askingdata.domain.internalDomain.TsData;
import com.askingdata.domain.internalDomain.User;
import com.askingdata.domain.internalDomain.UserDatasource;
import com.askingdata.persist.mongo.repositories.TaskRepository;

/**
 * 
 * @author lizengfa
 *
 */
@Controller
public class SubmitTaskController {
	
	private final static Logger logger = LoggerFactory.getLogger(SubmitTaskController.class);
	
	@Autowired
	private TaskRepository taskRepository;
	
	@Autowired
	private LocalFileDataFlow localFileDataFlow;
	
	@RequestMapping("/newTask")
	public String loadTask(){
		
		return "newTask";
		
	}
	
	
	@RequestMapping("/checkTaskName")
	public ModelMap checkTaskName(@RequestParam String taskName,ModelMap map){
		
		Task task = taskRepository.findOneByTaskName(taskName);
		if(Objects.isNull(task))
			map.put("responseCode", ResponseCode.success.ordinal());
		else
			map.put("responseCode", ResponseCode.IllegalValue.ordinal());
		return map;
		
	}
	
	@RequestMapping("/submitTask")
    public String submitTask(@RequestBody @Valid Task task,BindingResult result,HttpSession session,ModelMap model){
		if(result.hasErrors())
			return "redirect:submitTask";
		
		User user = (User) session.getAttribute("curUser");
		Pagination<Task> pagination = taskRepository.findTasksPageByUserId(1, user.getId());
		model.put("tasks", pagination.getDatas());
		taskRepository.updateTaskAhead(task.getId(), task.getTaskAhead());
	
		UserDatasource userDatasource = user.getUserDatasource(user.getId(), task.getId());
	    localFileDataFlow.pullData(userDatasource);
	    user.getDatasource().remove(user.getId(),task.getId());
		logger.info("submit task success,task: "+task);
		
		return "redirect:fopenindex";    	
		
    }
	


}
