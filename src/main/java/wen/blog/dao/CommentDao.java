package wen.blog.dao;

import wen.blog.pojo.Comment;

import java.util.HashMap;
import java.util.List;

public interface CommentDao {

    // 根据博客 id 获取评论
    List<Comment> getCommentByBlogId(int blog_id);

    // 增加评论
    void saveComment(Comment comment);

    void updateCommentHit(int blog_id);

    // 管理页面获取所有没有审核的评论
    List<Comment> getAllComment();

    // 管理页面获取自己评论
    List<Comment> getMyselfComment(String username);

    // 根据博客 id 查询博客名称
    String getTitleByBlogId(int id);

    // 获取分页查询总数
    int selectCount();

    // 分页查询评论
    List<Comment> getCommentByPage(HashMap<String, Object> map);

    // 根据 id 获得评论者的邮件
    String getEmailByCommentId(Integer id);

    // 根据 id 值删除评论
    void deleteCommentById(Integer id);

    // 根据评论 id 获得博文 id
    Integer getBlogIdByCommentId(Integer id);

    // 减少评论次数
    void minusCommentHit(Integer blog_id);
    // 通过浏览者的评论
    int updatePassById(Integer id);

}
