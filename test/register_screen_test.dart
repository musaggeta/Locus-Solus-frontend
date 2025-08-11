import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:locus_solus_frontend/screens/register_screen.dart';

void main() {
  testWidgets('RegisterScreen renderiza correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));
    expect(find.text('Registro'), findsOneWidget);
    expect(find.text('Registrarse'), findsOneWidget);
  });
}
