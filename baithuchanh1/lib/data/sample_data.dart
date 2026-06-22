import 'package:flutter/material.dart';
import '../models/cost_category.dart';

class SampleData {
  static List<CostCategory> costCategories = [
    CostCategory(
      title: 'Thuê Mặt Bằng',
      amount: '500.000.000 đ',
      status: 'Trong hạn',
      icon: Icons.home_work_outlined,
      color: Colors.orangeAccent,
    ),
    CostCategory(
      title: 'Thiết Kế & Thi công',
      amount: '1.000.000.000 đ',
      status: 'Quá hạn',
      icon: Icons.architecture_outlined,
      color: Colors.redAccent,
    ),
    CostCategory(
      title: 'Thiết Bị & Máy Móc',
      amount: '1.000.000.000 đ',
      status: 'Sắp tới',
      icon: Icons.precision_manufacturing_outlined,
      color: Colors.blueAccent,
    ),
    CostCategory(
      title: 'Nguyên liệu đầu vào',
      amount: '12.000.000 đ',
      status: 'Đã chi',
      icon: Icons.inventory_2_outlined,
      color: Colors.greenAccent,
    ),
    CostCategory(
      title: 'Marketing & Khai trương',
      amount: '97.500.000 đ',
      status: 'Chờ duyệt',
      icon: Icons.campaign_outlined,
      color: Colors.deepOrangeAccent,
    ),
  ];

  static Map<String, double> actualDistribution = {
    'Thi công': 35,
    'Thiết bị': 25,
    'Mặt bằng': 15,
    'Nguyên liệu': 15,
    'Marketing': 10,
  };

  static Map<String, double> standardModel = {
    'Mặt bằng': 20,
    'Thi công': 30,
    'Thiết bị': 20,
    'Nguyên liệu': 15,
    'Marketing': 10,
  };

  static List<Color> chartColors = [
    Colors.tealAccent.shade400,
    Colors.cyanAccent,
    Colors.lightBlueAccent,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
  ];
}
