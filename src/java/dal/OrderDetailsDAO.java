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
import model.OrderDetails;

/**
 *
 * @author tu588
 */
public class OrderDetailsDAO extends DBContext {

    public int addOrderDetails(OrderDetails od) {
        String sql = "insert into dbo.[OrderDetails]"
                + "(orderId,fruitId,quantity,price,total)"
                + "values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, od.getOrderId());
            ps.setInt(2, od.getFruitId());
            ps.setInt(3, od.getQuantity());
            ps.setInt(4, od.getPrice());
            ps.setInt(5, od.getTotal());
            ps.executeUpdate();
            ps.close();

            sql = "SELECT MAX(orderDetailId) FROM [OrderDetails]";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public List<OrderDetails> getAllOrderDetails() {
        List<OrderDetails> listO = new ArrayList<>();
        String sql = "select*from dbo.[OrderDetails]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listO.add(new OrderDetails(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {
        }
        return listO;
    }

    public void updateOrderDetails(OrderDetails orderDetails) {
        String sql = "UPDATE dbo.[OrderDetails] SET orderId = ?, fruitId = ?, quantity = ?, price = ?, total = ? WHERE orderDetailId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderDetails.getOrderId());
            ps.setInt(2, orderDetails.getFruitId());
            ps.setInt(3, orderDetails.getQuantity());
            ps.setInt(4, orderDetails.getPrice());
            ps.setInt(5, orderDetails.getTotal());
            ps.setInt(6, orderDetails.getOrderDetailId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteOrderDetails(int orderDetailId) {
        String sql = "DELETE FROM dbo.[OrderDetails] WHERE orderDetailId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderDetailId);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<OrderDetails> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String sql = "SELECT * FROM dbo.[OrderDetails] WHERE orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrderDetailId(rs.getInt(1));
                orderDetails.setOrderId(rs.getInt(2));
                orderDetails.setFruitId(rs.getInt(3));
                orderDetails.setQuantity(rs.getInt(4));
                orderDetails.setPrice(rs.getInt(5));
                orderDetails.setTotal(rs.getInt(6));
                orderDetailsList.add(orderDetails);
            }
        } catch (SQLException e) {
        }
        return orderDetailsList;
    }

    public static void main(String[] args) {
        OrderDetailsDAO odd = new OrderDetailsDAO();
        List<OrderDetails> orderDetailsList = odd.getOrderDetailsByOrderId(1);
        for (OrderDetails orderDetails : orderDetailsList) {
            System.out.println(orderDetails.toString());
        }

    }
}
