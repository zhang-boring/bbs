package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "admin", schema = "bbs", catalog = "")
public class AdminEntity {
    private long aid;
    private String aname;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AdminEntity that = (AdminEntity) o;
        return aid == that.aid &&
                Objects.equals(aname, that.aname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(aid, aname);
    }
}
