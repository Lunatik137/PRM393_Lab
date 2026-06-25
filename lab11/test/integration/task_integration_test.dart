import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/main.dart';
import 'package:lab11/repositories/task_repository.dart';

void main() {
  group('Task Integration Tests', () {
    testWidgets('Complete user flow: Add, Edit, and Save', (WidgetTester tester) async {
      // Arrange
      final repository = TaskRepository();
      await tester.pumpWidget(MyApp(repository: repository));

      // Act 1: Create Task "Original title"
      await tester.enterText(find.byType(TextField), 'Original title');
      await tester.tap(find.text('Add'));
      await tester.pump(); // Pump to let list update

      // Verify "Original title" exists
      expect(find.text('Original title'), findsOneWidget);

      // Act 2: Open Detail
      await tester.tap(find.text('Original title'));
      await tester.pumpAndSettle(); // Wait for navigation animation

      // Verify we are on Detail screen
      expect(find.widgetWithText(AppBar, 'Task Detail'), findsOneWidget);

      // Act 3: Edit "Updated title"
      await tester.enterText(find.byKey(const Key('detailTitleField')), 'Updated title');

      // Act 4: Save
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle(); // Wait for navigation to return

      // Verify we are back to List screen and updated title appears
      expect(find.text('Original title'), findsNothing);
      expect(find.text('Updated title'), findsOneWidget);
    });
  });
}
