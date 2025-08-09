import 'package:flutter_test/flutter_test.dart';
import 'package:locus_solus_frontend/main.dart'; // Ajusta según tu paquete

void main() {
  testWidgets('HelloWidget shows initial loading text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Debe encontrar el texto inicial 'Cargando...'
    expect(find.text('Cargando...'), findsOneWidget);
  });
}
