package wen.blog.service;

import wen.blog.pojo.Link;

import java.util.List;

public interface LinkService {

    // 查询所有链接名称
    List<Link> getAllLink();

    // 增加链接
    void addLink(Link link);

    // 根据 id 删除链接
    void deleteLinkById(Integer id);

    // 更新链接
    void updateLink(Link link);

}
