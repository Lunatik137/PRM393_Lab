void main() {
  // Integer variable
  int age = 21;

  // Double variable
  double height = 1.68;

  //String variable
  String name = "Chien";

  //Boolean varible
  bool isStudent = true;

  // Print variables using string interpolation
  print("Name: $name");
  print("Age: $age");
  print("Height: $height m");
  print("Is student: $isStudent");

  // Expression interpolation
  print("Age after 5 years: ${age + 5}");
}