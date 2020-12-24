package wen.blog.service;

import wen.blog.pojo.Blog;
import wen.blog.pojo.Page;

import java.util.List;

public interface BlogService {

    // 首页查询博客
    List<Blog> getForeBlog();

    // 获取分页查询总数
    int selectCount();

    // 分页查询博客
    Page<Blog> getBlogByPage(int currentPage);

    // 获取所有博客
    List<Blog> getAllBlog();

    //获取登陆者自己的博文
    List<Blog> getOneselfBlog(String username);

    // 博客详情
    Blog getBlogById(int id);

    // 刷新访问量
    void updateClickHitById(int id);

    // 获取六个最新博客
    List<Blog> getSix();

    // 获取该分类下分页查询总数
    int selectCountByBlogType(int blogTypeId);

    // 分类分页查询博客
    Page<Blog> getPageByBlogType(int currentPage, int blogTypeId);

    // 添加博客
    void insertBlog(Blog blog);

    // 删除博文
    void deleteBlogById(int id);

    // 修改博文
    void updateBlogById(Blog blog);

    // 获取 id
    Integer getIdByTitle(String title);

    // 搜索博文
    List<Integer> searchBlog(String str);

    //send页面通过操作
    int updatePassById(int id);


    int insertBhMessage(Blog blog);
}
