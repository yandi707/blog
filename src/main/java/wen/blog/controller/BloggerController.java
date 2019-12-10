package wen.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import wen.blog.pojo.Blogger;
import wen.blog.service.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("/admin")
public class BloggerController {

    @Resource
    private BlogService blogService;
    @Resource
    private BlogTypeService blogTypeService;
    @Resource
    private CommentService commentService;
    @Resource
    private ReplyService replyService;
    @Resource
    private LinkService linkService;
    @Resource
    private BloggerService bloggerService;

    // 管理员界面
    @RequestMapping("/manage")
    public ModelAndView manage() throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        // 博客
        modelAndView.addObject("blogList", blogService.getAllBlog());

        // 类型
        modelAndView.addObject("blogTypeList", blogTypeService.getAllTypes());

        // 评论
        modelAndView.addObject("commentList", commentService.getAllComment());

        // 回复
        modelAndView.addObject("replyList", replyService.getAllReply());

        // 链接
        modelAndView.addObject("linkList", linkService.getAllLink());

        // 博主
        modelAndView.addObject("blogger", bloggerService.getBloggerInfo());

        modelAndView.setViewName("../back/admin");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/modifyBloggerInfo")
    public boolean modifyBloggerInfo(@RequestBody Blogger blogger) {
        if (blogger.getUsername().equals("")) {
            return false;
        } else {
            bloggerService.updateBloggerInfo(blogger);
            return true;
        }
    }

}
