import 'package:flutter/material.dart';

class BudgetPlanningCard extends StatefulWidget {
  const BudgetPlanningCard({super.key});

  @override
  State<BudgetPlanningCard> createState() => _BudgetPlanningCardState();
}

class _BudgetPlanningCardState extends State<BudgetPlanningCard> {
  double _currentBudget = 2500000000;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1F2E2F),
      elevation: 8,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DỰ TRÙ NGÂN SÁCH',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tổng mức đầu tư',
                      style: TextStyle(color: Colors.white38, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(_currentBudget / 1000000000).toStringAsFixed(3).replaceAll('.', ',')} VNĐ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildInputButton(),
              ],
            ),
            const SizedBox(height: 24),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.tealAccent,
                inactiveTrackColor: Colors.white12,
                thumbColor: Colors.tealAccent,
                overlayColor: Colors.tealAccent.withOpacity(0.1),
                trackHeight: 6,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                trackShape: const RoundedRectSliderTrackShape(),
              ),
              child: Slider(
                value: _currentBudget,
                min: 500000000,
                max: 5000000000,
                onChanged: (value) {
                  setState(() {
                    _currentBudget = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAdjustButton(Icons.remove, () {
                  setState(() {
                    if (_currentBudget > 500000000) _currentBudget -= 50000000;
                  });
                }),
                const SizedBox(width: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Text(
                    '${(_currentBudget / 1000000000).toStringAsFixed(1)} Tỷ',
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                _buildAdjustButton(Icons.add, () {
                  setState(() {
                    if (_currentBudget < 5000000000) _currentBudget += 50000000;
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.withOpacity(0.5)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Ngân input',
            style: TextStyle(color: Colors.tealAccent, fontSize: 11),
          ),
          SizedBox(width: 4),
          Icon(Icons.edit, size: 14, color: Colors.tealAccent),
        ],
      ),
    );
  }

  Widget _buildAdjustButton(IconData icon, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
