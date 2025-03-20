package ??{projectname}.controller;
import ??{projectname}.service.ReadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

@RestController
@Produces(MediaType.APPLICATION_JSON)
@Slf4j
public class ReadController {
    @Autowired
    ReadService readService;
    
    @RequestMapping(value="/", method = RequestMethod.GET, produces = "application/json")
    public String homepage() {
	return "Hello World";
    }

    @RequestMapping(value = "/testRead", method = RequestMethod.GET, produces = "application/json")
    public String testRead() {
	log.info("Hello World");
    	return "Hello World";
    }

    @RequestMapping(value = "/testRead1", method = RequestMethod.GET, produces = "application/json")
    public String testRead1() {
        return readService.testRead1();
    }

    @RequestMapping(value = "/testRead2", method = RequestMethod.GET, produces = "application/json")
    public String testRead2() {
        String name="dave";
        return readService.testRead2(name);
    }

    @RequestMapping(value = "/testRead3", method = RequestMethod.GET, produces = "application/json")
    public String testRead3(String name) {
	return readService.testRead2(name);
    }

    @RequestMapping (value = "/**", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json")
    public ResponseEntity<String> defaultPath() {
    	log.info("Unmapped request handling!");
    	return new ResponseEntity<String>("Not found", HttpStatus.OK);
}

}

