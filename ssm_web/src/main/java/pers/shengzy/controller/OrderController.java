package pers.shengzy.controller;

import pers.shengzy.domain.Order;
import pers.shengzy.domain.Product;
import pers.shengzy.service.OrderService;
import pers.shengzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    OrderService orderService;

    /**
     * find all orders
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        //find all orders
        List<Order> orderList = orderService.findAll();
        //create ModelAndView object
        ModelAndView modelAndView = new ModelAndView();
        //add data into ModelAndView
        modelAndView.addObject("orderList",orderList);
        //assign a view
        modelAndView.setViewName("order-list");
        return modelAndView;
    }

    @Autowired
    ProductService productService;

    /**
     * add an order and render it soon after
     * @return
     */
    @RequestMapping("/addUI")
    public ModelAndView addUI(){
        //find all products
        List<Product> productList = productService.findAll();
        //create ModelAndView object
        ModelAndView modelAndView = new ModelAndView();
        //add data into it
        modelAndView.addObject("productList", productList);
        //assign a view
        modelAndView.setViewName("order-add");
        return modelAndView;
    }

    /**
     * save an order
     * @param order
     * @return
     */
    @RequestMapping("/save")
    public String add(Order order){
        //save
        orderService.save(order);
        //redirect to find all orders
        return "redirect:/order/findAll";
    }
}
