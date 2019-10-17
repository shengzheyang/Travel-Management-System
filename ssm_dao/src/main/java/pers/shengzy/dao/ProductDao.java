package pers.shengzy.dao;

import pers.shengzy.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ProductDao {

    @Select("select * from product")
    List<Product> findAll();


    @Insert("insert into product values(#{id} , #{productNum},#{productName},#{cityName},#{departureTime}, #{productPrice},#{productDesc}, #{productStatus})")
    @SelectKey(keyProperty = "id",keyColumn = "id",before = true,resultType = Integer.class,
    statement = "select product_seq.nextval from dual")
    void save(Product product);

    /**
     * find product by id
     * @param id
     * @return
     */
    @Select("select p.*,to_char(departureTime,'yyyy-mm-dd hh24:mi') departureTimeStr from product p where id = #{abc}")
    Product findById(Integer id);

    /**
     * update product
     * @param product
     */
    @Update("update product set productNum=#{productNum},productName=#{productName},cityName=#{cityName},departureTime=#{departureTime}, productPrice=#{productPrice},productDesc=#{productDesc}, productStatus=#{productStatus} where id = #{id}")
    void update(Product product);

    /**
     * delete product by id
     * @param id
     */
    @Delete("delete from product where id = #{abc}")
    void delById(Integer id);

    /**
     * find the number of a product
     * @return
     */
    @Select("select count(1) from product")
    Long findTotalCount();

    /**
     * find product by pages
     * @param startIndex
     * @param endIndex
     * @return
     */
    @Select("select t.* from (select p.*,rownum rn from product p) t where t.rn between #{param1} and #{param2}")
    List<Product> findByPage(Integer startIndex, Integer endIndex);
}
