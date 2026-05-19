import 'dart:async';
import '../models/Product.dart';

class ProductRepository {
  // Sample product data
  final List<Product> _products = [
    Product(1, "Phone", 1000),
    Product(2, "Laptop", 1500),
    Product(3, "Keyboard", 120),
  ];

  // Broadcast stream allows multiple listeners
  final StreamController<Product> _controller =
  StreamController<Product>.broadcast();

  // Return all products asynchronously
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return _products;
  }

  // Return stream for listening to newly added products
  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  // Add product and emit it to stream
  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product);
  }

  // Close stream controller to avoid memory leak
  void dispose() {
    _controller.close();
  }
}