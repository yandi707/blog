package wen.blog.pojo;

import java.io.Serializable;
import java.util.Date;

public class Blog implements Serializable {

    private Integer id;
    private String title;
    private String summary;
    private Date releaseDate;
    private Integer clickHit;
    private Integer commentHit;
    private String content;
    private String keyword;
    private int blogTypeId;
    private String bloggerName;

    private String typeName;
    private int typeCount;

    private String bhMessage;
    private String shType;

    public  Blog() {
    }

    public Blog(String title, String summary, String content, String keyword, int blogTypeId , String bloggerName) {
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.keyword = keyword;
        this.blogTypeId = blogTypeId;
        this.bloggerName = bloggerName;
    }

    public Blog(Integer id, String title, String summary, String content, String keyword, int blogTypeId) {
        this.id = id;
        this.title = title;
        this.summary = summary;
        this.content = content;
        this.keyword = keyword;
        this.blogTypeId = blogTypeId;
    }

    public String getShType() {
        return shType;
    }

    public void setShType(String shType) {
        this.shType = shType;
    }

    public String getBhMessage() {
        return bhMessage;
    }

    public void setBhMessage(String bhMessage) {
        this.bhMessage = bhMessage;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getClickHit() {
        return clickHit;
    }

    public void setClickHit(Integer clickHit) {
        this.clickHit = clickHit;
    }

    public Integer getCommentHit() {
        return commentHit;
    }

    public void setCommentHit(Integer commentHit) {
        this.commentHit = commentHit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getBlogTypeId() {
        return blogTypeId;
    }

    public void setBlogTypeId(int blogTypeId) {
        this.blogTypeId = blogTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getTypeCount() {
        return typeCount;
    }

    public void setTypeCount(int typeCount) {
        this.typeCount = typeCount;
    }

    public String getBloggerName() {
        return bloggerName;
    }

    public void setBloggerName(String bloggerName) {
        this.bloggerName = bloggerName;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", releaseDate=" + releaseDate +
                ", clickHit=" + clickHit +
                ", commentHit=" + commentHit +
                ", content='" + content + '\'' +
                ", keyword='" + keyword + '\'' +
                ", blogTypeId=" + blogTypeId +
                ", bloggerName='" + bloggerName + '\'' +
                ", typeName='" + typeName + '\'' +
                ", typeCount=" + typeCount +
                '}';
    }
}
