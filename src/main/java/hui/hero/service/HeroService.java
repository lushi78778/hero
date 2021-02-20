package hui.hero.service;

import hui.hero.entity.Hero;
import hui.hero.dao.HeroDao;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 业务层实现类
 *
 * @author hui
 * @since 2021-02-20 20:09:21
 */
@Service
public class HeroService extends ServiceImpl<HeroDao, Hero> {
}
