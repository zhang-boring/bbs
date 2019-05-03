package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.convert.PostEntity2PostDTO;
import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.PostEntity;
import bbs.game.cn.bbs.repository.PostRepository;
import bbs.game.cn.bbs.repository.UserRepository;
import bbs.game.cn.bbs.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostRepository postRepository;
    @Autowired
    UserRepository userRepository;

    /**
     * 数据库内目前所有文章数
     * @return
     */
    @Override
    public Long postsTotal() {
        return postRepository.count();
    }

    /**
     * 最新公告帖子名
     * @return
     */
    @Override
    public String newestAnnounceName() {
        String announceName = (String) postRepository.findNewestAnnounceName();
        return announceName;
    }

    /**
     * 最新公告贴id
     * @return
     */
    @Override
    public BigInteger newestAnnounceId() {
        BigInteger announceId = (BigInteger) postRepository.findNewestAnnounceId();
        return announceId;
    }

    /**
     * 今日文章数量
     * @return
     */
    @Override
    public Long postsToday() {
        Date date = new Date(System.currentTimeMillis());
        return postRepository.countByCommittimeGreaterThan(date);
    }

    /**
     * 昨日文章数
     * @return
     */
    @Override
    public Long postYestoday() {
        Date today = new Date(System.currentTimeMillis());
        Date yestoday = new Date(today.getYear(), today.getMonth(), today.getDay() - 1);
        Long postYestoday = postRepository.countByCommittimeBetween(yestoday, today);
        return postYestoday;
    }

    /**
     * 文章提交数最多的一天
     * @return
     */
    @Override
    public String mostPostsDay() {
        String postNum = String.valueOf(postRepository.mostPostsDay());
        return postNum;
    }

    /**
     * 获取数据库内所有公告贴信息
     * @return
     */
    @Override
    public List<PostDTO> getGonggao() {
        List<PostEntity> postEntities = postRepository.findAllByAnnounce((short) 1);
        List<PostDTO> postDTOS = PostEntity2PostDTO.convert(postEntities);
        for (PostDTO postDTO : postDTOS) {
            for (PostEntity postEntity : postEntities) {
                if (postDTO.getPostid() == postEntity.getPostid()) {
                    postDTO.setUname((String) userRepository.findUnameByUid(postEntity.getUid()));
                }
            }
        }
        return postDTOS;
    }

    @Override
    public PostEntity findByPostid(long postid) {
        return postRepository.findOneById(postid);
    }

    @Override
    public Page<PostDTO> findPostList(Specification<PostEntity> spec, Pageable pageable) {
        Page<PostEntity> postEntityPage= postRepository.findAll(spec, pageable);
        List<PostEntity> postEntityList = new ArrayList(postEntityPage.getContent());
        List<PostDTO> postDTOList = PostEntity2PostDTO.convert(postEntityList);
        for (PostDTO postDTO : postDTOList) {
            postDTO.setUname((String) userRepository.findUnameByUid(postDTO.getUid()));
            postDTO.setReplyUname(postRepository.findLastReplyUname(postDTO.getPostid()));
            postDTO.setReplyNum(postRepository.countReplynumByPostid(postDTO.getPostid()));
        }
        return new PageImpl<PostDTO>(postDTOList, pageable, postEntityPage.getTotalElements());
    }

    @Override
    public PostEntity insert(PostEntity postEntity) {
        return postRepository.save(postEntity);
    }

    @Override
    public Long getPartid(Long postid) {
        return postRepository.getPartid(postid);
    }

    @Override
    public Long getForumid(Long postid) {
        return postRepository.getForumid(postid);
    }

    @Override
    public Long getPosterId(Long postid) {
        return postRepository.findPosterId(postid);
    }
}
