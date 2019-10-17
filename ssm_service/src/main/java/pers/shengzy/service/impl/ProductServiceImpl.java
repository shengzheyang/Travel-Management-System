package pers.shengzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import pers.shengzy.dao.ProductDao;
import pers.shengzy.domain.PageBean;
import pers.shengzy.domain.Product;
import pers.shengzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductServiceImpl implements ProductService

{

    @Autowired
    ProductDao productDao;

    @Override
    public List<Product> findAll() {
        return productDao.findAll();
    }

    @Override
    public void save(Product product) {
        productDao.save(product);
    }

    @Override
    public Product findById(Integer id) {
        return productDao.findById(id);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delOne(Integer id) {
        productDao.delById(id);
    }

    @Override
    public void delMany(Integer[] ids) {
        if(ids != null){
            //delete multiple products
            for (Integer id : ids) {
                productDao.delById(id);
            }
        }
    }

    @Override
    public PageBean<Product> findByPage(Integer currPage, Integer pageSize) {
        //initiate PageBean object
        PageBean<Product> pageBean = new PageBean<>();
        //encapsulate PageBean
//        private Integer currPage;
        pageBean.setCurrPage(currPage);
//        private Integer pageSize;
        pageBean.setPageSize(pageSize);
//        private Long totalCount;
        Long totalCount = productDao.findTotalCount();
        pageBean.setTotalCount(totalCount);
        // Math.ceil(totalCount * 1.0 / pageSize)
//        private Integer totalPage;
        pageBean.setTotalPage((int)Math.ceil(totalCount * 1.0 / pageSize));
//        private List<T> list;
        /** 5 items per page
         * page 1： 1   5
         * page 2： 6   10
         * page 3： 11  15
         * page n： 5n-(5-1)    5n
         * currPage ===> n
         * pageSize ==> 5
         * nth page：pageSize * currPage-(pageSize-1)=pageSize(currPage-1) +1
         *  currPage*pageSize
         */
        Integer startIndex = pageSize*(currPage-1) +1;
        Integer endIndex = currPage*pageSize;
        List<Product> productList = productDao.findByPage(startIndex, endIndex);
        pageBean.setList(productList);
        return pageBean;
    }

    @Override
    public PageInfo<Product> findByPageHelper(Integer currPage, Integer pageSize) {
//        set paging params
        PageHelper.startPage(currPage, pageSize);
//        find all
        List<Product> productList = productDao.findAll();
//        initiate PageInfo object
        PageInfo<Product> pageInfo = new PageInfo<>(productList,3);

        return pageInfo;
    }

    @Override
    public void testFindByPageHelper(Integer currPage, Integer pageSize) {
//        param initiation for pageHelper
        PageHelper.startPage(currPage, pageSize);
//        find all
        List<Product> productList = productDao.findAll();
//        initiate PageInfo object
        PageInfo<Product> pageInfo = new PageInfo<>(productList, 5);
        System.out.println("Current page:"+ pageInfo.getPageNum());
        System.out.println("Page size:"+ pageInfo.getPageSize());
        System.out.println("Total pages:"+ pageInfo.getPages());
        System.out.println("Total items:"+ pageInfo.getTotal());
        System.out.println("Data:"+ pageInfo.getList().size());
        System.out.println("Previous page:"+ pageInfo.getPrePage());
        System.out.println("Next page:"+ pageInfo.getNextPage());
        System.out.println("Is first page:"+ pageInfo.isIsFirstPage());
        System.out.println("Is last page:"+ pageInfo.isIsLastPage());
        System.out.println("First page on navigation bar:"+pageInfo.getNavigateFirstPage());
        System.out.println("Last page on navigation bar:"+pageInfo.getNavigateLastPage());

    }
}
