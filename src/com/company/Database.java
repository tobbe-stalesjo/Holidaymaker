package com.company;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Database {

    private Connection connection = null;
    private PreparedStatement statement;
    private ResultSet resultSet;

    public Database() {
        connect();
    }

    private void connect() {
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost/holidaymaker?user=root&password=mysql&serverTimezone=UTC");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCustomerToDatabase(String fullName,  String email) {
        try {
            statement = connection.prepareStatement("INSERT INTO customer (name, email) VALUES (?, ?)");
            statement.setString(1, fullName);
            statement.setString(2, email);

            System.out.println("New customer " + fullName +  " added. \n");

            try {
                statement.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error message: " + e.getMessage());
            }
        }

        catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void cancelBooking(int bookingID) {
        try {
            statement = connection.prepareStatement("DELETE FROM booking WHERE customer_id = ?");
            statement.setInt(1, bookingID);

            try {
                statement.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Error message: " + e.getMessage());
            }

            System.out.println("Reservation successfully removed!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean checkBookingDates(String checkInDate, String checkOutDate) {
        try {
            statement = connection.prepareStatement("SELECT * FROM booking\n" +
                    "WHERE ? NOT BETWEEN check_in_date AND check_out_date\n" +
                    "AND ? NOT BETWEEN check_in_date AND check_out_date\n" +
                    "OR check_in_date IS NULL\n" +
                    "OR check_out_date IS NULL;");

            statement.setString(1, checkInDate);
            statement.setString(2, checkOutDate);

            try {
                resultSet = statement.executeQuery();
            } catch (SQLException e) {
                System.out.println("Error message: " + "\n" + e.getMessage() + "\n");
            }
            return resultSet.next();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }


    public void checkHotels(String restaurant, String pool, String entertainment, String kidsClub) {
        try {
            String query = "SELECT * FROM facility\n" +
                    "WHERE restaurant = ? \n" +
                    "AND pool = ? \n" +
                    "AND entertainment = ?\n" +
                    "AND kids_club = ?";

            statement = connection.prepareStatement(query);

            statement.setString(1, restaurant);
            statement.setString(2, pool);
            statement.setString(3, entertainment);
            statement.setString(4, kidsClub);

            resultSet = statement.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
                while(resultSet.next()){
                    String filterHotels =
                            "**************************************" + "\n" +
                            "ID: " + resultSet.getInt("id") + "\n" +
                            "**************************************" + "\n";

                    System.out.println(filterHotels);
                }
            } catch (SQLException e) {
            System.out.println("Error message: " + e.getMessage());
        }
    }

    public String getCustomerID(String emailAddress) {
        StringBuilder ID = new StringBuilder();

        try {
            statement = connection.prepareStatement("SELECT email FROM customer\n" +
                    "WHERE email = ?\n");

            statement.setString(1, emailAddress);
            resultSet = statement.executeQuery();

            while (resultSet.next()){
                ID.append(resultSet.getString("id"));
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }
        return ID.toString();
    }

    public void bookingRoom(int userID, String checkInDate, String checkOutDate, int numberOfGuest) {
        try {
            statement = connection.prepareStatement("INSERT INTO booking(customer_id, check_in_date, check_out_date, number_of_guest)\n" +
                    "VALUES(?, ?, ?, ?);");
            statement.setInt(1, userID);
            statement.setString(2, checkInDate);
            statement.setString(3, checkOutDate);
            statement.setInt(4, numberOfGuest);

            statement.executeUpdate();

            System.out.println("Booking added. ");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
