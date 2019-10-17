package pers.shengzy.service;

import pers.shengzy.domain.Order;

import java.util.List;

public interface OrderService {
    /**
     * find all orders
     * @return
     */
    List<Order> findAll();

    /**
     * save an order
     * @param order
     */
    void save(Order order);
}
