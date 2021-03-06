package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "part", schema = "bbs", catalog = "")
public class PartEntity {
    private long partid;
    private String partname;
    private Timestamp createtime;
    private long creator;

    public PartEntity(String partname, Long creator) {
        this.partname = partname;
        this.creator = creator;
    }

    public PartEntity() {}

    @Id
    @Column(name = "partid")
    public long getPartid() {
        return partid;
    }

    public void setPartid(long partid) {
        this.partid = partid;
    }

    @Basic
    @Column(name = "partname")
    public String getPartname() {
        return partname;
    }

    public void setPartname(String partname) {
        this.partname = partname;
    }

    @Basic
    @Column(name = "createtime")
    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    @Basic
    @Column(name = "creator")
    public long getCreator() {
        return creator;
    }

    public void setCreator(long creator) {
        this.creator = creator;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PartEntity that = (PartEntity) o;
        return partid == that.partid &&
                creator == that.creator &&
                Objects.equals(partname, that.partname) &&
                Objects.equals(createtime, that.createtime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(partid, partname, createtime, creator);
    }
}
