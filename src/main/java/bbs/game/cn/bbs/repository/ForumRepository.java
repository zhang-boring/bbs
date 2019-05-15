package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.dto.SimpleForumDTO;
import bbs.game.cn.bbs.entity.ForumEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @author 张宝运
 */
public interface ForumRepository extends JpaRepository<ForumEntity, Long> {
    @Query(value = "select forumname from forum where forumid=:forumid", nativeQuery = true)
    String findForumnameByForumid(@Param("forumid") Long forumid);

    @Query(value = "select * from forum where forumid=:forumid", nativeQuery = true)
    ForumEntity findByFid(@Param("forumid") Long forumid);

    @Query(value = "select new bbs.game.cn.bbs.dto.SimpleForumDTO(forumid,forumname) " +
            "from ForumEntity where forumid != :forumid",nativeQuery = true)
    List<SimpleForumDTO> findOtherForums(@Param("forumid") Long forumid);

    @Query(value = "delete from forum where forumid=:forumid", nativeQuery = true)
    @Transactional
    @Modifying
    void rmAll(@Param("forumid") Long forumid);

    @Query(value = "update post set forumid=:forumid2 where forumid=:forumid1", nativeQuery = true)
    @Transactional
    @Modifying
    void mvTo(@Param("forumid1") Long forumid1, @Param("forumid2") Long forumid2);
}
