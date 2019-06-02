package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.entity.AdminEntity;
import bbs.game.cn.bbs.entity.ForumEntity;
import bbs.game.cn.bbs.entity.PartEntity;
import bbs.game.cn.bbs.service.AdminService;
import bbs.game.cn.bbs.service.ForumService;
import bbs.game.cn.bbs.service.PartService;
import bbs.game.cn.bbs.utils.RandomValue;
import com.alibaba.fastjson.JSONObject;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    private ForumService forumService;
    @Autowired
    private PartService partService;

    @Value(value = "${icon.storage.forum.path}")
    private String forumIconStoragePath;

    @Value(value = "${icon.storage.forum.url}")
    private String forumIconUrl;

    /**
     * 管理员登陆
     * @param adminEntity
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(AdminEntity adminEntity, HttpServletRequest request) {
        if (request.getSession().getAttribute("admin") != null) {
            ModelAndView modelAndView = new ModelAndView("admin");
            modelAndView.addObject("forums", forumService.findAll(null));
            return modelAndView;
        }
        if (adminService.login(adminEntity) == null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/errorpage");
            modelAndView.addObject("errorInfo", "请检查输入的管理员用户名和密码。");
            return modelAndView;
        }
        ModelAndView modelAndView = new ModelAndView("admin");
        request.getSession().setAttribute("admin", adminEntity.getAname());
        request.getSession().setAttribute("aid", adminEntity.getAid());
        modelAndView.addObject("forums", forumService.findAll(null));
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
     * 删除分区页面
     * @return
     */
    @RequestMapping("/rmpart")
    public ModelAndView rmpart(@RequestParam("partid") String partid) {
        PartEntity partEntity = partService.findByPartid(Long.valueOf(partid));
        ModelAndView modelAndView = new ModelAndView("rmpart");
        modelAndView.addObject("part", partEntity);
        modelAndView.addObject("parts", partService.getOtherPart(Long.valueOf(partid)));
        return modelAndView;
    }

    /**
     * 管理分区页面
     * @return
     */
    @RequestMapping("/managepart")
    public ModelAndView managepart() {
        ModelAndView modelAndView = new ModelAndView("managepart");
        System.out.println(partService.findAll());
        modelAndView.addObject("parts", partService.findAll());
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
        modelAndView.addObject("forum", forumService.findForum(Long.valueOf(forumid)));
        modelAndView.addObject("parts", partService.findAll());
        return modelAndView;
    }

    /**
     * 修改分区页面
     * @param partid
     * @return
     */
    @RequestMapping("mdpart")
    public ModelAndView mdpart(@RequestParam("partid") String partid) {
        ModelAndView modelAndView = new ModelAndView("mdpart");
        modelAndView.addObject("part", partService.findByPartid(Long.valueOf(partid)));
        return modelAndView;
    }

    /**
     * 执行修改分区操作
     */
    @RequestMapping("execmdp")
    public String execmdp(PartEntity partEntity){
        partService.modify(partEntity);
        return "redirect:/admin/managepart";
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
     * @param removeInfo
     * @param request
     * @return
     */
    @RequestMapping(value = "/execrm", method = RequestMethod.POST)
    public String execrm(RemoveInfo removeInfo, HttpServletRequest request) {
        if (removeInfo.getRmtype().equals("1")) {
            forumService.rmAll(removeInfo.getId());
        } else {
            forumService.mvTo(removeInfo.getId(), removeInfo.getToid());
        }
        return "redirect:/admin/list";
    }

    @RequestMapping("/execrmpart")
    public String execrmpart(RemoveInfo removeInfo) {
        //删除分区内所有内容
        if (removeInfo.getRmtype().equals("1")) {
            partService.removeAll(removeInfo.id);
        } else {
            forumService.mvTo(removeInfo.getId(), removeInfo.getToid());
        }
        return "redirect:/admin/managepart";
    }

    /**
     * 添加分区页面
     * @return
     */
    @RequestMapping("/addpart")
    public ModelAndView addpart() {
        return new ModelAndView("addpart");
    }

    /**
     * 添加版块
     */
    @RequestMapping("/addforum")
    public ModelAndView addforum() {
        ModelAndView modelAndView = new ModelAndView("addforum");
        modelAndView.addObject("parts", partService.findAll());
        return modelAndView;
    }

    /**
     * 执行添加分区
     * @param partname
     * @param request
     * @return
     */
    @RequestMapping("/execap")
    public String exeaf(String partname, HttpServletRequest request) {
        partService.save(partname, (Long) request.getSession().getAttribute("aid"));
        return "redirect:/admin/managepart";
    }

    /**
     * 执行添加版块
     * @param forumEntity
     * @param request
     * @return
     */
    @RequestMapping("execaf")
    public ModelAndView execaf(ForumEntity forumEntity, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/list");
        forumEntity.setCreator((Long) request.getSession().getAttribute("aid"));
        forumService.save(forumEntity);
        System.out.println(forumEntity);
        return modelAndView;
//        return "redirect:/admin/list";
    }

    @RequestMapping("/execmf")
    public String execmf(ForumEntity forumEntity,HttpServletRequest request) {
        forumService.update(forumEntity);
        return "redirect:/admin/list";
    }

    @RequestMapping("/fileupload")
    @ResponseBody
    public String fileUpload(@RequestParam("file") MultipartFile file) {
        String name = RandomValue.getRandomFileName();
        String pathName = forumIconStoragePath + name + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
        File newfile = new File(pathName);
        JSONObject jsonObject = new JSONObject();
        try {
            byte[] bytes = file.getBytes();
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newfile));
            stream.write(bytes);
            stream.close();

            jsonObject.put("code", 200);
            jsonObject.put("msg", forumIconUrl + "/" + newfile.getName());
            return jsonObject.toString();
        } catch (IOException e) {
            jsonObject.put("code", 500);
            jsonObject.put("msg", e.getMessage());
            return jsonObject.toJSONString();
        }
    }

    @Data
    private class RemoveInfo {
        private Long id;
        private String rmtype;
        private Long toid;
    }
}
