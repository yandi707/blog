package wen.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import wen.blog.pojo.Link;
import wen.blog.service.LinkService;

import javax.annotation.Resource;

@Controller
public class LinkController {

    @Resource
    private LinkService linkService;

    @ResponseBody
    @RequestMapping("/addLink")
    public boolean addLink(@RequestBody Link link) {
        if (link.getLinkUrl().equals("")) {
            return false;
        } else {
            linkService.addLink(link);
            return true;
        }
    }

    @RequestMapping("/deleteLinkById")
    public ModelAndView deleteLinkById(@RequestParam(required = false) Integer deleteLinkId) {
        ModelAndView modelAndView = new ModelAndView();
        if (deleteLinkId != null) {
            linkService.deleteLinkById(deleteLinkId);
        }
        modelAndView.setViewName("redirect:admin/manage.do");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/modifyLink")
    public boolean modifyLink(@RequestBody Link link) {
        if (link.getId() == null) {
            return false;
        } else {
            linkService.updateLink(link);
            return true;
        }
    }

}
