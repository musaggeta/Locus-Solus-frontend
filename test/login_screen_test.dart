import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:locus_solus_frontend/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen renderiza correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Iniciar Sesión'), findsOneWidget);
  });
}
