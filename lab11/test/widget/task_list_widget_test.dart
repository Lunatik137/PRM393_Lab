import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/repositories/task_repository.dart';
import 'package:lab11/screens/task_list_screen.dart';

void main() {
  group('TaskList Widget Tests', () {
    late TaskRepository repository;

    setUp(() {
      repository = TaskRepository();
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: TaskListScreen(repository: repository),
      );
    }

    testWidgets('Empty State displays correct message', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());

      // Act & Assert
      expect(find.text('No tasks yet. Add one!'), findsOneWidget);
    });

    testWidgets('Add Task shows task in list', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());

      // Act
      await tester.enterText(find.byType(TextField), 'Buy milk');
      await tester.tap(find.text('Add'));
      await tester.pump();

      // Assert
      expect(find.text('Buy milk'), findsOneWidget);
      expect(find.text('No tasks yet. Add one!'), findsNothing);
    });

    testWidgets('Multiple Tasks are visible', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest());

      // Act
      await tester.enterText(find.byType(TextField), 'Task 1');
      await tester.tap(find.text('Add'));
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'Task 2');
      await tester.tap(find.text('Add'));
      await tester.pump();

      // Assert
      expect(find.text('Task 1'), findsOneWidget);
      expect(find.text('Task 2'), findsOneWidget);
    });
  });
}
