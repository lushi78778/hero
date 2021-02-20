package hui.hero;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 项目入口
 *
 * @author hui
 * @date 2021-02-20 20:06:00
 */
@MapperScan("hui.hero.dao")
@SpringBootApplication
public class HeroApplication {

    public static void main(String[] args) {
        SpringApplication.run(HeroApplication.class, args);
    }

}
