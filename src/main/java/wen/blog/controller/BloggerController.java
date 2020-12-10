package wen.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import wen.blog.pojo.Blog;
import wen.blog.pojo.Blogger;
import wen.blog.pojo.Comment;
import wen.blog.pojo.Reply;
import wen.blog.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.util.List;

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
    public ModelAndView manage(HttpSession session) throws Exception {
        String username = (String) session.getAttribute("userName");
        ModelAndView modelAndView = new ModelAndView();

        // 博客
        //modelAndView.addObject("blogList", blogService.getAllBlog());

        // 获取自己的文章
        modelAndView.addObject("blogSendList", blogService.getOneselfBlog(username));

        // 类型
        modelAndView.addObject("blogTypeList", blogTypeService.getAllTypes());

        // 评论
        List<Comment> commentList = commentService.getAllComment();
        for (Comment comment : commentList) {
            comment.setBlogTitle(commentService.getTitleByBlogId(comment.getBlog_id()));
        }
        modelAndView.addObject("commentList", commentList);

        // 回复
        List<Reply> replyList = replyService.getAllReply();
        for (Reply reply : replyList) {
            Integer id = reply.getId();
            reply.setBlog_id(replyService.getBlogIdByReplyId(id));
            reply.setBlogTitle(replyService.getBlogTitleByReplyId(id));
            System.out.println(reply.toString());
        }
        modelAndView.addObject("replyList", replyList);

        // 链接
        modelAndView.addObject("linkList", linkService.getAllLink());

        // 博主
        modelAndView.addObject("blogger", bloggerService.getBloggerInfo());

        modelAndView.setViewName("../back/admin");
        return modelAndView;
    }
    //这个不行
    @RequestMapping("/send/sendList")
    @ResponseBody
    public List sendList(){
       List<Blog> sendList = blogService.getAllBlog();
        return sendList;
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
