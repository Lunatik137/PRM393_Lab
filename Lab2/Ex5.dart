Future<void> main() async {

  /*
  1. Create an async function using Future + await.
  2. Use Future.delayed() to simulate loading.
   */

  print("Checking order status...");

  String status = await checkOrderStatus("ORD123");

  print(status);

  print("");

  /*
  3. Practice null-safety operators (?, ??, !).
   */

  String? customerName;

  // ??
  print("Customer name: ${customerName ?? "Guest"}");

  // ?.
  print("Customer name length: ${customerName?.length}");

  String? deliveryAddress = "Hanoi, Vietnam";

  // !
  print("Delivery address length: ${deliveryAddress!.length}");

  print("");

  /*
  4. Create a simple Stream of integers and listen to values.
   */

  print("Tracking delivery progress:");

  Stream<int> progressStream = deliveryProgress();

  progressStream.listen((progress) {
    print("Delivery progress: $progress%");
  });

}

/*
Async function using Future + await
*/
Future<String> checkOrderStatus(String orderId) async {

  await Future.delayed(Duration(seconds: 2));

  return "Order $orderId is being delivered";
}

/*
Simple Stream of integers
*/
Stream<int> deliveryProgress() async* {

  for (int progress = 20; progress <= 100; progress += 20) {

    await Future.delayed(Duration(seconds: 1));

    yield progress;
  }
}