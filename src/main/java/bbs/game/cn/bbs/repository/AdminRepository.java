package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.entity.AdminEntity;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<AdminEntity, Long> {

    @Query(value = "select aname from admin where aname=:aname and apasswd=:apasswd", nativeQuery = true)
    String login(@Param("aname") String aname, @Param("apasswd") String apasswd);
}
