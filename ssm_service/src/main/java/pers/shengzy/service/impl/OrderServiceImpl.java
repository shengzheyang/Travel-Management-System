package pers.shengzy.service.impl;

import pers.shengzy.dao.OrderDao;
import pers.shengzy.domain.Order;
import pers.shengzy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }

    @Override
    public void save(Order order) {
        orderDao.save(order);
    }

}
