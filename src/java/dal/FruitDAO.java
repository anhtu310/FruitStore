/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Fruit;

/**
 *
 * @author tu588
 */
public class FruitDAO extends DBContext {

    public List<Fruit> getAllFruit() {
        List<Fruit> list = new ArrayList<>();
        String sql = "select * from Fruit";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Fruit(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        d.getCategoryById(rs.getInt(5)),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println("hi");
        }
        return list;
    }

    public static void main(String[] args) {
        FruitDAO db = new FruitDAO();
        List<Fruit> list = db.getAllFruit();
        for (Fruit fruit : list) {
            System.out.println("Student Name: " + fruit.getFruitName());
        }
    }

    public List<Fruit> getFruitByCID(String id) {
        List<Fruit> list = new ArrayList<>();
        String sql = "select * from Fruit where categoryId=?";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Fruit(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        d.getCategoryById(rs.getInt(5)),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Fruit getFruitByID(String id) {
        String sql = "select * from Fruit where fruitId=?";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Fruit(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        d.getCategoryById(rs.getInt(5)),
                        rs.getString(6));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Fruit getFruitByID(int id) {
        String sql = "select * from Fruit where fruitId=?";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Fruit(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        d.getCategoryById(rs.getInt(5)),
                        rs.getString(6));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Fruit> searchByName(String text) {
        String sql = "select * from Fruit where fruitName like ?";
        DAO d = new DAO();
        List<Fruit> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Fruit(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        d.getCategoryById(rs.getInt(5)),
                        rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int addFruit(Fruit f) {
        String sql = "INSERT INTO Fruit (fruitName, price, image, categoryId, description) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, f.getFruitName());
            ps.setDouble(2, f.getPrice());
            ps.setString(3, f.getImage());
            ps.setInt(4, f.getCategory().getCategoryId());
            ps.setString(5, f.getDescription());
            ps.executeUpdate();
            ps.close();

            sql = "SELECT MAX(fruitId) FROM Fruit";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public void updateFruit(String name, double price, String image, int categoryId, String description, String id) {
        String sql = "UPDATE Fruit SET fruitName = ?,"
                + " price = ?,"
                + " image = ?,"
                + " categoryId = ?,"
                + " description = ?"
                + " WHERE fruitId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, image);
            ps.setInt(4, categoryId);
            ps.setString(5, description);
            ps.setString(6, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }

    public void deleteFruit(int id) {
        String sql = "DELETE FROM Fruit WHERE fruitId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }
}
