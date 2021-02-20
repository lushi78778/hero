package hui.hero.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

/**
 * (Hero)实体类
 *
 * @author hui
 * @since 2021-02-20 20:10:47
 */
public class Hero implements Serializable {
    private static final long serialVersionUID = -18000561758835604L;
    /**
     * 主键自增ID
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 英雄名称
     */
    private String name;
    /**
     * 英雄头像
     */
    private String avatar;
    /**
     * 英雄职业
     * 1. 坦克    2. 战士    3. 刺客
     * 4. 法师    5. 射手    6. 辅助
     */
    private Integer type;
    /**
     * 英雄技能1
     */
    private String skill1;
    /**
     * 英雄技能1描述
     */
    private String skill1Describe;
    /**
     * 英雄技能2
     */
    private String skill2;
    /**
     * 英雄技能2描述
     */
    private String skill2Describe;
    /**
     * 英雄技能3
     */
    private String skill3;
    /**
     * 英雄技能3描述
     */
    private String skill3Describe;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getSkill1() {
        return skill1;
    }

    public void setSkill1(String skill1) {
        this.skill1 = skill1;
    }

    public String getSkill1Describe() {
        return skill1Describe;
    }

    public void setSkill1Describe(String skill1Describe) {
        this.skill1Describe = skill1Describe;
    }

    public String getSkill2() {
        return skill2;
    }

    public void setSkill2(String skill2) {
        this.skill2 = skill2;
    }

    public String getSkill2Describe() {
        return skill2Describe;
    }

    public void setSkill2Describe(String skill2Describe) {
        this.skill2Describe = skill2Describe;
    }

    public String getSkill3() {
        return skill3;
    }

    public void setSkill3(String skill3) {
        this.skill3 = skill3;
    }

    public String getSkill3Describe() {
        return skill3Describe;
    }

    public void setSkill3Describe(String skill3Describe) {
        this.skill3Describe = skill3Describe;
    }

    @Override
    public String toString() {
        return "Hero{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", type=" + type +
                ", skill1='" + skill1 + '\'' +
                ", skill1Describe='" + skill1Describe + '\'' +
                ", skill2='" + skill2 + '\'' +
                ", skill2Describe='" + skill2Describe + '\'' +
                ", skill3='" + skill3 + '\'' +
                ", skill3Describe='" + skill3Describe + '\'' +
                '}';
    }
}
