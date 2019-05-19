package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.entity.EspostEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ESRepository extends JpaRepository<EspostEntity, Long> {
    
    @Query(value = "select esid from espost where postid=:postid", nativeQuery = true)
    String findEsidByPostid(@Param("postid") Long postid);
    
    
}
