void main() {

  /*
  1.	Create a List of integers.
   */

  // List
  List<int> numbers = [1, 5, 3, 4, 5, 6, 6, 7, 3];

  /*
  2.	Use arithmetic & comparison operators.
   */

  // Arithmetic operators
  int a = 13;
  int b = 5;
  print("Addition: ${a+b}");
  print("Subtraction: ${a-b}");

  // Comparison operators
  print("a == b: ${a==b}");

  /*
  3.	Create a Set (unique values) and a Map (key-value).
   */

  // Set
  Set<String> animals = {"Dog","Cat","Mouse","Cat"};
  print("animals: $animals");

  // Map
  Map<String, String> sounds = {
    "Dog" : "Gau Gau",
    "Cat" : "Meo Meo",
    "Mouse" : "Chit Chit"
  };
  print("sounds: $sounds");

  /*
  4.	Use indexing, add(), remove(), and map access.
   */

  // Indexing
  print("First number of the list: ${numbers.last}");

  // Add
  numbers.add(23);
  print("List after add: $numbers");

  // Remove
  numbers.remove(5);
  print("List after remove: $numbers");

  // Map Access
  print("Dog sound: ${sounds["Dog"]}");
}