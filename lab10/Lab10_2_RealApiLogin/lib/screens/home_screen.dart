import 'package:flutter/material.dart';
import '../models/auth_response.dart';

class HomeScreen extends StatelessWidget {
  final AuthResponse authResponse;
  const HomeScreen({super.key, required this.authResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(authResponse.image),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text('Welcome, ${authResponse.firstName} ${authResponse.lastName}!',
                style: const TextStyle(fontSize: 20)),
            Text(authResponse.email, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Token: ${authResponse.token}',
                  style: const TextStyle(fontSize: 10), textAlign: TextAlign.center),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
