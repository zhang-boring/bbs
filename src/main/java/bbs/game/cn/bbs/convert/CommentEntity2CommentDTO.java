package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.CommentDTO;
import bbs.game.cn.bbs.entity.CommentEntity;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 张宝运
 */
public class CommentEntity2CommentDTO {
    public static CommentDTO convert(CommentEntity commentEntity) {
        CommentDTO commentDTO = new CommentDTO();
        BeanUtils.copyProperties(commentEntity, commentDTO);
        return commentDTO;
    }

    public static List<CommentDTO> convert(List<CommentEntity> sources) {
        return sources.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
