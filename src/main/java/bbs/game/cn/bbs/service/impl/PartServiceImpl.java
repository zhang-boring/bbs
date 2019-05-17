package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.convert.PartEntity2PartDTO;
import bbs.game.cn.bbs.dto.PartDTO;
import bbs.game.cn.bbs.entity.PartEntity;
import bbs.game.cn.bbs.repository.ForumRepository;
import bbs.game.cn.bbs.repository.PartRepository;
import bbs.game.cn.bbs.service.ForumService;
import bbs.game.cn.bbs.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张宝运
 */
@Service
public class PartServiceImpl implements PartService {

    @Autowired
    PartRepository partRepository;
    @Autowired
    ForumRepository forumRepository;

    @Override
    public List<PartDTO> findAll() {
        List<PartEntity> partEntities = partRepository.findAll();
        List<PartDTO> partDTOS = PartEntity2PartDTO.convert(partEntities);
        for (PartDTO partDTO : partDTOS) {
            partDTO.setForums(forumRepository.getForums(partDTO.getPartid()));
        }
        return partDTOS;
    }

    @Override
    public String findPartnameByPartid(Long partid) {
        PartEntity partEntity =  partRepository.findByPartid(partid);
        return partEntity.getPartname();
    }

    @Override
    public String findPartnameByForumid(Long forumid) {
        return partRepository.findPartnameByForumid(forumid);
    }

    @Override
    public void save(String partname) {
        partRepository.save(new PartEntity(partname));
    }

    @Override
    public PartEntity findByPartid(Long partid) {
        return partRepository.findByPartid(partid);
    }

    @Override
    public List<PartDTO> getOtherPart(Long partid) {
        List<PartEntity> partEntities =  partRepository.findOtherPart(partid);
        return PartEntity2PartDTO.convert(partEntities);
    }
}
