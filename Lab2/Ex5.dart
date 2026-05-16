Future<void> main() async {

  /*
  1. Create an async function using Future + await.
  2. Use Future.delayed() to simulate loading.
   */

  print("Loading data...");

  String result = await fetchData();

  print(result);

  print("");

  /*
  3. Practice null-safety operators (?, ??, !).
   */

  String? name;

  // ??
  print("Name: ${name ?? "Unknown"}");

  // ?.
  print("Name length: ${name?.length}");

  // !
  String? city = "LaoCai";

  print("City length: ${city!.length}");

  print("");

  /*
  4. Create a simple Stream of integers and listen to values.
   */

  Stream<int> numberStream = countStream();

  numberStream.listen((number) {
    print("Stream value: $number");
  });

}

/*
Async function using Future + await
*/
Future<String> fetchData() async {

  await Future.delayed(Duration(seconds: 2));

  return "Data loaded successfully";
}

/*
Simple Stream of integers
*/
Stream<int> countStream() async* {

  for (int i = 1; i <= 5; i++) {

    await Future.delayed(Duration(seconds: 1));

    yield i;
  }
}