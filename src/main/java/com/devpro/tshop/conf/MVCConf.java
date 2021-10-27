package com.devpro.tshop.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.devpro.tshop.Constants;

@Configuration // là 1 BEAN cho loại cấu hình.
public class MVCConf implements WebMvcConfigurer,Constants{
	/**
	 * Thực hiện định nghĩa các static resources
	 * classpath: tươgn ứng với folder: src/main/resources
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/lib/**").addResourceLocations("classpath:/lib/");
		registry.addResourceHandler("/dist/**").addResourceLocations("classpath:/dist/");
		registry.addResourceHandler("/plugins/**").addResourceLocations("classpath:/plugins/");
		
		// đăng ký thêm static resources cho ảnh attach đẩy lên
		registry.addResourceHandler("/upload/**").addResourceLocations("file:"+UPLOAD_FOLDER_ROOT);
	}
	@Bean // BEAN này dùng để chỉ ra thư mục chứa Views
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		//thiết lập view engine
		bean.setViewClass(JstlView.class);
		
		//Đường dẫn folder chứa Views.
		bean.setPrefix("/WEB-INF/views/");
		
		//Tên đuôi của View
		bean.setSuffix(".jsp");
		return bean;
	}

}
