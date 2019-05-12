package bbs.game.cn.bbs.convert;

import bbs.game.cn.bbs.dto.MessageDTO;
import bbs.game.cn.bbs.entity.MessageEntity;
import org.springframework.beans.BeanUtils;

import java.util.List;
import java.util.stream.Collectors;

public class MessageEntity2MessageDTO {

    public static MessageDTO convert(MessageEntity source) {
        MessageDTO target = new MessageDTO();
        BeanUtils.copyProperties(source, target);
        return target;
    }

    public static List<MessageDTO> convert(List<MessageEntity> sources) {
        return sources.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
