package bbs.game.cn.bbs.service;

import bbs.game.cn.bbs.dto.MessageDTO;

import java.util.List;

public interface MessageService {
    List<MessageDTO> getMessage(Long uid);
    void readAll(Long uid);

    void read(Long uid, Long postid, Long posteruid);

    void newMsg(Long uid, Long postid, Long posteruid);
}
