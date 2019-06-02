package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/delete")
    public String delete(@RequestParam("commentid") Long commentid) {
        return "redirect:/post/" + commentService.delete(commentid);
    }
}
