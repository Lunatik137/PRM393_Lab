import 'Product.dart';
import 'ProductRepository.dart';

void main() async {
  ProductRepository repo = ProductRepository();

  // Future Example

  List<Product> products = await repo.getProducts();

  for (var p in products) {
    print(p);
  }
  print("");

  // Stream Example

  await for (var product in repo.liveProducts()) {
    print(product);
  }
}









