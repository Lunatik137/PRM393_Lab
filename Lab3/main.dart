import 'dart:async';

import 'models/Product.dart';
import 'models/Settings.dart';
import 'repositories/ProductRepository.dart';
import 'repositories/UserRepository.dart';

Future<void> main() async {
  await exercise1();
  await exercise2();
  exercise3();

  await Future.delayed(Duration(milliseconds: 100));

  await exercise4();
  exercise5();
}

/*
  Exercise 1
  Product Model & Repository
 */

Future<void> exercise1() async {
  print('Exercise 1: Product Repository');

  var productRepo = ProductRepository();

  // Listen to newly added products
  productRepo.liveAdded().listen((product) {
    print('New product added: $product');
  });

  // Get all products using Future
  var products = await productRepo.getAll();
  print('All products: $products');

  // Add a new product to trigger stream event
  productRepo.addProduct(Product(3, 'Headphone', 50));

  // Wait a little so stream can print before moving to Exercise 2
  await Future.delayed(Duration(milliseconds: 100));

  productRepo.dispose();
}

/*
  Exercise 2
  User Repository with JSON
 */

Future<void> exercise2() async {
  print('\nExercise 2: User Repository with JSON');

  var userRepo = UserRepository();
  // Fetch and parse users from simulated JSON data
  var users = await userRepo.fetchUsers();

  print('Users: $users');
}

/*
  Exercise 3
  Async + Microtask Debugging
 */

void exercise3() {
  print('\nExercise 3: Async + Microtask');

  print('Start');

  // Microtask queue runs before event queue
  scheduleMicrotask(() {
    print('Microtask');
  });

  // Future callback is added to event queue
  Future(() {
    print('Future Event');
  });

  print('End');
}

/*
  Exercise 4
  Stream Transformation
 */

Future<void> exercise4() async {
  print('\nExercise 4: Stream Transformation');

  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);

  // Square each number, then filter only even square values
  await numbers
      .map((number) => number * number)
      .where((square) => square % 2 == 0)
      .forEach((value) {
    print('Even square: $value');
  });
}

/*
  Exercise 5
  Factory Constructors & Cache
 */

void exercise5() {
  print('\nExercise 5: Factory Constructors & Cache');

  var a = Settings();
  var b = Settings();

  // identical() checks whether both variables refer to the same object
  print('Are same instance: ${identical(a, b)}');
}