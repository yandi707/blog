package wen.blog.dao;

import org.springframework.stereotype.Repository;
import wen.blog.pojo.Link;

import java.util.HashMap;
import java.util.List;

@Repository
public interface LinkDao {

    // 查询所有链接名称
    List<Link> getAllLink();

    // 获取分页查询总数
    Integer selectCount();

    // 分页查询评论
    List<Link> getLinkByPage(HashMap<String, Object> map);

    // 增加链接
    void addLink(Link link);

    // 根据 id 删除链接
    void deleteLinkById(Integer id);

    // 更新链接
    void updateLink(Link link);

}
