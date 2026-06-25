import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../repositories/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository _repository;

  TaskProvider(this._repository);

  List<Task> get tasks => _repository.tasks;

  void addTask(Task task) {
    _repository.addTask(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _repository.deleteTask(id);
    notifyListeners();
  }

  void updateTask(Task task) {
    _repository.updateTask(task);
    notifyListeners();
  }
}
