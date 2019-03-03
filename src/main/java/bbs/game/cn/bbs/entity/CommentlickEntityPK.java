package bbs.game.cn.bbs.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class CommentlickEntityPK implements Serializable {
    private long uid;
    private long postid;
    private long commentid;

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

    @Column(name = "commentid")
    @Id
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
        CommentlickEntityPK that = (CommentlickEntityPK) o;
        return uid == that.uid &&
                postid == that.postid &&
                commentid == that.commentid;
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, postid, commentid);
    }
}
