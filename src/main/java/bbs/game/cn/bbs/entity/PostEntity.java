package bbs.game.cn.bbs.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Data
@Table(name = "post", schema = "bbs", catalog = "")
public class PostEntity {
    private long postid;
    private long forumid;
    private long uid;
    private String title;
    private String content;
    private Timestamp committime;
    private Timestamp lastchagetime;
    private short announce;

    @Id
    @Column(name = "postid")
    public long getPostid() {
        return postid;
    }

    public void setPostid(long postid) {
        this.postid = postid;
    }

    @Basic
    @Column(name = "forumid")
    public long getForumid() {
        return forumid;
    }

    public void setForumid(long forumid) {
        this.forumid = forumid;
    }

    @Basic
    @Column(name = "uid")
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "committime")
    public Timestamp getCommittime() {
        return committime;
    }

    public void setCommittime(Timestamp committime) {
        this.committime = committime;
    }

    @Basic
    @Column(name = "lastchagetime")
    public Timestamp getLastchagetime() {
        return lastchagetime;
    }

    public void setLastchagetime(Timestamp lastchagetime) {
        this.lastchagetime = lastchagetime;
    }

    @Basic
    @Column(name = "announce")
    public short getAnnounce() {
        return announce;
    }

    public void setAnnounce(short announce) {
        this.announce = announce;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PostEntity that = (PostEntity) o;
        return postid == that.postid &&
                forumid == that.forumid &&
                uid == that.uid &&
                announce == that.announce &&
                Objects.equals(title, that.title) &&
                Objects.equals(content, that.content) &&
                Objects.equals(committime, that.committime) &&
                Objects.equals(lastchagetime, that.lastchagetime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(postid, forumid, uid, title, content, committime, lastchagetime, announce);
    }
}
