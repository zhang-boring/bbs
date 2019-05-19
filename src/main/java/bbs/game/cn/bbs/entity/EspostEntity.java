package bbs.game.cn.bbs.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Objects;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "espost", schema = "bbs", catalog = "")
public class EspostEntity {
    private Long postid;
    private String esid;

    @Id
    @Column(name = "postid")
    public long getPostid() {
        return postid;
    }

    public void setPostid(long postid) {
        this.postid = postid;
    }

    @Basic
    @Column(name = "esid")
    public String getEsid() {
        return esid;
    }

    public void setEsid(String esid) {
        this.esid = esid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EspostEntity that = (EspostEntity) o;
        return postid == that.postid &&
                Objects.equals(esid, that.esid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(postid, esid);
    }
}
