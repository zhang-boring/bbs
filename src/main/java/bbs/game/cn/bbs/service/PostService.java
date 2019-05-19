package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.PostEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.math.BigInteger;
import java.util.List;

/**
 * 帖子和公告service接口
 * @author 张宝运
 */
public interface PostService {
    Long postsTotal();
    String newestAnnounceName();
    BigInteger newestAnnounceId();
    Long postsToday();
    Long postYestoday();
    String mostPostsDay();
    List<PostDTO> getGonggao();
    PostEntity findByPostid(long postid);
    Page<PostDTO> findPostList(Specification<PostEntity> spec, Pageable pageable);

    PostEntity insert(PostEntity postEntity);
    Long getPartid(Long postid);
    Long getForumid(Long postid);

    Long getPosterId(Long postid);

    String getPostNameBiPostid(Long postid);
    List<PostDTO> getMyPosts(Long uid);

    void delete(Long postid);

    List<PostDTO> findAll();
}
