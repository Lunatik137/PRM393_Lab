import 'package:flutter/material.dart';

import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_demo.dart';
import 'app_structure_demo.dart';
import 'common_ui_fixes_demo.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeMenuScreen(),
    );
  }
}

class HomeMenuScreen extends StatelessWidget {
  const HomeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Flutter UI Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _menuItem(
            context,
            title: 'Exercise 1 - Core Widgets',
            screen: const CoreWidgetsDemo(),
          ),
          _menuItem(
            context,
            title: 'Exercise 2 - Input Controls',
            screen: const InputControlsDemo(),
          ),
          _menuItem(
            context,
            title: 'Exercise 3 - Layout Demo',
            screen: const LayoutDemo(),
          ),
          _menuItem(
            context,
            title: 'Exercise 4 - App Structure & Theme',
            screen: const AppStructureDemo(),
          ),
          _menuItem(
            context,
            title: 'Exercise 5 - Common UI Fixes',
            screen: const CommonUiFixesDemo(),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
      BuildContext context, {
        required String title,
        required Widget screen,
      }) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
      ),
    );
  }
}