package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "admin", schema = "bbs", catalog = "")
public class AdminEntity {
    private long aid;
    private String aname;
    private String apasswd;

    @Id
    @Column(name = "aid")
    public long getAid() {
        return aid;
    }

    public void setAid(long aid) {
        this.aid = aid;
    }

    @Basic
    @Column(name = "aname")
    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    @Basic
    @Column(name = "apasswd")
    public String getApasswd() {
        return apasswd;
    }

    public void setApasswd(String apasswd) {
        this.apasswd = apasswd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminEntity that = (AdminEntity) o;
        return aid == that.aid &&
                Objects.equals(aname, that.aname) &&
                Objects.equals(apasswd, that.apasswd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(aid, aname, apasswd);
    }
}
