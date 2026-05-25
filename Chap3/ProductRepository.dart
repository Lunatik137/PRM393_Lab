import 'Product.dart';

class ProductRepository {

  Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Product(1, "Phone", 1000),
      Product(2, "Laptop", 1500),
      Product(3, "Keyboard", 120),
    ];
  }

  Stream<Product> liveProducts() async* {
    List<Product> products = [
      Product(1, "Phone", 1000),
      Product(2, "Laptop", 1500),
      Product(3, "Keyboard", 120),
    ];

    for (var product in products) {
      await Future.delayed(Duration(seconds: 1));

      yield product;
    }
  }
}