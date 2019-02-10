package apptime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Date;
import java.util.TimeZone;
import java.text.SimpleDateFormat;
import java.text.DateFormat;

@SpringBootApplication
@RestController
public class Application {



    @RequestMapping("/")
    public String hello() {
        
        Date date = new Date();
        String strDateFormat = "HH:mm:ss\n";
        DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
        String formattedDate = dateFormat.format(date);
        
        return formattedDate;
    }


    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
