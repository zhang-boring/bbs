package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.ForumDTO;
import bbs.game.cn.bbs.entity.ForumEntity;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 数据类型转换类，移除不需要的字段
 * @author 张宝运
 */
public class ForumEntity2ForumDTO {
    public static ForumDTO convert(ForumEntity source) {
        ForumDTO target = new ForumDTO();
        BeanUtils.copyProperties(source, target);
        return target;
    }

    public static List<ForumDTO> convert(List<ForumEntity> sources) {
        return sources.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
