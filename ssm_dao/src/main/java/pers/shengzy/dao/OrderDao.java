package pers.shengzy.dao;

import pers.shengzy.domain.Order;
import pers.shengzy.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrderDao {

    /**
     * find all of the orders
     * @return
     */
    @Select("select * from orders")

    @Results({
            @Result(property = "product",column = "productId",javaType = Product.class,
            one = @One(select = "ProductDao.findById"))
    })
    List<Order> findAll();

    /**
     * save the order
     * @param order
     */
    @Insert("insert into orders values(order_seq.nextval ,#{orderNum}, #{orderTime}  ,#{peopleCount},#{orderDesc}, #{payType} , #{orderStatus} , #{product.id})")
    void save(Order order);
}
