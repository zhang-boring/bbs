package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "commentlick", schema = "bbs", catalog = "")
@IdClass(CommentlickEntityPK.class)
public class CommentlickEntity {
    private long uid;
    private long postid;
    private long commentid;

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

    @Id
    @Column(name = "commentid")
    public long getCommentid() {
        return commentid;
    }

    public void setCommentid(long commentid) {
        this.commentid = commentid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentlickEntity that = (CommentlickEntity) o;
        return uid == that.uid &&
                postid == that.postid &&
                commentid == that.commentid;
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, postid, commentid);
    }
}
