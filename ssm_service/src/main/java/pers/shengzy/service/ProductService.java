package pers.shengzy.service;

import com.github.pagehelper.PageInfo;
import pers.shengzy.domain.PageBean;
import pers.shengzy.domain.Product;

import java.util.List;


public interface ProductService {
    /**
     * find all products
     * @return
     */
    List<Product> findAll();

    /**
     * save a product
     * @param product
     */
    void save(Product product);

    /**
     * find a product by id
     * @param id
     * @return
     */
    Product findById(Integer id);

    /**
     * update a product
     * @param product
     */
    void update(Product product);

    /**
     * delete a product
     * @param id
     */
    void delOne(Integer id);

    /**
     * delete multiple products
     * @param ids
     */
    void delMany(Integer[] ids);

    /**
     * find PageBean object
     * @param currPage
     * @param pageSize
     * @return
     */
    PageBean<Product> findByPage(Integer currPage, Integer pageSize);

    /**
     * find by pagehelper
     * @param currPage
     * @param pageSize
     * @return
     */
    PageInfo<Product> findByPageHelper(Integer currPage, Integer pageSize);

    /**
     * test find by pagehelper
     * @param currPage
     * @param pageSize
     */
    public void testFindByPageHelper(Integer currPage, Integer pageSize);
}
