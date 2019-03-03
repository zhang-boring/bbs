package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.service.PostService;
import bbs.game.cn.bbs.utils.RandomValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * 文章controller：/post
 * @author 张宝运
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    PostService postService;

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
    public ModelAndView postPage(@PathVariable("postid") Long postid) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("postid", postid);
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

                String pathName = ckeditorStorageImagePath + name + file.getOriginalFilename();
                System.out.println(pathName);

                File newfile = new File(pathName);
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newfile));
                stream.write(bytes);
                stream.close();

                // 组装返回url，以便于ckeditor定位图片
                String fileUrl = ckeditorAccessImageUrl + "/" + newfile.getName();
                System.out.println(fileUrl);

                // 将上传的图片的url返回给ckeditor
                String callback = request.getParameter("CKEditorFuncNum");
                String script = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(" + callback + ", '" + fileUrl + "');</script>";

                out.println(script);
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
