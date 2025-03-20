package ??{projectname}.service;

import org.springframework.stereotype.Component;

@Component
public class ReadService {
    public String testRead1() {
	return "Hello world from service";
    }

    public String testRead2(String name) {
        return "Hello " + name + " from Java Springboot";
    }


}
