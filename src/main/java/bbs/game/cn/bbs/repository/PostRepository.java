package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.PostEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<PostEntity, Long>, JpaSpecificationExecutor<PostEntity> {
    /**
     * 今日新帖数量
     * @param today
     * @return
     */
    Long countByCommittimeGreaterThan(Date today);

    /**
     * 查询当前登录用户的所有帖子数
     * @param uid
     * @return
     */
    Long countAllByUid(Long uid);

    /**
     * 昨日新帖数量
     * TODO 更改方法为添加判断是否为公告
     * @param yestoday
     * @param today
     * @return
     */
    Long countByCommittimeBetween(Date yestoday, Date today);

    /**
     * 查询指定版块下帖子总量
     * @return
     */
    Long countAllByForumidAndAnnounce(Long forumid, short isAnnounce);

    /**
     * 新帖数量最高日
     * @return
     */
    @Query(value = "select count(*) as counts from post group by date_format(committime, '%Y-%m-%d') order by counts desc limit 1", nativeQuery = true)
    Object mostPostsDay();

    /**
     * 最新公告贴的贴子标题和postid
     *  nativeQuery为true时:写原生sql，支持limit函数
     *  nativeQuery为false时:是JPQL,JPQL不支持limit函数
     * @return
     */
    @Query(value = "select title from post where announce=1 order by committime desc limit 1", nativeQuery = true)
    Object findNewestAnnounceName();
    @Query(value = "select postid from post where announce=1 order by committime desc limit 1", nativeQuery = true)
    Object findNewestAnnounceId();

    /**
     * 根据版块id(和用户uid)查询今日/当前用户上次登录后的新帖数量
     */
    @Query(value = "select count(*) from post where forumid=:forumid and announce = 0 and committime > :today", nativeQuery = true)
    Object findNewPostsToday(@Param(value = "forumid") Long forumid, @Param(value = "today") Date today);
    @Query(value = "select count(*) from post where forumid=:forumid and announce = 0 and committime > (" +
            "select check_in_date from user where uid=:uid)", nativeQuery = true)
    Object findNewPostsAfterCheckin(@Param(value = "forumid") Long forumid, @Param(value = "uid") Long uid);

    /**
     * 查询所有公告贴
     * @param isAnnounce
     * @return
     */
    List<PostEntity> findAllByAnnounce(short isAnnounce);

    /**
     * 当前版块下最新的文章标题和postid、发布者、提交时间
     *  nativeQuery为true时:写原生sql，支持limit函数
     *  nativeQuery为false时:是JPQL,JPQL不支持limit函数
     * @return
     */
    @Query(value = "select title from post where postid=:postid", nativeQuery = true)
    Object findPostTitleByPostid(@Param(value = "postid")Long postid);
    @Query(value = "select postid from post where announce=0 and forumid=:forumid order by committime desc limit 1", nativeQuery = true)
    Object findNewestPostid(@Param(value = "forumid")Long forumid);
    @Query(value = "select uname from user where uid=(select uid from post where postid=:postid)", nativeQuery = true)
    Object findUnameByPostid(@Param(value = "postid")Long postid);
    @Query(value = "select committime from post where postid=:postid", nativeQuery = true)
    Timestamp findCommittimeByPostid(@Param(value = "postid")Long postid);

    /**
     * 获取最新的回复者uname
     * @param postid
     * @return
     */
    @Query(value = "select uname from user where uid = (select firstuid from comment group by postid having postid = :postid order by committime desc limit 1)", nativeQuery = true)
    String findLastReplyUname(@Param(value = "postid") Long postid);

    @Query(value = "select count(*) from comment where postid=:postid", nativeQuery = true)
    Long countReplynumByPostid(@Param(value = "postid") Long postid);

    /**
     * 实现带条件查询的分页，需先继承JpaSpecificationExecutor接口
     * @param specification
     * @param pageable
     * @return
     */
    @Override
    Page<PostEntity> findAll(Specification<PostEntity> specification, Pageable pageable);

    @Query(value = "select * from post where postid=:postid", nativeQuery = true)
    PostEntity findOneById(@Param(value = "postid") Long id);

    @Query(value = "select partid from forum where forumid = (select forumid from post where postid = :postid)", nativeQuery = true)
    Long getPartid(@Param(value = "postid")Long postid);

    @Query(value = "select forumid from post where postid=:postid", nativeQuery = true)
    Long getForumid(@Param(value = "postid")Long postid);

    @Query(value = "select uid from post where postid=:postid", nativeQuery = true)
    Long findPosterId(@Param(value = "postid")Long postid);

    @Query(value = "select title from post where postid = :postid", nativeQuery = true)
    String findTitleByPostid(@Param(value = "postid")Long postid);
}
