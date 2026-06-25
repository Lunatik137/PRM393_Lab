import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task_model.dart';
import 'package:lab11/repositories/task_repository.dart';
import 'package:lab11/screens/task_list_screen.dart';

void main() {
  group('Task Navigation Tests', () {
    late TaskRepository repository;

    setUp(() {
      repository = TaskRepository();
      repository.addTask(Task(id: '1', title: 'Navigation Task'));
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: TaskListScreen(repository: repository),
      );
    }

    testWidgets('Tapping task navigates to detail screen', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());

      // Act
      await tester.tap(find.text('Navigation Task'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.widgetWithText(AppBar, 'Task Detail'), findsOneWidget);
      expect(find.byKey(const Key('detailTitleField')), findsOneWidget);
    });
  });
}
