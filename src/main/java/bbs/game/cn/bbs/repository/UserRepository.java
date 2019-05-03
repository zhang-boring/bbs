package bbs.game.cn.bbs.repository;

import bbs.game.cn.bbs.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 张宝运
 */
public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findByUname(String uname);

    UserEntity findByEmail(String email);

    UserEntity findByEmailAndUname(String email, String uame);

    UserEntity findByUid(Long uid);
//    Long countAllByUid();

    /**
     * 获取最新注册的用户信息
     *
     * @return
     */
    UserEntity findFirstByOrderBySignUpTimeDesc();

    @Transactional  //注解标注事务
    @Query(value = "select uname from user where uid = :uid", nativeQuery = true)
    Object findUnameByUid(@Param("uid") Long uid);

    /**
     * 更新最后登入时间
     * @param uid
     */
    @Transactional
    @Modifying  //配合@Query注解使用可自定义查询语句,单时只适用于查询结果为int/Integer或更新操作的sql语句
    @Query(value = "update user set check_in_date = now() where uid = :uid", nativeQuery = true)
    void updateCheckinTime(@Param("uid") Long uid);

    /**
     * 更新签名
     * @param uid
     * @param sig
     */
    @Transactional
    @Modifying
    @Query(value = "update user set signature = :sig where uid = :uid", nativeQuery = true)
    void updateSignatureByUid(@Param("uid") Long uid, @Param("sig") String sig);

    /**
     * 重置密码
     * @param uname
     * @param pw
     */
    @Transactional
    @Modifying
    @Query(value = "update user set password = :password where uname = :uname", nativeQuery = true)
    void updatePassordByUname(@Param("uname") String uname, @Param(("password")) String pw);

    @Query(value = "select icon from user where uid = :uid", nativeQuery = true)
    String findIconByUid(@Param("uid")Long uid);

    @Query(value = "select signature from user where uid = :uid", nativeQuery = true)
    String findSignatureByUid(@Param("uid")Long uid);
}