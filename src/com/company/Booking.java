package com.company;


import java.util.Scanner;

public class Booking {

    private Scanner scanner = new Scanner(System.in);
    private Database database = new Database();

    public Booking(){
    }

    public void newCustomer() {

        System.out.println("Enter you first name: ");
        String firstName = scanner.nextLine();
        System.out.println("Enter you last name: ");
        String lastName = scanner.nextLine();
        System.out.println("Enter you email: ");
        String email = scanner.nextLine();

        String fullName = firstName + " " + lastName;

        database.addCustomerToDatabase(fullName, email);

    }
    
    public void searchRooms() {

        System.out.println("How many person are you: ");
        int numberOfGuest = scanner.nextInt();
        scanner.nextLine();

        System.out.println("What options do you want?");
        System.out.println("Restaurant? [Y]/[N]");
        String restaurant = scanner.nextLine().toUpperCase();
        System.out.println("Pool? [Y]/[N]");
        String pool = scanner.nextLine().toUpperCase();
        System.out.println("Entertainment? [Y]/[N]");
        String entertainment = scanner.nextLine().toUpperCase();
        System.out.println("Kids Club? [Y]/[N]");
        String kidsClub = scanner.nextLine().toUpperCase();


        database.checkHotels(restaurant, pool, entertainment, kidsClub);


        String[] bookingDates = checkDates();
        String checkInDate = bookingDates[0];
        String checkOutDate = bookingDates[1];

        System.out.println(checkInDate + " " + checkOutDate);
        System.out.println("Would you like to book these dates? [Y]/[N]");
        String book = scanner.nextLine().toUpperCase();
        if (book.equals("y")) {
            bookRoom(checkInDate, checkOutDate, numberOfGuest);
        }

    }

    private void bookRoom(String checkInDate, String checkOutDate, int numberOfGuest) {
        System.out.println("Enter your email: ");
        String emailAddress = scanner.nextLine();

        String guestID = database.getCustomerID(emailAddress);
        int userID = Integer.parseInt(guestID);
        System.out.println(guestID);

        database.bookingRoom(userID, checkInDate, checkOutDate, numberOfGuest);

    }


    public String[] checkDates() {
        while (true) {
            System.out.println("Please enter check-in date. Format should be YYYY-MM-DD. ");
            String checkInDate = scanner.nextLine();
            if (checkInDate.compareTo("2020-05-31") <= 0) {
                System.out.println("Reservations are available between 2020.06.01 - 2020-07-31");
                continue;
            }
            System.out.println("Please enter check-out date. Format should be YYYY-MM-DD. ");
            String checkOutDate = scanner.nextLine();
            if (checkOutDate.compareTo("2020-05-31") <= 0) {
                System.out.println("Reservations are available between 2020.06.01 - 2020-07-31");
                continue;
            }
            if (!database.checkBookingDates(checkInDate, checkOutDate)) {
                System.out.println("Something went wrong please try again");
            } else {
                return new String[] {checkInDate, checkOutDate};
            }
        }
    }

    public void cancelRoom() {
        try {
            System.out.println("Enter the booking ID: ");
            int bookingID = scanner.nextInt();
            scanner.nextLine();
            System.out.println("Are you sure you want to cancel your reservation? [Y]/[N]");
            String choice = scanner.nextLine().toLowerCase();

            if (choice.equals("y")){
                database.cancelBooking(bookingID);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }


}
