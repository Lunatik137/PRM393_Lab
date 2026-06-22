import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationService = NotificationService();
    // Initialize in build for simplicity in this project, 
    // though usually done in main or a stateful widget's initState.
    notificationService.init();

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications Lab')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => notificationService.requestPermissions(),
              child: const Text('Request Android 13+ Permissions'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => notificationService.showNotification(
                title: 'Test Notification',
                body: 'This is a manual notification trigger!',
              ),
              child: const Text('Trigger Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
