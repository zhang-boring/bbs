package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.CommentDTO;
import bbs.game.cn.bbs.entity.CommentEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

public interface CommentService {
    Page<CommentDTO> findCommentList(Specification<CommentEntity> spec, Pageable pageable);

    CommentEntity insert(CommentEntity commentEntity);
}
