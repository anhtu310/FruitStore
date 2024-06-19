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
import model.User;

/**
 *
 * @author tu588
 */
public class UserDAO extends DBContext {

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from dbo.[User]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int addUser(User u) {
        String sql = "INSERT INTO dbo.[User]([name], [password], email, phoneNumber, isAdmin) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPhoneNumber());
            ps.setInt(5, u.getIsAdmin());
            ps.executeUpdate();
            ps.close();

            sql = "SELECT MAX(userId) FROM dbo.[User]";
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public void deleteUser(int id) {
        String sql = "DELETE FROM dbo.[User] WHERE userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }

    public List<User> searchByName(String text) {
        String sql = "select * from dbo.[User] where name like ?";
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public User getUserByID(String id) {
        String sql = "select * from dbo.[User] where userId=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateUser(String name, String password, String email, String phoneNumber, int isAdmin, int userId) {
        String sql = "UPDATE [User] SET [name] = ?,"
                + " [password] = ?,"
                + " email = ?,"
                + " phoneNumber = ?,"
                + " isAdmin = ?"
                + " WHERE userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phoneNumber);
            ps.setInt(5, isAdmin);
            ps.setInt(6, userId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
        }
    }
}
