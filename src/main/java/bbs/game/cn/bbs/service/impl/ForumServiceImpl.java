package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.convert.ForumEntity2ForumDTO;
import bbs.game.cn.bbs.dto.ForumDTO;
import bbs.game.cn.bbs.dto.SimpleForumDTO;
import bbs.game.cn.bbs.entity.ForumEntity;
import bbs.game.cn.bbs.repository.ForumRepository;
import bbs.game.cn.bbs.repository.PostRepository;
import bbs.game.cn.bbs.repository.UserRepository;
import bbs.game.cn.bbs.service.ForumService;
import bbs.game.cn.bbs.service.PartService;
import bbs.game.cn.bbs.utils.ModifyEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ForumServiceImpl implements ForumService {
    @Autowired
    ForumRepository forumRepository;
    @Autowired
    PostRepository postRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    PartService partService;

    @Override
    public List<ForumDTO> findAll(Long uid) {
        List<ForumEntity> forumEntities = forumRepository.findAll();
        List<ForumDTO> forumDTOS = ForumEntity2ForumDTO.convert(forumEntities);
        for (ForumDTO forumDTO : forumDTOS) {
            Long allPosts = postRepository.countAllByForumidAndAnnounce(forumDTO.getForumid(), (short) 0);
            String newPosts = postRepository.findNewPostsAfterCheckin(forumDTO.getForumid(), uid).toString();
            String todayPosts = postRepository.findNewPostsToday(forumDTO.getForumid(), new Date(System.currentTimeMillis())).toString();
            forumDTO.setPartname(partService.findPartnameByPartid(forumDTO.getPartid()));
            if (!forumDTO.getModerator().equals("0")) {
                forumDTO.setModeratorName((String) userRepository.findUnameByUid(Long.parseLong(forumDTO.getModerator())));
            }
            if (uid == null) {
                forumDTO.setNewPosts(todayPosts);
                forumDTO.setTodayPosts(todayPosts);
                forumDTO.setAllPosts(allPosts);
            } else {
                forumDTO.setNewPosts(newPosts);
                forumDTO.setTodayPosts(todayPosts);
                forumDTO.setAllPosts(allPosts);
            }
            BigInteger newestPostid = (BigInteger) postRepository.findNewestPostid(forumDTO.getForumid());
            if (newestPostid == null) {
                forumDTO.setPostid(null);
                forumDTO.setTitle("");
                forumDTO.setUname("");
                forumDTO.setCommittime(null);
            } else {
                forumDTO.setPostid(Long.valueOf(newestPostid.toString()));
                forumDTO.setTitle(((String) postRepository.findPostTitleByPostid(forumDTO.getPostid())).substring(0, 2) + "...");
                forumDTO.setUname((String) postRepository.findUnameByPostid(forumDTO.getPostid()));
                forumDTO.setCommittime(postRepository.findCommittimeByPostid(forumDTO.getPostid()));
            }
        }
        return forumDTOS;
    }

    @Override
    public Long forumsTotal() {
        Long forumNum = forumRepository.count();
        return forumNum;
    }

    @Override
    public String findForumnameByForumid(Long forumid) {
        return forumRepository.findForumnameByForumid(forumid);
    }

    @Override
    public ForumDTO findForum(Long forumid) {
        ForumEntity forumEntity = forumRepository.findByFid(forumid);
        ForumDTO forumDTO = ForumEntity2ForumDTO.convert(forumEntity);
        if (!forumDTO.getModerator().equals("0")) {
            forumDTO.setModeratorName((String) userRepository.findUnameByUid(Long.parseLong(forumDTO.getModerator())));
        }
        forumDTO.setPartname(partService.findPartnameByPartid(forumDTO.getPartid()));
        Long allPosts = postRepository.countAllByForumidAndAnnounce(forumDTO.getForumid(), (short) 0);
        forumDTO.setAllPosts(allPosts);
        return forumDTO;
    }

    @Override
    public List<SimpleForumDTO> findSimpleForumInfo(Long forumid) {
        return forumRepository.findOtherForums(forumid);
    }

    @Override
    public void rmAll(Long forumid) {
        forumRepository.rmAll(forumid);
        forumRepository.deleteById(forumid);
    }

    @Override
    public void mvTo(Long forumid, Long toforumid) {
        forumRepository.mvTo(forumid, toforumid);
        forumRepository.deleteById(forumid);
    }

    @Override
    public void update(ForumEntity forumEntity) {
        ModifyEntityUtil.getModified(forumRepository.findByFid(forumEntity.getForumid()), forumEntity);
        forumRepository.save(forumEntity);
    }

    @Override
    public void save(ForumEntity forumEntity) {
        forumEntity.setCreatetime(new Timestamp(System.currentTimeMillis()));
        forumRepository.save(forumEntity);
    }
}
