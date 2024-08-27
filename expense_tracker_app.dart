import 'expense_tracker.dart';
import 'authentication_service.dart';
//import 'dart:io';

// ExpenseTrackerApp class
class ExpenseTrackerApp {
  final ExpenseTracker tracker = ExpenseTracker();
  final AuthenticationService authService = AuthenticationService();

  void start() {
    authService.signUp();
    while (!authService.login()) {
      // Loop until successful login
    }
    tracker.start();
  }
}

void main() {
  ExpenseTrackerApp().start();
}
