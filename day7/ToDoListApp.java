import java.util.ArrayList;
import java.util.Scanner;

public class ToDoListApp {
    private static ArrayList<String> tasks = new ArrayList<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        while (running) {
            printMenu();
            System.out.print("Enter your choice: ");
            int choice;

            try {
                choice = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Invalid input! Please enter a number.");
                continue;
            }

            switch (choice) {
                case 1:
                    addTask(scanner);
                    break;
                case 2:
                    viewTasks();
                    break;
                case 3:
                    deleteTask(scanner);
                    break;
                case 4:
                    System.out.println("Exiting the application. Goodbye!");
                    running = false;
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
        scanner.close();
    }

    private static void printMenu() {
        System.out.println("\n===== To-Do List Application =====");
        System.out.println("1. Add a task");
        System.out.println("2. View all tasks");
        System.out.println("3. Delete a task");
        System.out.println("4. Exit");
        System.out.println("==================================");
    }

    private static void addTask(Scanner scanner) {
        System.out.print("Enter the task description: ");
        String task = scanner.nextLine();
        tasks.add(task);
        System.out.println("Task added successfully!");
    }

    private static void viewTasks() {
        System.out.println("\n===== Your To-Do List =====");
        if (tasks.isEmpty()) {
            System.out.println("No tasks found!");
        } else {
            for (int i = 0; i < tasks.size(); i++) {
                System.out.println((i + 1) + ". " + tasks.get(i));
            }
        }
    }

    private static void deleteTask(Scanner scanner) {
        viewTasks();
        if (tasks.isEmpty()) {
            return; // No tasks to delete
        }

        System.out.print("Enter the task number to delete: ");
        int taskNumber;

        try {
            taskNumber = Integer.parseInt(scanner.nextLine());
            if (taskNumber < 1 || taskNumber > tasks.size()) {
                System.out.println("Invalid task number! Please try again.");
                return;
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid input! Please enter a number.");
            return;
        }

        tasks.remove(taskNumber - 1);
        System.out.println("Task deleted successfully!");
    }
}
