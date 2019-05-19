package bbs.game.cn.bbs;

import bbs.game.cn.bbs.listener.ApplicationStartupListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BbsApplication {
    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(BbsApplication.class);
        springApplication.addListeners(new ApplicationStartupListener());
        springApplication.run(args);
    }

}
