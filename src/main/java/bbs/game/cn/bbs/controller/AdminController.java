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

    /**
     * 管理员登陆
     * @param adminEntity
     * @param request
     * @return
     */
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

    /**
     * 删除板块按钮
     * @param forumid
     * @param request
     * @return
     */
    @RequestMapping("/remove")
    public ModelAndView removeForum(@RequestParam("forumid") String forumid, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("rmforum");
        modelAndView.addObject("forumid", forumid);
        modelAndView.addObject("forumname", forumService.findForumnameByForumid(Long.valueOf(forumid)));
        modelAndView.addObject("forum", forumService.findForum(Long.valueOf(forumid)));
        modelAndView.addObject("forumsname", forumService.findSimpleForumInfo(Long.valueOf(forumid)));
        return modelAndView;
    }

    /**
     * 修改板块内容
     * @param forumid
     * @param request
     * @return
     */
    @RequestMapping("/modify")
    public ModelAndView modify(@RequestParam("forumid") String forumid, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("adminmodify");
        modelAndView.addObject("forumsname", forumService.findSimpleForumInfo(Long.valueOf(forumid)));
        return modelAndView;
    }

    /**
     * 管理员退出登录
     * @param request
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().removeAttribute("admin");
        return "redirect:/admin";
    }

    /**
     * 版块列表
     * @param request
     * @return
     */
    @RequestMapping("/list")
    public ModelAndView list(HttpServletRequest request) {
        if (request.getSession().getAttribute("admin") != null) {
            ModelAndView modelAndView = new ModelAndView("admin");
            modelAndView.addObject("forums", forumService.findAll(null));
            return modelAndView;
        }
        return new ModelAndView("adminlogin");
    }

    /**
     * 确定删除版块
     * @param request
     * @return
     */
    @RequestMapping("execrm")
    public String execrm(HttpServletRequest request) {
        String rmtype = (String) request.getAttribute("rmtype");
        Long forumid = Long.parseLong((String) request.getAttribute("forumid"));
        if (rmtype.equals("1")) {
            forumService.rmAll(forumid);
        } else {
            Long toForumid = Long.parseLong((String) request.getAttribute("toforum"));
            forumService.mvTo(forumid, toForumid);
        }
        return "redirect:/admin";
    }
}
