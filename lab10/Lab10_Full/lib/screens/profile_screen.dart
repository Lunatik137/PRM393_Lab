// Fixed profile screen imports
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: user != null 
          ? Column(
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
              ],
            )
          : const Text('Logged in via DummyJSON API (No extended profile)'),
      ),
    );
  }
}
