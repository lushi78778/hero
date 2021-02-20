package hui.hero.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import hui.hero.entity.Hero;
import hui.hero.service.HeroService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Hero控制层
 *
 * @author hui
 * @date 2021-02-20 20:13:40
 */
@Controller
@RequestMapping("/hero")
public class HeroController {

    @Resource
    private HeroService heroService;

    /**
     * 跳转首页
     *
     * @return 首页
     */
    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    /**
     * 分页查询英雄列表
     *
     * @param page  当前页码
     * @param limit 每页数据
     * @return JSON
     */
    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String list(int page, int limit) throws JsonProcessingException {
        //分页查询数据
        Page<Hero> heroPage = new Page<>(page, limit);
        IPage<Hero> iPage = heroService.page(heroPage);
        //总记录数
        int count = (int) iPage.getTotal();
        //下一页数据
        List<Hero> heros = iPage.getRecords();
        //构造返回值
        Map<String, Object> data = new HashMap<>(4);
        data.put("code", 0);
        data.put("msg", "");
        data.put("count", count);
        data.put("data", heros);
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(data);
    }

    /**
     * 保存英雄信息
     *
     * @param hero Hero对象
     * @return {code:返回码, msg:返回信息}
     */
    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Hero hero) throws JsonProcessingException {
        //初始化返回值
        int code;
        String msg;
        //将hero对象保存到数据库
        boolean state = heroService.save(hero);
        if (state) {
            code = 0;
            msg = "保存成功";
        } else {
            code = 1;
            msg = "保存失败";
        }
        //构造返回值
        Map<String, Object> data = new HashMap<>(2);
        data.put("code", code);
        data.put("msg", msg);
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(data);
    }
}
