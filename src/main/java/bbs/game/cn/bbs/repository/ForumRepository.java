package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.entity.ForumEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @author 张宝运
 */
public interface ForumRepository extends JpaRepository<ForumEntity, Long> {
    @Query(value = "select forumname from forum where forumid=:forumid", nativeQuery = true)
    String findForumnameByForumid(@Param("forumid") Long forumid);
}
