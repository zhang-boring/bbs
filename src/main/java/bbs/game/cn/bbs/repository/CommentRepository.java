package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.entity.CommentEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CommentRepository extends JpaRepository<CommentEntity, Long>, JpaSpecificationExecutor<CommentEntity> {
    @Override
    Page<CommentEntity> findAll(Specification<CommentEntity> specification, Pageable pageable);

    @Query(value = "delete from comment where postid=:postid", nativeQuery = true)
    @Modifying
    @Transactional
    void deleteByPostid(@Param("postid") Long postid);
}
