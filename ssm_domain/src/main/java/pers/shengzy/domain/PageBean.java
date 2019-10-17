package pers.shengzy.domain;

import java.util.List;

/**
 *
 * POJO for paging
 */
public class PageBean <T>{

//    current page
    private Integer currPage;
//    page size
    private Integer pageSize;
//    total count of items
    private Long totalCount;
//    total numbers of pages
        // Math.ceil(totalCount * 1.0 / pageSize)
    private Integer totalPage;
//    item list of the current page -- from the DB
    private List<T> list;

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
