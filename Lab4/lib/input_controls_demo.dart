import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double rating = 50;
  bool isActive = false;
  String? selectedGenre;
  DateTime? selectedDate;

  Future<void> _openDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 - Input Controls'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating Slider'),

            Slider(
              value: rating,
              min: 0,
              max: 100,
              divisions: 10,
              label: rating.round().toString(),
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            Text('Current value: ${rating.round()}'),

            const SizedBox(height: 24),

            const Text('Active Switch'),

            SwitchListTile(
              title: const Text('Is movie active?'),
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            ),

            const SizedBox(height: 24),

            const Text('Genre RadioListTile'),

            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),

            Text('Selected genre: ${selectedGenre ?? "None"}'),

            const SizedBox(height: 24),

            Center(
              child: ElevatedButton(
                onPressed: _openDatePicker,
                child: const Text('Open Date Picker'),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            ),
          ],
        ),
      ),
    );
  }
}