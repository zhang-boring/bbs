package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.entity.UserEntity;
import bbs.game.cn.bbs.form.LoginForm;
import bbs.game.cn.bbs.form.RegisterForm;
import bbs.game.cn.bbs.service.UserService;
import bbs.game.cn.bbs.utils.PostEmailUtil;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户相关控制controller
 * @author 张宝运
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/{uid}")
    public ModelAndView user(@PathVariable("uid") Long uid) {
        return new ModelAndView("user");
    }

    /**
     * 用户登录:/user/login
     * @param form
     * @param result
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(@Valid LoginForm form, BindingResult result, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        //判断表单数据填写是否规范
        if (result.hasErrors()) {
            System.out.println(result.getFieldError().getDefaultMessage());
            modelAndView.addObject("errorInfo", result.getFieldError().getDefaultMessage());
            modelAndView.setViewName("redirect:/errorpage");
            return modelAndView;
        }
        UserDTO userInfo = userService.login(form);
        //判断登录结果
        if (userInfo == null) {
            modelAndView.addObject("errorInfo", "用户名或密码错误.");
            modelAndView.setViewName("redirect:/errorpage");
            return modelAndView;
        }
        //登陆成功后，获取主页用户相关信息
        userService.getNewMessage(userInfo);
        userService.getPostNum(userInfo);
        if (form.getHideid().equals("0")) {
            userService.updateCheckinTime(userInfo.getUid());
        }
        modelAndView.addObject("useraction", "login");
        request.getSession().setAttribute("user", userInfo);
        System.out.println(userInfo.toString());
        modelAndView.setViewName("loginfo");
        return modelAndView;
    }

    /**
     * 用户注册:/user/register
     * @param form
     * @param result
     * @param map
     * @return
     */
    @RequestMapping("/register")
    public ModelAndView register(@Valid RegisterForm form, BindingResult result, Map map) {
        if (result.hasErrors()) {
            System.out.println(result.getFieldError().getDefaultMessage());
            map.put("errorInfo", result.getFieldError().getDefaultMessage());
            return new ModelAndView("/error", map);
        }
        System.out.println(form.toString());
        UserEntity user = userService.register(form);
        System.out.println(user.toString());
        map.put("useraction", "register");
        return new ModelAndView("loginfo");
    }

    /**
     * 用户登出:/user/logout
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        request.getSession().removeAttribute("user");
        modelAndView.addObject("useraction", "logout");
        modelAndView.setViewName("loginfo");
        return modelAndView;
    }

    /**
     * ajax异步验证用户名，判断用户名是否可用:/user/unameajax
     * @param uname
     * @return
     */
    @RequestMapping("/unameajax")
    @ResponseBody
    public String unameAjax(@RequestBody String uname) {
        Map<String, String> map = new HashMap<String, String>();
        if (userService.findUserByUname(uname)) {
            //数据库中该用户名已存在，不能使用
            map.put("msg", "0");
        } else {
            //数据库中无此用户名，可以使用
            map.put("msg", "1");
        }
        JSONObject jsonObject = new JSONObject(map);
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }

    /**
     * ajax异步验证用户名，判断邮箱号是否可用:/user/emailajax
     * @param email
     * @return
     */
    @RequestMapping("/emailajax")
    @ResponseBody
    public String emailAjax(@RequestBody String email) {
        Map<String, String> map = new HashMap<String, String>();
        if (userService.findUserByEmail(email)) {
            //数据库中该邮箱号已存在，不能使用
            map.put("msg", "0");
        } else {
            //数据库中无此邮箱号，可以使用
            map.put("msg", "1");
        }
        JSONObject jsonObject = new JSONObject(map);
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }

    /**
     * ajax异步更改用户签名：/user/changesignature
     * @param uid
     * @param signature
     * @return
     */
    @RequestMapping("/changesignature")
    @ResponseBody
    public String changeSignature(@RequestParam("uid") String uid, @RequestParam("sig") String signature) {
        Long userid = Long.valueOf(uid);
        userService.editSignature(userid, signature);
        return signature;
    }

    /**
     * 找回密码：/user/repw
     * @param email
     */
    @RequestMapping("/repw")
    public ModelAndView repw(@RequestParam("email") String email, @RequestParam("uname") String uname) {
        ModelAndView modelAndView = new ModelAndView();
        if (userService.repw(email, uname) != null) {
            try {
                String pw = PostEmailUtil.postEmail(email);
                userService.changePW(uname, pw);
            } catch (MessagingException e) {
                e.printStackTrace();
                modelAndView.setViewName("error");
                modelAndView.addObject("errorinfo", "发送邮件错误！");
                return modelAndView;
            }
            modelAndView.setViewName("success");
            modelAndView.addObject("successinfo", "找回密码成功，请查看邮箱。");
            return modelAndView;
        } else {
            modelAndView.setViewName("error");
            modelAndView.addObject("errorinfo", "没有查到该用户，请检查用户名和邮箱。");
            return modelAndView;
        }
    }
}
