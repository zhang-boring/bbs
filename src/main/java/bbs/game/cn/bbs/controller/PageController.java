package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.convert.BufferedImage2BASE64String;
import bbs.game.cn.bbs.dto.ForumDTO;
import bbs.game.cn.bbs.dto.IndexDTO;
import bbs.game.cn.bbs.dto.PartDTO;
import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.service.*;
import bbs.game.cn.bbs.utils.ImageCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 基本页面跳转controller
 * @author 张宝运
 */
@Controller
public class PageController {
    @Autowired
    UserService userService;
    @Autowired
    PartService partService;
    @Autowired
    ForumService forumService;
    @Autowired
    PostService postService;
    @Autowired
    IndexService indexService;

    /**
     * 主页:/index
     * @param map
     * @param request
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index(Map<String, Object> map, HttpServletRequest request) {
        map.put("page", "index");
        HttpSession session = request.getSession();
        if (session.getAttribute("loaded") != null) {
            session.setAttribute("loaded", "true");
            if (session.getAttribute("user") != null) {
                map.put("ustate", "loggedin");
            } else {
                map.put("ustate", "login");
            }
            return new ModelAndView("/index", map);
        }
        UserDTO userInfo = (UserDTO) request.getSession().getAttribute("user");
        List<ForumDTO> forums;
        if (userInfo != null) {
            map.put("ustate", "loggedin");
            forums = forumService.findAll(userInfo.getUid());
        } else {
            map.put("ustate", "login");
            forums = forumService.findAll(null);
        }
        IndexDTO indexDTO = indexService.getIndexPageInfo();
        session.setAttribute("indexDTO", indexDTO);
        /*
        首页主要展示的信息，论坛分区及版块
         */
        List<PartDTO> parts = partService.findAll();
        session.setAttribute("forums", forums);
        session.setAttribute("parts", parts);
        return  new ModelAndView("/index", map);
    }

    /**
     * 登录页:/login
     * @param map
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(Map<String, Object> map, HttpServletRequest request) {
        if (request.getSession().getAttribute("user") != null) {
            return new ModelAndView("index");
        } else {
            map.put("ustate", "login");
            return new ModelAndView("login", map);
        }
    }

    /**
     * 注册页:/register
     * @return
     */
    @RequestMapping("/register")
    public ModelAndView singIn(ModelAndView modelAndView, HttpServletRequest request) throws IOException {
        Object[] images = ImageCodeUtil.createImage();
        request.getSession().setAttribute("imagecode", images[0].toString());

        String imageBASE64 = BufferedImage2BASE64String.convert((BufferedImage) images[1]);

        modelAndView.addObject("ustate", "register");
        modelAndView.setViewName("register");
        modelAndView.addObject("imagebase64",imageBASE64);
        return modelAndView;
    }

    /**
     * 错误页，返回错误信息:/errorpage
     * @param errorInfo
     * @return
     */
    @RequestMapping("/errorpage")
    public ModelAndView error(String errorInfo) {
        ModelAndView modelAndView = new ModelAndView("error");
        modelAndView.addObject("errorinfo", errorInfo);
        return modelAndView;
    }

    /**
     * 忘记密码页:/retrievepw
     * @return
     */
    @RequestMapping("/retrievepw")
    public ModelAndView forget() {
        return new ModelAndView("retrievepw");
    }

    /**
     * 发布文章页面
     * @return
     */
    @RequestMapping("/newpost")
    public ModelAndView newPostPage() {
        return new ModelAndView("new");
    }
}
