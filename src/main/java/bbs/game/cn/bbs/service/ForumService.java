package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.ForumDTO;
import bbs.game.cn.bbs.dto.SimpleForumDTO;
import bbs.game.cn.bbs.entity.ForumEntity;

import java.util.List;
import java.util.Map;

/**
 * @author 张宝运
 */
public interface ForumService {
    List<ForumDTO> findAll(Long uid);
    Long forumsTotal();
    String findForumnameByForumid(Long forumid);
    ForumDTO findForum(Long forumid);
    List<SimpleForumDTO> findSimpleForumInfo(Long forumid);

    void rmAll(Long forumid);
    void mvTo(Long forumid1, Long forumid2);
    void update(ForumEntity forumEntity);
    void save(ForumEntity forumEntity);
}
