package wen.blog.service.impl;

import org.springframework.stereotype.Service;
import wen.blog.dao.LinkDao;
import wen.blog.pojo.Link;
import wen.blog.pojo.Page;
import wen.blog.service.LinkService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service
public class LinkServiceImpl implements LinkService {

    @Resource
    private LinkDao linkDao;

    @Override
    public List<Link> getAllLink() {
        return linkDao.getAllLink();
    }

    @Override
    public void addLink(Link link) {
        linkDao.addLink(link);
    }

    @Override
    public void deleteLinkById(Integer id) {
        linkDao.deleteLinkById(id);
    }

    @Override
    public void updateLink(Link link) {
        linkDao.updateLink(link);
    }

}
