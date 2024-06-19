/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Item;
import model.ItemDTO;

/**
 *
 * @author tu588
 */
public class ItemDAO extends DBContext {

    public List<Item> getAllItems() {
        List<Item> listI = new ArrayList<>();
        String sql = "SELECT F.[image], F.fruitName, C.categoryName, OD.quantity, OD.price\n"
                + "FROM [Order] O\n"
                + "JOIN OrderDetails OD ON O.orderId = OD.orderId\n"
                + "JOIN Fruit F ON OD.fruitId = F.fruitId\n"
                + "JOIN Category C ON F.categoryId = C.categoryId\n"
                + "WHERE O.isPaid = 0;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listI.add(new Item(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (SQLException e) {
        }
        return listI;
    }

    public List<ItemDTO> getAllItemsPaid(int userId) {
        List<ItemDTO> listI = new ArrayList<>();
        String sql = """
                     SELECT F.[image], F.fruitName, C.categoryName, OD.quantity, OD.price, O.orderId
                                          FROM [Order] O
                                          JOIN OrderDetails OD ON O.orderId = OD.orderId
                                          JOIN Fruit F ON OD.fruitId = F.fruitId
                                          JOIN Category C ON F.categoryId = C.categoryId
                                          WHERE O.isPaid = 1 AND o.userId = ?;""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listI.add(new ItemDTO(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {
            System.out.println("hi");
        }
        return listI;
    }

    public static void main(String[] args) {
        ItemDAO id = new ItemDAO();
        List<ItemDTO> i = id.getAllItemsPaid(1);
        for (ItemDTO item : i) {
            System.out.println(item.toString());
        }
    }
}
