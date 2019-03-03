package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.entity.PartEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @author 张宝运
 */
@Repository
public interface PartRepository extends JpaRepository<PartEntity, Long> {
    PartEntity findByPartid(Long partid);

    @Query(value = "select partname from part where partid = (select partid from forum where forumid = :forumid)", nativeQuery = true)
    String findPartnameByForumid(@Param("forumid") Long forumid);
}
