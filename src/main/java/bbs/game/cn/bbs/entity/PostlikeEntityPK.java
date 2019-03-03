package bbs.game.cn.bbs.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class PostlikeEntityPK implements Serializable {
    private long uid;
    private long postid;

    @Column(name = "uid")
    @Id
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Column(name = "postid")
    @Id
    public long getPostid() {
        return postid;
    }

    public void setPostid(long postid) {
        this.postid = postid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PostlikeEntityPK that = (PostlikeEntityPK) o;
        return uid == that.uid &&
                postid == that.postid;
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, postid);
    }
}
