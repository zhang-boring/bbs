package bbs.game.cn.bbs.dto;

import lombok.Data;

import java.util.HashSet;

/**
 * 首页分区，数据传输对象类型
 * @author 张宝运
 */
@Data
public class PartDTO {
    /* 区id */
    private Long partid;
    /* 区名 */
    private String partname;

    public PartDTO() {
    }

    public void setPartname(String partname){
        this.partname = partname;
    }

    public PartDTO(Long partid, String partname) {
        this.partid = partid;
        this.partname = partname;
    }
}
