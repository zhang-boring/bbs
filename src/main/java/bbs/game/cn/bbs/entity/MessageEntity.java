package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "message", schema = "bbs", catalog = "")
public class MessageEntity {
    private long uid;
    private long postid;
    private int num;

    @Id
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MessageEntity that = (MessageEntity) o;
        return uid == that.uid &&
                postid == that.postid &&
                num == that.num;
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, postid, num);
    }
}
