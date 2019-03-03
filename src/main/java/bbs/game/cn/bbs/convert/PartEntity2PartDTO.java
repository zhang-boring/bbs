package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.PartDTO;
import bbs.game.cn.bbs.entity.PartEntity;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 类型转换类
 * @author 张宝运
 */
public class PartEntity2PartDTO {
    public static PartDTO convert(PartEntity source) {
        PartDTO partDTO = new PartDTO();
        BeanUtils.copyProperties(source, partDTO);
        return partDTO;
    }

    public static List<PartDTO> convert(List<PartEntity> sources) {
        return sources.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
