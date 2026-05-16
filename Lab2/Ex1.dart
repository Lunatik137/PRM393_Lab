/*
  1.	Create a main() function.
 */
void main() {

  /*
  2.	Declare variables using: int, double, String, bool.
   */

  // Integer variable
  int age = 21;

  // Double variable
  double height = 1.68;

  //String variable
  String name = "Chien";

  //Boolean varible
  bool isStudent = true;

  /*
  3.	Use print() and string interpolation ($var, ${expr}) to show values.
   */

  // Print variables using string interpolation
  print("Name: $name");
  print("Age: $age");
  print("Height: $height m");
  print("Is student: $isStudent");

  // Expression interpolation
  print("Age after 5 years: ${age + 5}");
}