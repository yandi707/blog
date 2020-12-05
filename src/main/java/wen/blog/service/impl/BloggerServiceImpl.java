package wen.blog.service.impl;

import org.springframework.stereotype.Service;
import wen.blog.dao.BloggerDao;
import wen.blog.pojo.Blogger;
import wen.blog.service.BloggerService;

import javax.annotation.Resource;

@Service
public class BloggerServiceImpl implements BloggerService {

    @Resource
    private BloggerDao bloggerDao;

    @Override
    public boolean loginCheck(String username, String password) {
        Blogger blogger = bloggerDao.getLoginInfo();
        System.out.println("service: " + blogger.getUsername() + "  " + blogger.getPassword());
        if (username.equals(blogger.getUsername()) && password.equals(blogger.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String getBloggerEmail() {
        return bloggerDao.getBloggerEmail();
    }

    @Override
    public Blogger getLoginInfo() {
        return bloggerDao.getLoginInfo();
    }

    @Override
    public Blogger getBloggerByUsername(String username) {
        return bloggerDao.getBloggerByUsername(username);
    }

    @Override
    public Blogger getBloggerInfo() {
        return bloggerDao.getBloggerInfo();
    }

    @Override
    public void updateBloggerInfo(Blogger blogger) {
        bloggerDao.updateBloggerInfo(blogger);
    }

    @Override
    public Blogger findBloggerByUsername(String username) {
        return bloggerDao.findBloggerByUsername(username);
    }

}
