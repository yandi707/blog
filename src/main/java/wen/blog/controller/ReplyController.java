package wen.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import wen.blog.pojo.Reply;
import wen.blog.service.ReplyService;

import javax.annotation.Resource;

@Controller
public class ReplyController {

    @Resource
    private ReplyService replyService;

    @ResponseBody
    @RequestMapping("/replyComment")
    public boolean replyComment(@RequestBody Reply reply) {
        if (reply.getCommentId() == null) {
            return false;
        } else {
            replyService.addReply(reply);
            return true;
        }
    }

    @ResponseBody
    @RequestMapping("/deleteReplyById")
    public boolean deleteReplyById(@RequestBody Reply reply) {
        if (reply.getId() == null) {
            return false;
        } else {
            replyService.deleteReplyById(reply.getId());
            return true;
        }
    }

}
