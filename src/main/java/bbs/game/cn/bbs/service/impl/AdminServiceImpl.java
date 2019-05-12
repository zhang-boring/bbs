package bbs.game.cn.bbs.service.impl;

import bbs.game.cn.bbs.entity.AdminEntity;
import bbs.game.cn.bbs.repository.AdminRepository;
import bbs.game.cn.bbs.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminRepository adminRepository;

    @Override
    public String login(AdminEntity adminEntity) {
        return adminRepository.login(adminEntity.getAname(), adminEntity.getApasswd());
    }
}
