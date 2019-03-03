package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "postlike", schema = "bbs", catalog = "")
@IdClass(PostlikeEntityPK.class)
public class PostlikeEntity {
    private long uid;
    private long postid;

    @Id
    @Column(name = "uid")
    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    @Id
    @Column(name = "postid")
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
        PostlikeEntity that = (PostlikeEntity) o;
        return uid == that.uid &&
                postid == that.postid;
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, postid);
    }
}
