import 'package:flutter/material.dart';

class FeatureIntroScreen extends StatefulWidget {
  const FeatureIntroScreen({super.key});

  @override
  State<FeatureIntroScreen> createState() => _FeatureIntroScreenState();
}

class _FeatureIntroScreenState extends State<FeatureIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<Map<String, dynamic>> _features = [
    {
      'icon': Icons.star_outline,
      'title': 'Tính năng',
      'description': 'Khám phá các tính năng nổi bật của ứng dụng.',
    },
    {
      'icon': Icons.info_outline,
      'title': 'Giới thiệu',
      'description': 'Tìm hiểu thêm về ứng dụng và cách sử dụng.',
    },
    {
      'icon': Icons.track_changes_outlined,
      'title': 'Theo dõi',
      'description': 'Theo dõi tiến trình và hoạt động của bạn.',
    },
    {
      'icon': Icons.play_circle_outline,
      'title': 'Bắt đầu',
      'description': 'Sẵn sàng bắt đầu hành trình cùng chúng tôi!',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feature Intro')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _features.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final feature = _features[index];
                return Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            feature['icon'] as IconData,
                            size: 80,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            feature['title'] as String,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            feature['description'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _features.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentPage == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
