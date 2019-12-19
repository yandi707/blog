package wen.blog.service.impl;

import org.springframework.stereotype.Service;
import wen.blog.dao.BlogDao;
import wen.blog.dao.ReplyDao;
import wen.blog.pojo.Reply;
import wen.blog.service.ReplyService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    @Resource
    private ReplyDao replyDao;

    @Resource
    private BlogDao blogDao;

    @Override
    public List<Reply> getReplyListByCommentId(Integer comment_id) {
        return replyDao.getReplyListByCommentId(comment_id);
    }

    @Override
    public void addReply(Reply reply) {
        replyDao.addReply(reply);
    }

    @Override
    public List<Reply> getAllReply() {
        return replyDao.getAllReply();
    }

    @Override
    public void deleteReplyById(Integer id) {
        replyDao.deleteReplyById(id);
    }

    // 根据回复id查询博客标题
    @Override
    public String getBlogTitleByReplyId(int id) {
        String title = blogDao.getTitleById(replyDao.getBlogIdByReplyId(id));
        return title;
    }

    // 获取博客 id
    @Override
    public Integer getBlogIdByReplyId(Integer id) {
        Integer blogId = replyDao.getBlogIdByReplyId(id);
        return blogId;
    }

}
