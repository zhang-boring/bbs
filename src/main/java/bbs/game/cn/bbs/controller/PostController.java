package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.dto.UserDTO;
import bbs.game.cn.bbs.entity.PostEntity;
import bbs.game.cn.bbs.form.PostForm;
import bbs.game.cn.bbs.service.ForumService;
import bbs.game.cn.bbs.service.PartService;
import bbs.game.cn.bbs.service.PostService;
import bbs.game.cn.bbs.service.UserService;
import bbs.game.cn.bbs.utils.RandomValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.sql.Timestamp;

/**
 * 文章controller：/post
 * @author 张宝运
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    PostService postService;
    @Autowired
    PartService partService;
    @Autowired
    ForumService forumService;
    @Autowired
    UserService userService;

    @Value(value = "${ckeditor.storage.image.path}")
    private String ckeditorStorageImagePath;

    @Value(value = "${ckeditor.access.image.url}")
    private String ckeditorAccessImageUrl;

    @RequestMapping("/gonggao")
    public ModelAndView gonggao() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("gonggao");
        modelAndView.addObject("gglist", postService.getGonggao());
        return modelAndView;
    }

    @RequestMapping(value = "/{postid}", method = RequestMethod.GET)
    public ModelAndView postPage(@PathVariable("postid") Long postid, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        PostEntity postEntity = postService.findByPostid(postid);
        modelAndView.addObject("post", postEntity);
        HttpSession session = request.getSession();
        Long partid = postService.getPartid(postid);
        session.setAttribute("partid", partid);
        session.setAttribute("partname", partService.findPartnameByPartid(partid));
        Long forumid = postService.getForumid(postid);
        session.setAttribute("forumid", forumid);
        session.setAttribute("forumname", forumService.findForumnameByForumid(forumid));
        modelAndView.addObject("poster", userService.findUser(postService.getPosterId(postid)));
        modelAndView.setViewName("post");
        return modelAndView;
    }

    @RequestMapping(value = "/uploadimg")
    public void uploadImage(@RequestParam("upload") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        String name = RandomValue.getRandomFileName();
        if (! file.isEmpty()) {
            try {
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/html; charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                //解决跨域问题
                response.setHeader("X-Frame-Options", "SAMEORIGIN");
                PrintWriter out = response.getWriter();

                String pathName = ckeditorStorageImagePath + name + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));

                File newfile = new File(pathName);
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newfile));
                stream.write(bytes);
                stream.close();

                // 组装返回url，以便于ckeditor定位图片
                String fileUrl = ckeditorAccessImageUrl + "/" + newfile.getName();
                // 将上传的图片的url返回给ckeditor
                String callback = request.getParameter("CKEditorFuncNum");
                String script = "<script type=\"text/javascript\">var start = (new Date()).getTime();while((new Date()).getTime() - start < 3000) {continue;}window.parent.CKEDITOR.tools.callFunction(" + callback + ", '" + fileUrl + "');</script>";

                out.println(script);
                out.flush();
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/new")
    public ModelAndView newPost(@Valid PostForm post, BindingResult result, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if (result.hasErrors()) {
            System.out.println(result.getFieldError().getDefaultMessage());
            modelAndView.addObject("errorInfo", result.getFieldError().getDefaultMessage());
            modelAndView.setViewName("redirect:/errorpage");
            return modelAndView;
        }
        Timestamp ts = new Timestamp(System.currentTimeMillis());
        HttpSession session = request.getSession();
        String forumid = session.getAttribute("forumid") + "";
        PostEntity postEntity = new PostEntity();
        postEntity.setContent(post.getContent());
        postEntity.setTitle(post.getTitle());
        postEntity.setUid(((UserDTO)session.getAttribute("user")).getUid());
        postEntity.setLastchagetime(ts);
        postEntity.setCommittime(ts);
        postEntity.setForumid(Long.parseLong((String) forumid));
        postService.insert(postEntity);
        modelAndView.setViewName("redirect:/forum/" + forumid);
        return modelAndView;
    }
}
