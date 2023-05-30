package com.davisy.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class I18NConfig implements WebMvcConfigurer {
	
	@Bean("messageSource")
	public MessageSource getMessageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasenames("i18n/layout");
		ms.setDefaultEncoding("utf-8");
		return ms;
	}

	@Bean("localeResolver")
	public LocaleResolver localeResolver() {
		CookieLocaleResolver rs = new CookieLocaleResolver();
		rs.setDefaultLocale(new Locale("vi"));
		rs.setCookieMaxAge(10*24*60*60); // 10 ngày
		rs.setCookiePath("/");
		return rs;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor locale = new LocaleChangeInterceptor();
		locale.setParamName("lang");
		registry.addInterceptor(locale).addPathPatterns("/**");
	}



}
