package com.app.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.app.model.User;
import com.app.util.DBConnection;

public class UserDao {

    public boolean register(User user) {
        String sql = "INSERT INTO users(username, password, email, full_name, role, profile_image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getFullName());
            ps.setString(5, user.getRole() != null ? user.getRole() : "USER");
            ps.setString(6, user.getProfileImage());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User login(String username, String password) {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getAllUsers(int offset, int limit, String search, String roleFilter) {
        List<User> users = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM users WHERE 1=1");
        
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (username LIKE ? OR email LIKE ? OR full_name LIKE ?)");
        }
        if (roleFilter != null && !roleFilter.isEmpty() && !"ALL".equals(roleFilter)) {
            sql.append(" AND role = ?");
        }
        sql.append(" LIMIT ? OFFSET ?");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            int paramIdx = 1;
            if (search != null && !search.isEmpty()) {
                String searchTerm = "%" + search + "%";
                ps.setString(paramIdx++, searchTerm);
                ps.setString(paramIdx++, searchTerm);
                ps.setString(paramIdx++, searchTerm);
            }
            if (roleFilter != null && !roleFilter.isEmpty() && !"ALL".equals(roleFilter)) {
                ps.setString(paramIdx++, roleFilter);
            }
            ps.setInt(paramIdx++, limit);
            ps.setInt(paramIdx++, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getTotalUserCount(String search, String roleFilter) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM users WHERE 1=1");
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (username LIKE ? OR email LIKE ? OR full_name LIKE ?)");
        }
        if (roleFilter != null && !roleFilter.isEmpty() && !"ALL".equals(roleFilter)) {
            sql.append(" AND role = ?");
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            int paramIdx = 1;
            if (search != null && !search.isEmpty()) {
                String searchTerm = "%" + search + "%";
                ps.setString(paramIdx++, searchTerm);
                ps.setString(paramIdx++, searchTerm);
                ps.setString(paramIdx++, searchTerm);
            }
            if (roleFilter != null && !roleFilter.isEmpty() && !"ALL".equals(roleFilter)) {
                ps.setString(paramIdx++, roleFilter);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE users SET email=?, full_name=?, role=?, profile_image=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFullName());
            ps.setString(3, user.getRole());
            ps.setString(4, user.getProfileImage());
            ps.setInt(5, user.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapResultSetToUser(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setFullName(rs.getString("full_name"));
        user.setRole(rs.getString("role"));
        user.setProfileImage(rs.getString("profile_image"));
        user.setCreatedAt(rs.getTimestamp("created_at"));
        return user;
    }
}