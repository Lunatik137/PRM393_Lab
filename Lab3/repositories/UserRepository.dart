import '../models/User.dart';

class UserRepository {
  // Simulate fetching JSON data from API
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 1));

    List<Map<String, dynamic>> jsonData = [
      {'name': 'Chien', 'email': 'chien@gmail.com'},
      {'name': 'Anh', 'email': 'anh@gmail.com'},
    ];

    // Convert JSON list to User list
    return jsonData.map((json) => User.fromJson(json)).toList();
  }
}