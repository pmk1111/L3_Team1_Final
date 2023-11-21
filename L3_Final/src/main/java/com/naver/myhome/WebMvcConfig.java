package com.naver.myhome;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.naver.myhome.interceptor.AuthenticationInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Value("${my.savepath}")
	private String saveFolder;

	private static final String[] CLASSPATH_RESOURCE_LOCATIONS
	= {
			"classpath:/static/",
			"classpath:/templates/",
	};

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("forward:/home/home");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
		.addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
		registry.addResourceHandler("/upload/**")
		.addResourceLocations( saveFolder  ); 

	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    String[] excludePatterns = {
	    	"/widus/",
	        "/user/login",
	        "/user/join",
	        "/user/check-email",
	        "/user/send-mail-auth-code",
	        "/user/check-auth-code",
	        "/resources/**"
	    };

	    registry.addInterceptor(new AuthenticationInterceptor())
	            .addPathPatterns("/**")
	            .excludePathPatterns(excludePatterns);
	}


}
