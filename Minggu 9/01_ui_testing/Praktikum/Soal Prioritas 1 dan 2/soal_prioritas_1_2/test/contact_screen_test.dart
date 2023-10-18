import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soal_prioritas_1_2/screens/contact_screen.dart';

// SOAL PRIORITAS 1
void main() {
  testWidgets('Judul harus Contacts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactScreen(),
    ));

    expect(find.text('Contacts'), findsOneWidget);
  });

  testWidgets(
      'Body Harus memiliki title, description, field Name, Phone, dan button Submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactScreen(),
    ));

    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(
        find.text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made'),
        findsOneWidget);
    expect(find.widgetWithText(TextField, 'Name'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Phone'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
  });
}
