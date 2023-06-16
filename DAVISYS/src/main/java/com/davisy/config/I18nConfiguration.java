package com.davisy.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class I18nConfiguration implements WebMvcConfigurer {
	@Bean("messageSource")
	public MessageSource getMessageResource() {
		ReloadableResourceBundleMessageSource ms = new ReloadableResourceBundleMessageSource();
		ms.setBasenames(
				"classpath:i18n/aside",
				"classpath:i18n/menu",
				"classpath:i18n/main"
		);
		ms.setDefaultEncoding("utf-8");
		return ms;
	}
	
	@Bean("localeResolver")
	public LocaleResolver getLocaleResolver() {
		CookieLocaleResolver resolver = new CookieLocaleResolver();
		resolver.setDefaultLocale(new Locale("vi"));
		
		  resolver.setCookiePath("/"); resolver.setCookieMaxAge(60 * 60);
		  // 60 minutes
		return resolver;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor li = new LocaleChangeInterceptor();
		li.setParamName("lg");
		
		registry.addInterceptor(li).addPathPatterns("/**");
	}

}
