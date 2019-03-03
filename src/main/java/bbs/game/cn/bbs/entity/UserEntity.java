package bbs.game.cn.bbs.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Data
@Table(name = "user", schema = "bbs", catalog = "")
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long uid;
    private String uname;
    private String password;
    private String email;
    private String phone;
    private String icon;
    private String signature;
    private Timestamp signUpTime = new Timestamp(System.currentTimeMillis());
    private Timestamp checkInDate = new Timestamp(System.currentTimeMillis());;
    private Integer level = 0;

    public UserEntity() {
    }

    public UserEntity(
            String uname, String password, String email, String phone,
            String icon, String signature, Timestamp signUpTime,
            Timestamp checkInDate, Integer level) {
        this.uname = uname;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.icon = icon;
        this.signature = signature;
        this.signUpTime = signUpTime;
        this.checkInDate = checkInDate;
        this.level = level;
    }

    @Id
    @Column(name = "uid")
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "uname")
    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "icon")
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Basic
    @Column(name = "signature")
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    @Basic
    @Column(name = "sign_up_time")
    public Timestamp getSignUpTime() {
        return signUpTime;
    }

    public void setSignUpTime(Timestamp signUpTime) {
        this.signUpTime = signUpTime;
    }

    @Basic
    @Column(name = "check_in_date")
    public Timestamp getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Timestamp checkInDate) {
        this.checkInDate = checkInDate;
    }

    @Basic
    @Column(name = "level")
    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return uid == that.uid &&
                Objects.equals(uname, that.uname) &&
                Objects.equals(password, that.password) &&
                Objects.equals(email, that.email) &&
                Objects.equals(phone, that.phone) &&
                Objects.equals(icon, that.icon) &&
                Objects.equals(signature, that.signature) &&
                Objects.equals(signUpTime, that.signUpTime) &&
                Objects.equals(checkInDate, that.checkInDate) &&
                Objects.equals(level, that.level);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, uname, password, email, phone, icon, signature, signUpTime, checkInDate, level);
    }
}
