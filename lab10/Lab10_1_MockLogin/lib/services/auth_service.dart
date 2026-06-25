import 'dart:async';
import '../models/user.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock login logic
    if (email == 'test@example.com' && password == 'password123') {
      return User(
        id: '1',
        email: email,
        token: 'mock_jwt_token_abc123',
      );
    } else {
      throw Exception('Invalid email or password');
    }
  }
}
