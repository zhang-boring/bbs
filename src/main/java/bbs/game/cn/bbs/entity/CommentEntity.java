package bbs.game.cn.bbs.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "comment", schema = "bbs", catalog = "")
public class CommentEntity {
    private long commentid;
    private long postid;
    private long firstuid;
    private Long seconduid;
    private String comment;
    private Timestamp committime;

    @Id
    @Column(name = "commentid")
    public long getCommentid() {
        return commentid;
    }

    public void setCommentid(long commentid) {
        this.commentid = commentid;
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
    @Column(name = "firstuid")
    public long getFirstuid() {
        return firstuid;
    }

    public void setFirstuid(long firstuid) {
        this.firstuid = firstuid;
    }

    @Basic
    @Column(name = "seconduid")
    public Long getSeconduid() {
        return seconduid;
    }

    public void setSeconduid(Long seconduid) {
        this.seconduid = seconduid;
    }

    @Basic
    @Column(name = "comment")
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Basic
    @Column(name = "committime")
    public Timestamp getCommittime() {
        return committime;
    }

    public void setCommittime(Timestamp committime) {
        this.committime = committime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CommentEntity that = (CommentEntity) o;
        return commentid == that.commentid &&
                postid == that.postid &&
                firstuid == that.firstuid &&
                Objects.equals(seconduid, that.seconduid) &&
                Objects.equals(comment, that.comment) &&
                Objects.equals(committime, that.committime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(commentid, postid, firstuid, seconduid, comment, committime);
    }
}
