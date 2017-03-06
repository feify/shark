package com.askingdata;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import com.askingdata.common.BeanUtils;
import com.askingdata.common.ReflectionUtils;
import com.askingdata.core.datahandle.database.shark.DatabaseDataFlow;
import com.askingdata.core.datahandle.localFile.LocalFileDataFlow;
import com.askingdata.core.datahandle.localFile.LocalFileDataPersist;
import com.askingdata.core.mail.SampleMailService;
import com.askingdata.core.schedule.JobUtil;
import com.askingdata.core.schedule.job.SharkJob;
import com.askingdata.domain.externalDomain.shark.OrderInfo;
import com.askingdata.domain.internalDomain.UserDatabase;
import com.askingdata.domain.internalDomain.UserDatasource;
import com.askingdata.domain.internalDomain.UserDatasource.DatasourceType;
import com.askingdata.persist.jdbc.DynamicGenerateJdbcTemplate;
import com.askingdata.persist.mongo.repositories.TsDataRespository;
import com.askingdata.persist.mongo.repositories.UserDatabaseRespository;
import com.askingdata.persist.mongo.repositories.UserDatasourceRespository;
import com.askingdata.persist.mongo.repositories.shark.OrderInfoRespository;
import com.dangdang.ddframe.job.api.JobExecutionMultipleShardingContext;
import com.google.common.collect.Lists;

/**
 * 
 * @author lizengfa
 *
 */
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class ApplicationMain implements CommandLineRunner {

	@Autowired
	private TsDataRespository tsDataRespository;

	@Autowired
	private LocalFileDataPersist localFileDataPersist;

	@Autowired
	private LocalFileDataFlow localFileDataFlow;

	@Autowired
	private SampleMailService sampleMailService;
	
	@Autowired
	private UserDatasourceRespository datasourceRespository;
	
	@Autowired
	private UserDatabaseRespository userDatabaseRespository;
	
	@Autowired
	private DynamicGenerateJdbcTemplate dynamicGenerateJdbcTemplate;
	
	@Autowired
	private DatabaseDataFlow databaseDataFlow;
	
	@Autowired
	private JobUtil jobUtil;
	
	public static void main(String[] args) {
		SpringApplication.run(ApplicationMain.class, args);
	}

	public void run(String... args) throws Exception {
//		UserDatasource userDatasource = new UserDatasource();
//        userDatasource.setUserId("56ee4cc9a8260715f7296e20");
//        userDatasource.setTaskId("56ee62747b2889ed49e83a58");
//        userDatasource.setDatasourceType(DatasourceType.VERTICA);
//        userDatasource.setDatasourseUrl("jdbc:vertica://192.168.1.106:5433/askingdata");
//        userDatasource.setFetchFinish(false);
//        userDatasource.setOffset(0);
//        datasourceRespository.save(userDatasource);
//        
//        UserDatabase userDatabase = new UserDatabase();
//        userDatabase.setDatasourceId(userDatasource.getId());
//        userDatabase.setSql("select oi.oid,oi.tid,ic.cid,oi.dp_id,pf.num_iid,oi.outer_iid,ic.name,pf.title,oo.customerno,oi.pay_time,oo.payment,oi.num,pf.price,oi.total_fee,oo.trade_from,oo.step_trade_status,oo.receiver_state from item_cat as ic,order_order as oo,product_filter as pf,order_itemfilter as oi where ic.cid = oi.cid and oi.num_iid = pf.num_iid and oi.tid = oo.tid order by oi.pay_time;");
//        userDatabase.setUsername("askingdata");
//        userDatabase.setPassword("123456");
//        userDatabase.setLimit(1);
//        
//        userDatabaseRespository.save(userDatabase);
		
//		UserDatasource source = datasourceRespository.findById("5711d4877b289c6d234a0747");
//		UserDatabase database = userDatabaseRespository.findOneByDatasourceId(source.getId());
//		source.setUserDatabase(database);
////		jobUtil.dispatchSimpleJob(source.getId(), SharkJob.class, "0 0/50 * * * ?");
//		SharkJob sharkJob = new SharkJob();
//		JobExecutionMultipleShardingContext shardingContext = new JobExecutionMultipleShardingContext();
//		shardingContext.setJobParameter(source.getId());
//		sharkJob.process(shardingContext);
//        dynamicGenerateJdbcTemplate.createJdbcTemplate(source);
//        JdbcTemplate jdbcTemplate = dynamicGenerateJdbcTemplate.getJdbcTemplate(source);
//        UserDatabase userDatabase = userDatabaseRespository.findOneByDatasourceId(source.getId());
//        long start = System.currentTimeMillis();
//        List<Map<String, Object>>  list = jdbcTemplate.queryForList(userDatabase.getSql());
//        long end = System.currentTimeMillis();
//        
//        System.out.println("耗时------------>"+(end - start));
//        List<OrderInfo> orderInfoes = Lists.newArrayList();
//        list.forEach(m -> {
//        	try {
//				OrderInfo orderInfo = (OrderInfo) ReflectionUtils.mapToObject(m, OrderInfo.class);
//				orderInfoes.add(orderInfo);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//        });
//        OrderInfoRespository orderInfoRespository = BeanUtils.getBean(OrderInfoRespository.class);
//        orderInfoRespository.batchSave(orderInfoes);
        
        System.out.println();
	}

}
