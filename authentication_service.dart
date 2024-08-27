import 'user.dart';
import 'dart:io';

// AuthenticationService class
class AuthenticationService {
  User? registeredUser;

  void signUp() {
    stdout.write('Enter a new username: ');
    String username = stdin.readLineSync()!;

    stdout.write('Enter a new password: ');
    String password = stdin.readLineSync()!;

    registeredUser = User(username, password);
    print("\nSign-up successful! You can now log in.\n");
  }

  bool login() {
    stdout.write('Enter Login Id: ');
    String loginId = stdin.readLineSync()!;
    stdout.write('Enter Password: ');
    String password = stdin.readLineSync()!;

    if (registeredUser != null && loginId == registeredUser!.username && password == registeredUser!.password) {
      print("\nLogin Successful!\n");
      return true;
    } else {
      print("Incorrect login or password. Please try again.\n");
      return false;
    }
  }
}
