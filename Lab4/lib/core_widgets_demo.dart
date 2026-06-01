import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar hiển thị tiêu đề màn hình
      appBar: AppBar(
        title: const Text('Exercise 1 - Core Widgets'),
      ),

      // Body chứa các widget cơ bản
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Text widget
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Icon widget
            const Icon(
              Icons.movie,
              size: 60,
              color: Colors.blue,
            ),

            const SizedBox(height: 16),

            // Image.network lấy ảnh từ internet
            Image.network(
              'https://picsum.photos/300/200',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            // Card chứa ListTile
            Card(
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Movie Item'),
                subtitle: const Text(
                  'This is a sample ListTile inside a Card',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}