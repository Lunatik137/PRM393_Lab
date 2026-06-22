import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => authService.signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user.photoURL != null)
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 50,
              ),
            const SizedBox(height: 20),
            Text(user.displayName ?? 'No Name', style: const TextStyle(fontSize: 20)),
            Text(user.email ?? 'No Email', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            Text('UID: ${user.uid}', style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
