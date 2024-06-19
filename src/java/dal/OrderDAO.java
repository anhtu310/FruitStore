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
import model.Order;
import model.OrderDetails;

/**
 *
 * @author tu588
 */
public class OrderDAO extends DBContext {

    public List<Order> getAllOrder() {
        List<Order> listO = new ArrayList<>();
        String sql = "select*from dbo.[Order]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listO.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getBoolean(5)));
            }
        } catch (SQLException e) {
        }
        return listO;
    }

    public Order getOrdersByUserId(int userId) {
        try {
            String sql = "SELECT * FROM [Order] WHERE userId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return (new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getBoolean(5)));
            }
            rs.close();
            statement.close();
        } catch (SQLException ex) {
        }
        return null;
    }

    public int addOrder(Order order) {
        String sql = "INSERT INTO [Order] (userId, orderDate, totalAmount) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order.getUserId());
            ps.setDate(2, order.getOrderDate());
            ps.setInt(3, order.getTotalAmount());
            ps.executeUpdate();
            ps.close();

            sql = "SELECT MAX(orderId) FROM [Order]";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public void updateOrder(Order order) {
        String sql = "UPDATE dbo.[Order] SET userId = ?, totalAmount = ?, orderDate = ?, isPaid = ? WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getTotalAmount());
            ps.setDate(3, order.getOrderDate());
            ps.setBoolean(4, order.isIsPaid());
            ps.setInt(5, order.getOrderId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateIsPaid(Order order) {
        String sql = "UPDATE dbo.[Order] SET isPaid = ? WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, order.isIsPaid());
            ps.setInt(2, order.getOrderId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteOrder(int orderId) {
        String sql = "DELETE FROM dbo.[Order] WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //    public List<Order> getUnpaidOrders(int userId) {
    //        List<Order> unpaidOrders = new ArrayList<>();
    //        String sql = "SELECT * FROM [Order] WHERE userId = ? AND isPaid = 0";
    //        try {
    //            PreparedStatement ps = connection.prepareStatement(sql);
    //            ps.setInt(1, userId);
    //            ResultSet rs = ps.executeQuery();
    //            while (rs.next()) {
    //                Order order = new Order(rs.getInt(1),
    //                        rs.getInt(2),
    //                        rs.getDate(3),
    //                        rs.getInt(4),
    //                        rs.getBoolean(5));
    //                unpaidOrders.add(order);
    //            }
    //        } catch (SQLException e) {
    //        }
    //        return unpaidOrders;
    //    }
    public Order getUnpaidOrder(int userId) {
        String sql = "SELECT * FROM [Order] WHERE userId = ? AND isPaid = 0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getBoolean(5));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Order> getPaidOrdersByUserId(int userId) {
        List<Order> paidOrders = new ArrayList<>();
        String sql = "SELECT * FROM [Order] WHERE userId = ? AND isPaid = 1";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                paidOrders.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDate(3),
                        rs.getInt(5),
                        rs.getBoolean(4)));
            }
            rs.close();
            statement.close();
        } catch (SQLException e) {
        }
        return paidOrders;
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        OrderDetailsDAO odd = new OrderDetailsDAO();
//        List<Order> o = od.getUnpaidOrders(1);
//        for (Order order : o) {
//            System.out.println(order.toString());
//        }
//        Order o = new Order(1, 1, new java.sql.Date(System.currentTimeMillis()), 1100, false);
//        od.updateOrder(o);
//         List<Order> paidOrders = od.getPaidOrdersByUserId(1);
//         for (Order paidOrder : paidOrders) {
//             System.out.println(paidOrder.toString());
//        }
        Order o = od.getUnpaidOrder(5);
        List<OrderDetails> list = odd.getOrderDetailsByOrderId(o.getOrderId());
        int size = list.size();
        System.out.println(size);
    }
}
