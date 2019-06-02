package bbs.game.cn.bbs.entity;

import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@ToString
@Table(name = "forum", schema = "bbs", catalog = "")
public class ForumEntity {
    private long forumid;
    private long partid;
    private String forumname;
    private String icon;
    private String moderator;
    private String description;
    private Timestamp createtime;
    private long creator;

    @Id
    @Column(name = "forumid")
    public long getForumid() {
        return forumid;
    }

    public void setForumid(long forumid) {
        this.forumid = forumid;
    }

    @Basic
    @Column(name = "partid")
    public long getPartid() {
        return partid;
    }

    public void setPartid(long partid) {
        this.partid = partid;
    }

    @Basic
    @Column(name = "forumname")
    public String getForumname() {
        return forumname;
    }

    public void setForumname(String forumname) {
        this.forumname = forumname;
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
    @Column(name = "moderator")
    public String getModerator() {
        return moderator;
    }

    public void setModerator(String moderator) {
        this.moderator = moderator;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        ForumEntity that = (ForumEntity) o;
        return forumid == that.forumid &&
                partid == that.partid &&
                creator == that.creator &&
                Objects.equals(forumname, that.forumname) &&
                Objects.equals(icon, that.icon) &&
                Objects.equals(moderator, that.moderator) &&
                Objects.equals(description, that.description) &&
                Objects.equals(createtime, that.createtime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(forumid, partid, forumname, icon, moderator, description, createtime, creator);
    }
}
