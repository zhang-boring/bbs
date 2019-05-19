package bbs.game.cn.bbs.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class PostImageConfigurer implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/postimages/**").addResourceLocations("file:C:\\Users\\Curtis\\IdeaProjects\\bbs\\src\\main\\resources\\static\\postimages\\");
    }
}
