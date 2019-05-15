package bbs.game.cn.bbs.dto;

import com.sun.xml.internal.ws.developer.Serialization;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;
import org.springframework.stereotype.Controller;

import javax.persistence.Column;
import java.io.Serializable;

@Data
@ToString
public class SimpleForumDTO implements Serializable {
    private static final long serialVersionUID = 4125531458648416706L;
    private Long forumid;
    private String forumname;

    public SimpleForumDTO(Long forumid, String forumname) {
        this.forumid = forumid;
        this.forumname = forumname;
    }
}
