import 'package:flutter/material.dart';

class ProjectTypeDropdown extends StatefulWidget {
  const ProjectTypeDropdown({super.key});

  @override
  State<ProjectTypeDropdown> createState() => _ProjectTypeDropdownState();
}

class _ProjectTypeDropdownState extends State<ProjectTypeDropdown> {
  String selectedValue = 'Mô hình Cafe';
  final List<String> options = [
    'Mô hình Cafe',
    'Startup Công nghệ',
    'Kinh doanh Bán lẻ',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LOẠI DỰ ÁN',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2E2F),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              dropdownColor: const Color(0xFF1F2E2F),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.tealAccent),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedValue = newValue;
                  });
                }
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
