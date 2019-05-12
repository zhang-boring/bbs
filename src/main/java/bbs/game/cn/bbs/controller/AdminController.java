package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.entity.AdminEntity;
import bbs.game.cn.bbs.service.AdminService;
import bbs.game.cn.bbs.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    private ForumService forumService;

    @RequestMapping("/login")
    public ModelAndView login(AdminEntity adminEntity, HttpServletRequest request) {
        if (adminService.login(adminEntity) != null) {
            ModelAndView modelAndView = new ModelAndView("admin");
            request.getSession().setAttribute("admin", adminEntity.getAname());
            modelAndView.addObject("forums", forumService.findAll(null));
            return modelAndView;
        }
        ModelAndView modelAndView = new ModelAndView("redirect:/errorpage");
        modelAndView.addObject("errorInfo", "请检查输入的管理员用户名和密码。");
        return modelAndView;
    }

    @RequestMapping("/remove")
    public ModelAndView removeForum(@RequestParam("forumid") String forumid, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("rmforum");
        modelAndView.addObject("forumid", forumid);
        return modelAndView;
    }

    @RequestMapping("/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().removeAttribute("admin");
        return "redirect:/admin";
    }
}
