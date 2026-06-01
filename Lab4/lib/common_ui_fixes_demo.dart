import 'package:flutter/material.dart';

class CommonUiFixesDemo extends StatefulWidget {
  const CommonUiFixesDemo({super.key});

  @override
  State<CommonUiFixesDemo> createState() => _CommonUiFixesDemoState();
}

class _CommonUiFixesDemoState extends State<CommonUiFixesDemo> {
  int counter = 0;

  final List<String> movies = const [
    'Movie A',
    'Movie B',
    'Movie C',
    'Movie D',
    'Movie E',
  ];

  Future<void> _openDatePicker() async {
    // DatePicker được gọi từ context hợp lệ trong widget tree
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selected: ${date.day}/${date.month}/${date.year}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 - Common UI Fixes'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        // Fix overflow màn hình nhỏ bằng SingleChildScrollView
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1. Correct ListView inside Column using Expanded',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 250,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.movie),
                            title: Text(movies[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                '2. Fix state update issue using setState()',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text('Counter: $counter'),

              ElevatedButton(
                onPressed: () {
                  // setState giúp UI cập nhật lại
                  setState(() {
                    counter++;
                  });
                },
                child: const Text('Increase Counter'),
              ),

              const SizedBox(height: 24),

              const Text(
                '3. Fix DatePicker context error',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: _openDatePicker,
                child: const Text('Open Date Picker'),
              ),

              const SizedBox(height: 24),

              const Text(
                'Explanation:\n'
                    '- ListView inside Column must use Expanded or fixed height.\n'
                    '- Overflow can be fixed by SingleChildScrollView.\n'
                    '- UI state must be updated inside setState().\n'
                    '- DatePicker should be called using valid BuildContext.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}