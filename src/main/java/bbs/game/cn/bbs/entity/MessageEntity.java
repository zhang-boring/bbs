package bbs.game.cn.bbs.entity;

import lombok.AllArgsConstructor;

import javax.persistence.*;
import java.util.Objects;

@Entity
@AllArgsConstructor
@Table(name = "message", schema = "bbs", catalog = "")
public class MessageEntity {
    private long mid;
    private long uid;
    private long postid;
    private int num;
    private long posteruid;

    public MessageEntity(long uid, long postid, long posteruid) {
        this.uid = uid;
        this.posteruid = posteruid;
        this.postid = postid;
        this.num = 1;
    }

    @Id
    @Column(name = "mid")
    public long getMid() {
        return mid;
    }

    public void setMid(long mid) {
        this.mid = mid;
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
    @Column(name = "postid")
    public long getPostid() {
        return postid;
    }

    public void setPostid(long postid) {
        this.postid = postid;
    }

    @Basic
    @Column(name = "num")
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Basic
    @Column(name = "posteruid")
    public long getPosteruid() {
        return posteruid;
    }

    public void setPosteruid(long posteruid) {
        this.posteruid = posteruid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MessageEntity that = (MessageEntity) o;
        return mid == that.mid &&
                uid == that.uid &&
                postid == that.postid &&
                num == that.num &&
                posteruid == that.posteruid;
    }

    @Override
    public int hashCode() {
        return Objects.hash(mid, uid, postid, num, posteruid);
    }
}
