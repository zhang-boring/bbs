package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.PostDTO;
import bbs.game.cn.bbs.entity.PostEntity;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 数据库文章实体类转换为文章数据传输对象类型
 * @author 张宝运
 */
public class PostEntity2PostDTO {

    public static PostDTO convert(PostEntity postEntity) {
        PostDTO postDTO = new PostDTO();
        BeanUtils.copyProperties(postEntity, postDTO);
        return postDTO;
    }

    public static List<PostDTO> convert(List<PostEntity> sources) {
        return sources.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
