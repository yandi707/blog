package wen.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
//    @RequestMapping("/manage")
//    public ModelAndView manage(HttpSession session) throws Exception {
//        String username = (String) session.getAttribute("userName");
//        ModelAndView modelAndView = new ModelAndView();
//
//        // 博客
//        //modelAndView.addObject("blogList", blogService.getAllBlog());
//
//        // 获取自己的文章
//        //modelAndView.addObject("blogSendList", blogService.getOneselfBlog(username));
//
//        // 类型
//        //modelAndView.addObject("blogTypeList", blogTypeService.getAllTypes());
//
//        // 评论
////        List<Comment> commentList = commentService.getAllComment();
////        for (Comment comment : commentList) {
////            comment.setBlogTitle(commentService.getTitleByBlogId(comment.getBlog_id()));
////        }
////        modelAndView.addObject("commentList", commentList);
//
//        // 回复
//        List<Reply> replyList = replyService.getAllReply();
//        for (Reply reply : replyList) {
//            Integer id = reply.getId();
//            reply.setBlog_id(replyService.getBlogIdByReplyId(id));
//            reply.setBlogTitle(replyService.getBlogTitleByReplyId(id));
//            System.out.println(reply.toString());
//        }
//        modelAndView.addObject("replyList", replyList);
//
//        // 链接
//        modelAndView.addObject("linkList", linkService.getAllLink());
//
//        // 博主
//        modelAndView.addObject("blogger", bloggerService.getBloggerInfo());
//
//        modelAndView.setViewName("../back/admin");
//        return modelAndView;
//    }

    //获取自己的文章
    @RequestMapping("/my/getOneselfList")
    public ModelAndView getOneselfList(HttpSession session){
        String username = (String) session.getAttribute("userName");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("blogSendList", blogService.getOneselfBlog(username));
        modelAndView.addObject("blogDshList", blogService.getDshBlog(username));
        modelAndView.addObject("blogYbhList", blogService.getYbhBlog(username));
        modelAndView.setViewName("../back/blog/blogManger");
        return modelAndView;
    }

    //复审操作
    @RequestMapping("/my/fsOperate/{id}")
    public String fsOperate(@RequestParam(required = false) Integer id){
        int flag = blogService.updateFsById(id);
        return "redirect:/my/getOneselfList.do";
    }

    //文章类型
    @RequestMapping("/wz/typeList")
    public ModelAndView typeList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("blogTypeList", blogTypeService.getAllTypes());
        modelAndView.setViewName("../back/type/typeManger");
        return modelAndView;
    }

   //回复博主消息的列表
    @RequestMapping("/send/sendList")
    public ModelAndView sendList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("blogList", blogService.getAllBlog());
        modelAndView.setViewName("../back/send/sendManger");
        return modelAndView;
    }
    //通过操作
    @RequestMapping("/send/pass/{id}")
    public String pass(@RequestParam(required = false) Integer id){
        int flag = blogService.updatePassById(id);
        return "redirect:/send/sendList.do";
    }
    //驳回操作
    @RequestMapping("/send/bhOperate")
    public String bhOperate(Blog blog,@RequestParam Integer bhId){
        blog.setId(bhId);
        int flag = blogService.insertBhMessage(blog);
        return "redirect:/send/sendList.do";
    }



    //浏览者评论
    @RequestMapping("/pl/commentList")
    public ModelAndView commentList(HttpSession session){
        String username = (String) session.getAttribute("userName");
        ModelAndView modelAndView = new ModelAndView();
        List<Comment> commentList = commentService.getMyselfComment(username);
        for (Comment comment : commentList) {
            comment.setBlogTitle(commentService.getTitleByBlogId(comment.getBlog_id()));
        }
        modelAndView.addObject("commentList", commentList);
        modelAndView.setViewName("../back/comment/commentManger");
        return modelAndView;
    }
    //审核评论
    @RequestMapping("/checkComment/checkCommentList")
    public ModelAndView checkCommentList(){
        ModelAndView modelAndView = new ModelAndView();
        List<Comment> checkCommentList = commentService.getAllComment();
        for (Comment comment : checkCommentList) {
            comment.setBlogTitle(commentService.getTitleByBlogId(comment.getBlog_id()));
        }
        modelAndView.addObject("checkCommentList", checkCommentList);
        modelAndView.setViewName("../back/comment/checkCommentManger");
        return modelAndView;
    }

    //回复评论
    @RequestMapping("/hf/replyList")
    public ModelAndView replyList(){
        ModelAndView modelAndView = new ModelAndView();
        List<Reply> replyList = replyService.getAllReply();
        for (Reply reply : replyList) {
            Integer id = reply.getId();
            reply.setBlog_id(replyService.getBlogIdByReplyId(id));
            reply.setBlogTitle(replyService.getBlogTitleByReplyId(id));
            System.out.println(reply.toString());
        }
        modelAndView.addObject("replyList", replyList);
        modelAndView.setViewName("../back/reply/replyManger");
        return modelAndView;
    }
    //友情链接
    @RequestMapping("/lj/linkList")
    public ModelAndView linkList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("linkList", linkService.getAllLink());
        modelAndView.setViewName("../back/link/linkManger");
        return modelAndView;
    }
    //个人信息
    @RequestMapping("/gr/informationList")
    public ModelAndView informationList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("blogger", bloggerService.getBloggerInfo());
        modelAndView.setViewName("../back/information/informationManger");
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
