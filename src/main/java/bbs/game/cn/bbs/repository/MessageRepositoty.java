package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.dto.MessageDTO;
import bbs.game.cn.bbs.entity.MessageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface MessageRepositoty extends JpaRepository<MessageEntity, Long>, JpaSpecificationExecutor<MessageEntity> {

    @Query(value = "select new bbs.game.cn.bbs.dto.MessageDTO(postid, posteruid,count(*) as nums) " +
            "from MessageEntity where uid=:uid and num=1 group by postid, posteruid")
    List<MessageDTO> findAllByUid(@Param("uid") Long uid);

    @Modifying
    @Transactional
    @Query(value = "UPDATE message SET num=0 WHERE uid=:uid", nativeQuery = true)
    void readAll(@Param("uid") Long uid);

    @Modifying
    @Transactional
    @Query(value = "update  message set num=0 where uid=:uid and postid=:postid and posteruid=:posteruid", nativeQuery = true)
    void read(@Param("uid") Long uid, @Param("postid") Long postid, @Param("posteruid") Long posteruid);
}
