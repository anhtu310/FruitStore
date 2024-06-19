/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tu588
 */
public class ItemDTO {
    private String fruitName,image,categoryName;
    private int quantity,price,orderId;

    public ItemDTO() {
    }

    public ItemDTO(String fruitName, String image, String categoryName, int quantity, int price, int orderId) {
        this.fruitName = fruitName;
        this.image = image;
        this.categoryName = categoryName;
        this.orderId = orderId;
        this.quantity = quantity;
        this.price = price;
    }

    public String getFruitName() {
        return fruitName;
    }

    public void setFruitName(String fruitName) {
        this.fruitName = fruitName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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

    @Override
    public String toString() {
        return "ItemDTO{" + "fruitName=" + fruitName + ", image=" + image + ", categoryName=" + categoryName + ", quantity=" + quantity + ", price=" + price + ", orderId=" + orderId + '}';
    }
    
    
}
