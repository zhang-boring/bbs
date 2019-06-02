package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.PartDTO;
import bbs.game.cn.bbs.entity.PartEntity;

import java.util.List;

/**
 * @author 张宝运
 */
public interface PartService {
    void removeAll(Long partid);
    List<PartDTO> findAll();
    String findPartnameByPartid(Long partid);
    String findPartnameByForumid(Long forumid);
    void save(String partname, Long creator);
    PartEntity findByPartid(Long partid);
    List<PartDTO> getOtherPart(Long partid);
    void modify(PartEntity partEntity);
}
