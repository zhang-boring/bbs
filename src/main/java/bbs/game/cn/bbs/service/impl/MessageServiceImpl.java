package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.dto.MessageDTO;
import bbs.game.cn.bbs.entity.MessageEntity;
import bbs.game.cn.bbs.repository.MessageRepositoty;
import bbs.game.cn.bbs.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageRepositoty messageRepositoty;

    @Override
    public List<MessageDTO> getMessage(Long uid) {
        return messageRepositoty.findAllByUid(uid);
    }

    @Override
    public void readAll(Long uid) {
        messageRepositoty.readAll(uid);
    }

    @Override
    public void read(Long uid, Long postid, Long posteruid) {
        messageRepositoty.read(uid, postid, posteruid);
    }

    @Override
    public void newMsg(Long uid, Long postid, Long posteruid) {
        MessageEntity messageEntity = new MessageEntity(uid, postid, posteruid);
        messageRepositoty.save(messageEntity);
    }
}
