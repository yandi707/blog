package wen.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import wen.blog.pojo.Blog;
import wen.blog.pojo.BlogType;
import wen.blog.service.BlogService;
import wen.blog.service.BlogTypeService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    private BlogService blogService;
    @Resource
    private BlogTypeService blogTypeService;

    // 访问主页
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Blog> blogList = blogService.getForeBlog();
        modelAndView.addObject("blogList", blogList);
        modelAndView.setViewName("../fore/index");
        return modelAndView;
    }

    // 按页查看博客
    @RequestMapping("/setPage")
    public ModelAndView setPage(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        // 分页
        modelAndView.addObject("pageInfo", blogService.getBlogByPage(currentPage));

        // 获取所有的博客类别
        List<BlogType> blogTypeList = blogTypeService.getAllTypes();
        modelAndView.addObject("blogTypeList", blogTypeList);

        modelAndView.setViewName("../fore/more");
        return modelAndView;
    }

}
