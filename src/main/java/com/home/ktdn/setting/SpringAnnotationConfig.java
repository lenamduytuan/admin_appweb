package com.home.ktdn.setting;

import java.util.Locale;
import java.util.ResourceBundle;

import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.home.core.util.ResourceUtils;



@Configuration
@ImportResource("classpath:./spring/config/BeanLocations.xml")
public class SpringAnnotationConfig {
	@Bean
	public DriverManagerDataSource dataSource() throws Exception{
		ResourceBundle rb = null;
		DriverManagerDataSource dataSource = null;
		try {
			rb = ResourceUtils.getResourceBundle("database", Locale.getDefault());
			String jdbcDriverClassName = ResourceUtils.getString(rb,"jdbc.driverClassName");
			String jdbcUrl = ResourceUtils.getString(rb,"jdbc.url");
			String jdbcUsername = ResourceUtils.getString(rb,"jdbc.username");
			String jdbcPassword = ResourceUtils.getString(rb,"jdbc.password");
			String account = null;
			if(!"bctc_owner".equals(jdbcUsername)){
				try{
					//account = OracleJDBC.getOwnerAccountBCTC();
					jdbcUsername = account.split("=")[0];
					jdbcPassword = account.split("=")[1];
				}catch(Exception e){
					e.printStackTrace();
				}
			}else{
				account = jdbcUsername + "=" + jdbcPassword;
			}
			dataSource = new DriverManagerDataSource();
			dataSource.setDriverClassName(jdbcDriverClassName);
			dataSource.setUrl(jdbcUrl);
			dataSource.setUsername(jdbcUsername);
			dataSource.setPassword(jdbcPassword);
			System.out.println("Account BCTC: " +account);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		return dataSource;
	}
	
	
}
