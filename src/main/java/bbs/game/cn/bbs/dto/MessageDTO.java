package bbs.game.cn.bbs.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.Column;
import java.io.Serializable;

@Data
@ToString
@AllArgsConstructor
public class MessageDTO implements Serializable {
    private static final long serialVersionUID = 6236747756448789351L;
    Long postid;
    String postName;
    Long posteruid;
    String posterUname;
    Long nums;

    public MessageDTO(Long postid, Long posteruid, Long nums) {
        this.postid = postid;
        this.posteruid = posteruid;
        this.nums = nums;
    }

    public MessageDTO() {}
}
