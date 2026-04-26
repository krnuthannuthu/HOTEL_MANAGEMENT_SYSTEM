package com.dao;

import com.model.Reservation;
import java.sql.*;
import java.util.*;

public class ReservationDAO {
    
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hoteldb?useSSL=false", 
            "root", 
            "Nuthu@14"  // CHANGE THIS to your MySQL password
        );
    }
    
    // Add Reservation
    public boolean addReservation(Reservation r) {
        String sql = "INSERT INTO Reservations (ReservationID, CustomerName, RoomNumber, CheckIn, CheckOut, TotalAmount) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, r.getReservationId());
            ps.setString(2, r.getCustomerName());
            ps.setString(3, r.getRoomNumber());
            ps.setDate(4, r.getCheckIn());
            ps.setDate(5, r.getCheckOut());
            ps.setDouble(6, r.getTotalAmount());
            int result = ps.executeUpdate();
            conn.close();
            return result > 0;
        } catch(Exception e) { 
            e.printStackTrace(); 
            return false; 
        }
    }
    
    // Update Reservation
    public boolean updateReservation(Reservation r) {
        String sql = "UPDATE Reservations SET CustomerName=?, RoomNumber=?, CheckIn=?, CheckOut=?, TotalAmount=? WHERE ReservationID=?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, r.getCustomerName());
            ps.setString(2, r.getRoomNumber());
            ps.setDate(3, r.getCheckIn());
            ps.setDate(4, r.getCheckOut());
            ps.setDouble(5, r.getTotalAmount());
            ps.setInt(6, r.getReservationId());
            int result = ps.executeUpdate();
            conn.close();
            return result > 0;
        } catch(Exception e) { 
            e.printStackTrace(); 
            return false; 
        }
    }
    
    // Delete Reservation
    public boolean deleteReservation(int id) {
        String sql = "DELETE FROM Reservations WHERE ReservationID=?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            conn.close();
            return result > 0;
        } catch(Exception e) { 
            e.printStackTrace(); 
            return false; 
        }
    }
    
    // Get All Reservations
    public List<Reservation> getAllReservations() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations ORDER BY ReservationID";
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("ReservationID"));
                r.setCustomerName(rs.getString("CustomerName"));
                r.setRoomNumber(rs.getString("RoomNumber"));
                r.setCheckIn(rs.getDate("CheckIn"));
                r.setCheckOut(rs.getDate("CheckOut"));
                r.setTotalAmount(rs.getDouble("TotalAmount"));
                list.add(r);
            }
            conn.close();
        } catch(Exception e) { 
            e.printStackTrace(); 
        }
        return list;
    }
    
    // Get Reservations by Date Range
    public List<Reservation> getReservationsByDateRange(String start, String end) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ? ORDER BY CheckIn";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, start);
            ps.setString(2, end);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("ReservationID"));
                r.setCustomerName(rs.getString("CustomerName"));
                r.setRoomNumber(rs.getString("RoomNumber"));
                r.setCheckIn(rs.getDate("CheckIn"));
                r.setCheckOut(rs.getDate("CheckOut"));
                r.setTotalAmount(rs.getDouble("TotalAmount"));
                list.add(r);
            }
            conn.close();
        } catch(Exception e) { 
            e.printStackTrace(); 
        }
        return list;
    }
    
    // Get Total Revenue
    public double getTotalRevenue(String start, String end) {
        String sql = "SELECT COALESCE(SUM(TotalAmount), 0) as total FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, start);
            ps.setString(2, end);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                double total = rs.getDouble("total");
                conn.close();
                return total;
            }
            conn.close();
        } catch(Exception e) { 
            e.printStackTrace(); 
        }
        return 0.0;
    }
    
    // Get Most Booked Rooms
    public Map<String, Integer> getMostBookedRooms() {
        Map<String, Integer> map = new LinkedHashMap<>();
        String sql = "SELECT RoomNumber, COUNT(*) as cnt FROM Reservations GROUP BY RoomNumber ORDER BY cnt DESC";
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
                map.put(rs.getString("RoomNumber"), rs.getInt("cnt"));
            }
            conn.close();
        } catch(Exception e) { 
            e.printStackTrace(); 
        }
        return map;
    }
    
    // Get Next Available ID
    public int getNextId() {
        String sql = "SELECT COALESCE(MAX(ReservationID), 0) + 1 as nextId FROM Reservations";
        try {
            Connection conn = getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()) {
                int id = rs.getInt("nextId");
                conn.close();
                return id;
            }
            conn.close();
        } catch(Exception e) { 
            e.printStackTrace(); 
        }
        return 1;
    }
}