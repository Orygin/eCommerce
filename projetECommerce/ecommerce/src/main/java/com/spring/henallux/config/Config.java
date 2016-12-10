package com.spring.henallux.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.orm.jpa.vendor.HibernateJpaSessionFactoryBean;
import org.springframework.validation.DefaultMessageCodesResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class Config extends WebMvcConfigurerAdapter {
	@Bean
	public DefaultMessageCodesResolver defaultMessageCodesResolver(){
		DefaultMessageCodesResolver defaultMessageCodesResolver = new DefaultMessageCodesResolver();
		return defaultMessageCodesResolver;
	}
	
	@Bean
	public ResourceBundleMessageSource messageSource(){
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setBasenames("translations/general", "translations/errors");
		messageSource.setUseCodeAsDefaultMessage(true);
		return messageSource;
	}
	
	@Bean
	public LocaleResolver localeResolver(){
		CookieLocaleResolver resolver = new CookieLocaleResolver();
		resolver.setDefaultLocale(new Locale("fr"));
		resolver.setCookieName("myLocaleCookie");
		resolver.setCookieMaxAge(-1);
		return resolver;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry){
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		interceptor.setParamName("locale");
		registry.addInterceptor(interceptor);
	}
	
	@Bean
	public HibernateJpaSessionFactoryBean sessionFactory(){
		return new HibernateJpaSessionFactoryBean();
	}
}
