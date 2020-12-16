package com.company;

import java.util.Scanner;

public class Menu {

    private Scanner scanner = new Scanner(System.in);
    private Database database = new Database();
    private Booking booking = new Booking();

    public Menu() {
        mainMenu();
    }

    private void mainMenu() {

        boolean running = true;
        while (running){

            System.out.println("Welcome to Holidaymaker");
            System.out.println("What do you want to do?");
            System.out.println("1. Register new customer");
            System.out.println("2. Search and book rooms");
            System.out.println("3. Cancel a room");
            System.out.println("4. Quit");

            String choice = scanner.nextLine();

            switch (choice){
                case "1":
                    booking.newCustomer();
                    break;
                case "2":
                    booking.searchRooms();
                    break;
                case "3":
                    booking.cancelRoom();
                    break;
                case "4":
                    running = false;
                    break;
                default:
                    System.out.println("Please choose a valid number");
            }

        }
    }
}
