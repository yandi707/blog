package wen.blog.service.impl;

import org.springframework.stereotype.Service;
import wen.blog.dao.CommentDao;
import wen.blog.pojo.Comment;
import wen.blog.service.CommentService;

import javax.annotation.Resource;
import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;
    @Resource
    private CommentService commentService;

    @Override
    public List<Comment> getCommentByBlogId(int blog_id) {
        return commentDao.getCommentByBlogId(blog_id);
    }

    @Override
    public void updateComment(Comment comment) {
        commentDao.saveComment(comment);
        commentDao.updateCommentHit(comment.getBlog_id());
    }

    @Override
    public List<Comment> getAllComment() {
        return commentDao.getAllComment();
    }

    @Override
    public String getTitleByBlogId(int id) {
        return commentDao.getTitleByBlogId(id);
    }

    @Override
    public void deleteCommentById(Integer id) {
        Integer blog_id = commentDao.getBlogIdByCommentId(id);
        commentDao.minusCommentHit(blog_id);
        commentDao.deleteCommentById(id);
    }

    //获得自己的评论
    @Override
    public List<Comment> getMyselfComment(String username) {
        return commentDao.getMyselfComment(username);
    }

}
