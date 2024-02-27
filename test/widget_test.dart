// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:proyecto_integrador/Vista/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verifica que el contador comience en 0.
    expect(find.text('0'), findsNothing); // No debe encontrar '0' inicialmente
    expect(find.text('1'), findsNothing); // Tampoco debe encontrar '1'

    // Triggera una acción que muestre el texto '0'
    await tester.tap(find.byIcon(Icons.add)); // Toca el botón de suma
    await tester.pump(); // Reconstruye el widget después de la acción

    // Verifica que el texto '0' ahora esté presente.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing); // Todavía no debería encontrar '1'

    // Toca el botón de suma nuevamente
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifica que el contador ha incrementado a '1'
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}