package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.ForumDTO;

import java.util.List;

/**
 * @author 张宝运
 */
public interface ForumService {
    List<ForumDTO> findAll(Long uid);
    Long forumsTotal();
    String findForumnameByForumid(Long forumid);
}
