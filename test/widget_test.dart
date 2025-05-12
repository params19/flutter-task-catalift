import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catalift/main.dart';

void main() {
  testWidgets('Test courses screen UI', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const CataliftApp());

    // Verify that the 'Artificial Intelligence and ML' course is displayed.
    expect(find.byKey(Key('Artificial Intelligence and ML')), findsOneWidget);

    // Verify that other courses are displayed similarly.
    expect(find.byKey(Key('User Interface and User Experience')), findsOneWidget);
    expect(find.byKey(Key('Computer Engineering')), findsOneWidget);

    // Verify that the "See All" text is displayed in the sections.
    expect(find.text('See All'), findsOneWidget);

    // Verify the bottom navigation bar is present.
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
