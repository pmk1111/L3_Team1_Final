package com.naver.myhome;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;

@Configuration
@EnableCaching
public class CacheConfig extends CachingConfigurerSupport {

    @Bean
    public EhCacheCacheManager cacheManager() {
        return new EhCacheCacheManager(ehCacheCacheManager().getObject());
    }

    @Bean
    public EhCacheManagerFactoryBean ehCacheCacheManager() {
        EhCacheManagerFactoryBean cacheFactory = new EhCacheManagerFactoryBean();
        cacheFactory.setConfigLocation(new ClassPathResource("ehcache.xml"));
        cacheFactory.setShared(true);
        return cacheFactory;
    }
}
