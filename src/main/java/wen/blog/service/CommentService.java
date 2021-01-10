package wen.blog.service;

import wen.blog.pojo.Comment;

import java.util.List;

public interface CommentService {

    // 根据博客 id 获取评论
    List<Comment> getCommentByBlogId(int blog_id);

    // 增加评论
    void updateComment(Comment comment);

    // 获取所有评论
    List<Comment> getAllComment();

    // 根据博客 id 查询博客名称
    String getTitleByBlogId(int id);

    // 根据 id 值删除评论
    void deleteCommentById(Integer id);

    //获取博主自己的评论
    List<Comment> getMyselfComment(String username);
}
