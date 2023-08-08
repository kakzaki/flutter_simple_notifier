import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier/simple_notifier.dart';

void main() {
  testWidgets('Test ValueNotifierBuilderExtension',
      (WidgetTester tester) async {
    final count = ValueNotifier<int>(0);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: count.listen(
            builder: (context, value, child) {
              return Center(
                child: Text(value.toString()),
              );
            },
          ),
        ),
      ),
    );

    // Verify that the initial value (0) is displayed correctly
    expect(find.text('0'), findsOneWidget);

    // Update the ValueNotifier value and pump the widget
    count.value = 42;
    await tester.pump();

    // Verify that the updated value (42) is displayed correctly
    expect(find.text('42'), findsOneWidget);

    // Dispose of the ValueNotifier
    count.dispose();
  });

  testWidgets('Test ValueNotifierExtension', (WidgetTester tester) async {
    // Test the extension on different types

    // Test with int
    final intCount = 42.notifier;
    expect(intCount.value, equals(42));

    // Test with String
    final strValue = "Hello".notifier;
    expect(strValue.value, equals("Hello"));

    // Dispose of the ValueNotifiers
    intCount.dispose();
    strValue.dispose();
  });
}
