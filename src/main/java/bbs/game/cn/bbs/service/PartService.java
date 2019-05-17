package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.PartDTO;
import bbs.game.cn.bbs.entity.PartEntity;

import java.util.List;

/**
 * @author 张宝运
 */
public interface PartService {
    List<PartDTO> findAll();
    String findPartnameByPartid(Long partid);
    String findPartnameByForumid(Long forumid);
    void save(String partname);
    PartEntity findByPartid(Long partid);
    List<PartDTO> getOtherPart(Long partid);
}
