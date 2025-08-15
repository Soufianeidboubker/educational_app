import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:educational_app/main.dart';  // Import your main.dart

void main() {
  testWidgets('Educational App UI smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const EducationalApp());

    // Verify key UI elements exist.
    expect(find.text('Educational App'), findsOneWidget);  // AppBar title
    expect(find.text('Welcome Back!'), findsOneWidget);    // Header
    expect(find.text('Introduction to Flutter'), findsOneWidget);  // Example course title
    expect(find.byIcon(Icons.home), findsOneWidget);       // Bottom nav icon
  });
}