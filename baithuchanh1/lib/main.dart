import 'package:flutter/material.dart';
import 'screens/project_planning_screen.dart';

void main() {
  runApp(const FinancialPlanningApp());
}

class FinancialPlanningApp extends StatelessWidget {
  const FinancialPlanningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financial Project Planning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        fontFamily: 'Roboto', // Default font
      ),
      home: const ProjectPlanningScreen(),
    );
  }
}
