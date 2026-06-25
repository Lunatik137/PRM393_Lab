import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task_model.dart';
import 'package:lab11/repositories/task_repository.dart';

void main() {
  group('Task Repository Tests', () {
    late TaskRepository repository;

    setUp(() {
      repository = TaskRepository();
    });

    test('addTask should increase task count', () {
      // Arrange
      final task = Task(id: '1', title: 'New Task');

      // Act
      repository.addTask(task);

      // Assert
      expect(repository.tasks.length, 1);
      expect(repository.tasks.first.title, 'New Task');
    });

    test('deleteTask should remove task from list', () {
      // Arrange
      final task = Task(id: '1', title: 'Task to delete');
      repository.addTask(task);

      // Act
      repository.deleteTask('1');

      // Assert
      expect(repository.tasks.length, 0);
    });

    test('updateTask should modify existing task', () {
      // Arrange
      final task = Task(id: '1', title: 'Old Title');
      repository.addTask(task);
      final updatedTask = task.copyWith(title: 'New Title');

      // Act
      repository.updateTask(updatedTask);

      // Assert
      expect(repository.tasks.length, 1);
      expect(repository.tasks.first.title, 'New Title');
    });

    test('findTaskById should return correct task', () {
      // Arrange
      final task = Task(id: '1', title: 'Target Task');
      repository.addTask(task);

      // Act
      final result = repository.findTaskById('1');

      // Assert
      expect(result, isNotNull);
      expect(result?.title, 'Target Task');
    });
  });
}
