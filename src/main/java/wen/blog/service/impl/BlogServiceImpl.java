package wen.blog.service.impl;

import org.springframework.stereotype.Service;
import wen.blog.dao.BlogDao;
import wen.blog.pojo.Blog;
import wen.blog.pojo.Page;
import wen.blog.service.BlogService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

    @Resource
    private BlogDao blogDao;

    @Override
    public List<Blog> getForeBlog() {
        return blogDao.getForeBlog();
    }

    @Override
    public int selectCount() {
        return blogDao.selectCount();
    }

    @Override
    public Page<Blog> getBlogByPage(int currentPage) {
        HashMap<String, Object> map = new HashMap<>();
        Page<Blog> page = new Page<>();

        // 当前页数
        page.setCurrentPage(currentPage);

        // 每页显示条数
        int pageSize = 3;
        page.setPageSize(3);

        // 记录总数
        int sum = blogDao.selectCount();
        page.setSum(sum);

        // 总页数
        double decimal = sum;
        Double num = Math.ceil(decimal / pageSize);
        page.setTotalPage(num.intValue());

        // 设置开始结束页数
        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", page.getPageSize());

        // 每页显示的数据
        List<Blog> blogList = blogDao.getBlogByPage(map);
        page.setBlogList(blogList);

        return page;
    }

    @Override
    public List<Blog> getAllBlog() {
        return blogDao.getAllBlog();
    }

    //获取登陆者自己的文章
    public List<Blog> getOneselfBlog(String username){
        return blogDao.getOneselfBlog(username);
    }
    //获取待审核的文章
    @Override
    public List<Blog> getDshBlog(String username) {
        return blogDao.getDshBlog(username);
    }
    //获取已驳回的文章
    public List<Blog> getYbhBlog(String username) {
        return blogDao.getYbhBlog(username);
    }

    @Override
    public Blog getBlogById(int id) {
        return blogDao.getBlogById(id);
    }

    @Override
    public void updateClickHitById(int id) {
        blogDao.updateClickHitById(id);
    }

    @Override
    public List<Blog> getSix() {
        return blogDao.getSix();
    }

    @Override
    public int selectCountByBlogType(int blogTypeId) {
        return blogDao.selectCountByBlogType(blogTypeId);
    }

    @Override
    public Page<Blog> getPageByBlogType(int currentPage, int blogTypeId) {
        HashMap<String, Object> map = new HashMap<>();
        Page<Blog> page = new Page<>();

        // 当前页数
        page.setCurrentPage(currentPage);

        // 每页显示条数
        int pageSize = 6;
        page.setPageSize(6);

        // 记录总数
        int sum = blogDao.selectCountByBlogType(blogTypeId);
        page.setSum(sum);

        // 总页数
        double decimal = sum;
        Double num = Math.ceil(decimal / pageSize);
        page.setTotalPage(num.intValue());

        // 设置开始结束页数
        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", page.getPageSize());
        map.put("blogTypeId", blogTypeId);

        // 每页显示的数据
        List<Blog> blogList = blogDao.getPageByBlogType(map);
        page.setBlogList(blogList);

        return page;
    }

    @Override
    public void insertBlog(Blog blog) {
        blogDao.insertBlog(blog);
    }

    @Override
    public void deleteBlogById(int id) {
        blogDao.deleteBlogById(id);
        blogDao.deleteCommentByBlogId(id);
    }

    @Override
    public void updateBlogById(Blog blog) {
        blogDao.updateBlogById(blog);
    }

    @Override
    public Integer getIdByTitle(String title) {
        return blogDao.getIdByTitle(title);
    }

    @Override
    public List<Integer> searchBlog(String str) {
        return blogDao.searchBlog(str);
    }
    //通过操作
    @Override
    public int updatePassById(int id) {
        return blogDao.updatePassById(id);
    }

    //复审操作
    @Override
    public int updateFsById(int id) {
        return blogDao.updateFsById(id);
    }


    @Override
    public int insertBhMessage(Blog blog) {
        return blogDao.insertBhMessage(blog);
    }

    @Override
    public List<Blog> getOneselfNew(String username) {
        return blogDao.getOneselfNew(username);
    }
    //设置消息为已读
    @Override
    public int turnToRead(Integer id) {
        return blogDao.turnToRead(id);
    }

}
