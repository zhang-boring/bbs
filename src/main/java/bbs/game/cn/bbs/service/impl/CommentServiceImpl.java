package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.convert.CommentEntity2CommentDTO;
import bbs.game.cn.bbs.dto.CommentDTO;
import bbs.game.cn.bbs.entity.CommentEntity;
import bbs.game.cn.bbs.repository.CommentRepository;
import bbs.game.cn.bbs.repository.UserRepository;
import bbs.game.cn.bbs.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public Page<CommentDTO> findCommentList(Specification<CommentEntity> spec, Pageable pageable) {
        Page<CommentEntity> commentEntityPage =  commentRepository.findAll(spec, pageable);
        List<CommentEntity> commentEntityList = new ArrayList<>(commentEntityPage.getContent());
        List<CommentDTO> commentDTOList = CommentEntity2CommentDTO.convert(commentEntityList);

        for (CommentDTO commentDTO : commentDTOList) {
            commentDTO.setUname((String) userRepository.findUnameByUid(commentDTO.getFirstuid()));
            commentDTO.setIcon(userRepository.findIconByUid(commentDTO.getFirstuid()));
            commentDTO.setSignature(userRepository.findSignatureByUid(commentDTO.getFirstuid()));
            if (commentDTO.getSeconduid() != 0) {
                commentDTO.setSeconenduname((String) userRepository.findUnameByUid(commentDTO.getSeconduid()));
            }
        }

        return new PageImpl<CommentDTO>(commentDTOList, pageable, commentEntityPage.getTotalElements());
    }

    @Override
    public CommentEntity insert(CommentEntity commentEntity) {
        return commentRepository.save(commentEntity);
    }
}
