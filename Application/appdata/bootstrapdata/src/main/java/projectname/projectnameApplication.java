package ??{projectname};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Slf4j
@SpringBootApplication
//@ComponentScan(basePackages="controller")
public class ??{projectname}Application extends SpringBootServletInitializer {

	@Override
    	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        	return application.sources(??{projectname}Application.class);
    	}

	public static void main(String[] args) {
		SpringApplication.run(??{projectname}Application.class, args);
		log.info("Starting");
	}

    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedOrigins("localhost", "crudbackend");
            }
        };
    }

}
