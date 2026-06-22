import '../models/user.dart';

class AuthService {
  Future<User?> login(String username, String password) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));

    if (username == 'admin' && password == '123456') {
      return User(username: 'admin', name: 'Administrator');
    } else {
      throw Exception('Invalid username or password');
    }
  }
}
