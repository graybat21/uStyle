<<<<<<< HEAD
//package com.ustyle.utils;
//
=======
package com.ustyle.utils;

>>>>>>> c0e29977c3d1543e4c2375f5938a8b95ea95adcb
//import org.springframework.beans.BeansException;
//import org.springframework.beans.factory.config.BeanDefinition;
//import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
//import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
//import org.springframework.web.context.WebApplicationContext;
//
//public class CustomBeanFactoryPostProcessor implements BeanFactoryPostProcessor {
//	
//	@Override
//	public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
//		BeanDefinition tilesBd = beanFactory.getBeanDefinition("tilesConfigurer");
////		BeanDefinition swagger2ConfigBd = beanFactory.getBeanDefinition("swagger2Config");
//		BeanDefinition documentationPluginsBootstrapperBd = beanFactory.getBeanDefinition("documentationPluginsBootstrapper");
//		tilesBd.setScope(WebApplicationContext.SCOPE_REQUEST);
////		swagger2ConfigBd.setScope(WebApplicationContext.SCOPE_REQUEST);
//		documentationPluginsBootstrapperBd.setScope(WebApplicationContext.SCOPE_REQUEST);
//	}
//}