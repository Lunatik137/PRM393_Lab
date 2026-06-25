import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task_model.dart';

void main() {
  group('Task Model Tests', () {
    test('Task should be created with correct values', () {
      // Arrange
      const id = '1';
      const title = 'Test Task';

      // Act
      final task = Task(id: id, title: title);

      // Assert
      expect(task.id, id);
      expect(task.title, title);
      expect(task.isCompleted, false);
    });

    test('Task copyWith should update specified values', () {
      // Arrange
      final task = Task(id: '1', title: 'Original Title');

      // Act
      final updatedTask = task.copyWith(title: 'Updated Title', isCompleted: true);

      // Assert
      expect(updatedTask.id, '1');
      expect(updatedTask.title, 'Updated Title');
      expect(updatedTask.isCompleted, true);
    });
  });
}
