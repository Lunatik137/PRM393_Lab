void main() {
  /*
  1.	Write an if/else block to check score.
   */

  int score = 35;

  if (score >= 90) {
    print("Grade: A");
  } else if (score >= 70) {
    print("Grade: B");
  } else if (score >= 50){
    print("Grade: C");
  } else if (score >= 40) {
    print("Grade: D");
  } else
    print("Grade: F");
  print("");

  /*
  2.	Write a switch case for day of week.
   */

  String day = "Saturday";

  switch (day) {
    case "Monday":
      print("Start of the work week");
      break;

    case "Friday":
      print("Last working day");
      break;

    case "Saturday":
      print("Weekend");
      break;

    case "Sunday":
      print("Rest day");
      break;

    default:
      print("Normal day");
  }
  print("");

  /*
  3.	Loop through a collection using for, for-in, and forEach().
   */

  List<String> animals = ["Dog","Cat","Mouse"];

  //for
  print("For loop:");
  for (int i = 0; i < animals.length; i++) {
    print(animals[i]);
  }
  print("");

  //for-in
  print("For-in loop:");

  for (String a in animals) {
    print(a);
  }
  print("");

  //forEach
  print("forEach loop:");

  animals.forEach((a) {
    print(a);
  });
  print("");

  int result1 = addNormal(10, 5); // Normal function
  int result2 = addArrow(10, 5); // Arrow function
  print("result1 == result2: ${result1==result2}");

}

/*
  4.  Create a function using normal and arrow syntax.
*/
// Normal function
int addNormal(int a, int b) {
  return a + b;
}

// Arrow function
int addArrow(int a, int b) => a + b;