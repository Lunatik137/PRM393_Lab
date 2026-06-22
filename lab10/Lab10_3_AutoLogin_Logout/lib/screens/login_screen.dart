import 'package:flutter/material.dart';
import '../services/session_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _sessionService = SessionService();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    // Simulate login and save token
    await Future.delayed(const Duration(seconds: 1));
    await _sessionService.saveToken('mock_token_123');
    
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: _isLoading 
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Login and Save Session'),
            ),
      ),
    );
  }
}
