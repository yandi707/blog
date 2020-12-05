package wen.blog.dao;

import org.springframework.stereotype.Repository;
import wen.blog.pojo.Blogger;

@Repository
public interface BloggerDao {

    // 验证登录
    Blogger getLoginInfo();

    // 获取博主电子邮件地址
    String getBloggerEmail();

    // shiro 验证
    Blogger getBloggerByUsername(String username);

    // 获取博主信息
    Blogger getBloggerInfo();

    // 更新博主信息
    void updateBloggerInfo(Blogger blogger);

    // shiro    权限验证
    Blogger findBloggerByUsername(String username);

}
