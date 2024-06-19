/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tu588
 */
public class Item {
    private String fruitName,image,categoryName;
    private int quantity,price;

    public Item() {
    }

    public Item(String image , String fruitName, String categoryName, int quantity, int price) {
        this.fruitName = fruitName;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.categoryName = categoryName;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int total) {
        this.price = total;
    }

    @Override
    public String toString() {
        return "Item{" + "fruitName=" + fruitName + ", image=" + image + ", categoryName=" + categoryName + ", quantity=" + quantity + ", price=" + price + '}';
    }

   
}
