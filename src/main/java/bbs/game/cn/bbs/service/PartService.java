package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.PartDTO;

import java.util.List;

/**
 * @author 张宝运
 */
public interface PartService {
    List<PartDTO> findAll();
    String findPartnameByPartid(Long partid);
    String findPartnameByForumid(Long forumid);
}
