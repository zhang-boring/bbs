package bbs.game.cn.bbs.controller;

import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.PostEntity;
import bbs.game.cn.bbs.service.ForumService;
import bbs.game.cn.bbs.service.PartService;
import bbs.game.cn.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 版块相关controller
 * @author 张宝运
 */
@RequestMapping("/forum")
@Controller
public class ForumController {
    @Autowired
    private PartService partService;
    @Autowired
    private ForumService forumService;
    @Autowired
    private PostService postService;

    @RequestMapping(value = {"/{forumid}"}, method = RequestMethod.GET)
    public ModelAndView forumPage(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                  @RequestParam(value = "size", defaultValue = "10") Integer size,
                                  @PathVariable("forumid") Long forumid, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("forum");
        HttpSession session = request.getSession();
        session.setAttribute("partname", partService.findPartnameByForumid(forumid));
        session.setAttribute("forumname", forumService.findForumnameByForumid(forumid));
        session.setAttribute("forumid", forumid);
        session.setAttribute("moderator", forumService.getModeratorUid(forumid));
        PageRequest pageRequest = new PageRequest(page - 1, size, new Sort(Sort.Direction.DESC, "lastchagetime"));
        //查询条件
        Specification<PostEntity> postDTOSpecification = new Specification<PostEntity>() {
            @Override
            public Predicate toPredicate(Root<PostEntity> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {

                Path<Long> forumidMark = root.get("forumid");
                Predicate predicate = criteriaBuilder.equal(forumidMark, forumid);
                return predicate;
            }
        };
        Page<PostDTO> postDTOPage = postService.findPostList(postDTOSpecification, pageRequest);
        modelAndView.addObject("currentPage", page);
        modelAndView.addObject("postDTOPage", postDTOPage);
        return modelAndView;
    }
}
