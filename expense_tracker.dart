import 'expense.dart';
import 'dart:io';

// ExpenseTracker class
class ExpenseTracker {
  List<Expense> expenses = [];

  void addExpense() {
    stdout.write("\nEnter Expense Title: ");
    String title = stdin.readLineSync()!;

    stdout.write("Enter Amount: ");
    double amount = double.parse(stdin.readLineSync()!);

    stdout.write("Enter Category: ");
    String category = stdin.readLineSync()!;

    stdout.write("Enter Date (dd/mm/yyyy): ");
    String date = stdin.readLineSync()!;

    expenses.add(Expense(title, amount, category, date));
    print("\nExpense added successfully!");
  }

  void showExpenses([String? sortBy]) {
    if (expenses.isEmpty) {
      print("\nNo expenses recorded.");
      return;
    }

    List<Expense> sortedExpenses = List.from(expenses);

    if (sortBy == 'date') {
      sortedExpenses.sort((a, b) => a.date.compareTo(b.date));
    } else if (sortBy == 'amount') {
      sortedExpenses.sort((a, b) => a.amount.compareTo(b.amount));
    }

    for (var expense in sortedExpenses) {
      print(expense);
    }
  }

  void searchExpense() {
    if (expenses.isEmpty) {
      print("\nNo expenses recorded.");
      return;
    }

    stdout.write("\nSearch by Title, Category, or Date (dd/mm/yyyy): ");
    String query = stdin.readLineSync()!.toLowerCase();

    List<Expense> foundExpenses = expenses.where((expense) {
      return expense.title.toLowerCase().contains(query) ||
          expense.category.toLowerCase().contains(query) ||
          expense.date == query;
    }).toList();

    if (foundExpenses.isEmpty) {
      print("\nNo matching expenses found.");
    } else {
      for (var expense in foundExpenses) {
        print(expense);
      }
    }
  }

  void updateExpense() {
    if (expenses.isEmpty) {
      print("\nNo expenses recorded.");
      return;
    }

    stdout.write("\nEnter the title of the expense you want to update: ");
    String title = stdin.readLineSync()!;

    var expense = expenses.firstWhere(
      (e) => e.title.toLowerCase() == title.toLowerCase(),
      orElse: () => Expense('', 0, '', ''),
    );

    if (expense.title.isEmpty) {
      print("\nExpense not found.");
      return;
    }

    stdout.write("Enter New Title (Leave blank to keep '${expense.title}'): ");
    String newTitle = stdin.readLineSync()!;
    if (newTitle.isNotEmpty) expense.title = newTitle;

    stdout.write("Enter New Amount (Leave blank to keep '${expense.amount}'): ");
    String newAmount = stdin.readLineSync()!;
    if (newAmount.isNotEmpty) expense.amount = double.parse(newAmount);

    stdout.write("Enter New Category (Leave blank to keep '${expense.category}'): ");
    String newCategory = stdin.readLineSync()!;
    if (newCategory.isNotEmpty) expense.category = newCategory;

    stdout.write("Enter New Date (Leave blank to keep '${expense.date}'): ");
    String newDate = stdin.readLineSync()!;
    if (newDate.isNotEmpty) expense.date = newDate;

    print("\nExpense updated successfully!");
  }

  void deleteExpense() {
    if (expenses.isEmpty) {
      print("\nNo expenses recorded.");
      return;
    }

    stdout.write("\nEnter the title of the expense you want to delete: ");
    String title = stdin.readLineSync()!;

    expenses.removeWhere((expense) => expense.title.toLowerCase() == title.toLowerCase());

    print("\nExpense deleted successfully!");
  }


  void showMenu() {
    print("\nExpense Tracker Menu");
    print("1. Add Expense");
    print("2. Show All Expenses");
    print("3. Search Expense");
    print("4. Update Expense");
    print("5. Delete Expense");
    print("0. Exit");
  }

  void start() {
    while (true) {
      showMenu();
      stdout.write("\nEnter your choice: ");
      String choice = stdin.readLineSync()!;

      switch (choice) {
        case '1':
          addExpense();
          break;
        case '2':
          showExpenses();
          break;
        case '3':
          searchExpense();
          break;
        case '4':
          updateExpense();
          break;
        case '5':
          deleteExpense();
          break;
        case '0':
          print("Expense Tracker made by Wajiha Lakhany!");
          exit(0);
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }
}
