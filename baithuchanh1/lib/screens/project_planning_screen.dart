import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../widgets/project_type_dropdown.dart';
import '../widgets/budget_projection_section.dart';
import '../widgets/cost_category_card.dart';
import '../widgets/donut_chart_card.dart';
import '../widgets/custom_bottom_nav.dart';

class ProjectPlanningScreen extends StatelessWidget {
  const ProjectPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F1718), Color(0xFF050505)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 900;
              
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'LẬP KẾ HOẠCH TÀI CHÍNH DỰ ÁN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        const ProjectTypeDropdown(),
                        const SizedBox(height: 32),
                        
                        if (isWide)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(child: BudgetPlanningCard()),
                              const SizedBox(width: 24),
                              Expanded(child: _buildCostCategorySection()),
                            ],
                          )
                        else
                          Column(
                            children: [
                              const BudgetPlanningCard(),
                              const SizedBox(height: 32),
                              _buildCostCategorySection(),
                            ],
                          ),
                        
                        const SizedBox(height: 40),
                        
                        if (isWide)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: DonutChartCard(
                                  title: 'PHÂN BỔ THỰC TẾ',
                                  data: SampleData.actualDistribution,
                                  colors: SampleData.chartColors,
                                  footer: 'TỔNG CHI: 2.380.000.000 VNĐ',
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: DonutChartCard(
                                  title: 'MÔ HÌNH CHUẨN',
                                  data: SampleData.standardModel,
                                  colors: SampleData.chartColors,
                                ),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              DonutChartCard(
                                title: 'PHÂN BỔ THỰC TẾ',
                                data: SampleData.actualDistribution,
                                colors: SampleData.chartColors,
                                footer: 'TỔNG CHI: 2.380.000.000 VNĐ',
                              ),
                              const SizedBox(height: 24),
                              DonutChartCard(
                                title: 'MÔ HÌNH CHUẨN',
                                data: SampleData.standardModel,
                                colors: SampleData.chartColors,
                              ),
                            ],
                          ),
                          
                        const SizedBox(height: 32),
                        const Text(
                          'BIỂU ĐỒ CHUẨN MÔ HÌNH CAFE',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10,
        backgroundColor: Colors.tealAccent.shade700,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCostCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HẠNG MỤC CHI PHÍ',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SampleData.costCategories.length,
          itemBuilder: (context, index) {
            return CostCategoryCard(
              category: SampleData.costCategories[index],
            );
          },
        ),
      ],
    );
  }
}
