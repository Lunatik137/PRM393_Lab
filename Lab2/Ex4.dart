void main() {

  /*
  1. Create a class Car with one property and a method.
   */

  Car car1 = Car("Toyota");

  print("Car brand: ${car1.brand}");
  car1.showInfo();

  print("");

  /*
  2. Create a named constructor.
   */

  Car car2 = Car.defaultCar();

  print("Default car brand: ${car2.brand}");
  car2.showInfo();

  print("");

  /*
  3. Create a subclass ElectricCar that overrides a method.
   */

  ElectricCar tesla = ElectricCar("Tesla");

  print("Electric car brand: ${tesla.brand}");
  tesla.showInfo();

}

/*
Class Car
*/
class Car {

  // Property
  String brand;

  // Constructor
  Car(this.brand);

  // Named constructor
  Car.defaultCar() : brand = "BMW";

  // Method
  void showInfo() {
    print("This is a car from $brand");
  }
}

/*
Subclass ElectricCar
*/
class ElectricCar extends Car {

  // Constructor
  ElectricCar(String brand) : super(brand);

  // Override method
  @override
  void showInfo() {
    print("This is an electric car from $brand");
  }
}