/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tu588
 */
public class OrderDetails {
    private int orderDetailId,orderId,fruitId,quantity,price,total;

    public OrderDetails() {
    }

    public OrderDetails(int orderDetailId, int orderId, int fruitId, int quantity, int price, int total) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.fruitId = fruitId;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getFruitId() {
        return fruitId;
    }

    public void setFruitId(int fruitId) {
        this.fruitId = fruitId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotal() {
        return quantity*price;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", fruitId=" + fruitId + ", quantity=" + quantity + ", price=" + price + ", total=" + total + '}';
    }
    
}
