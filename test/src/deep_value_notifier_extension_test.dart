import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier/simple_notifier.dart';

class Person {
  final String name;
  final int age;
  final List<String> families;

  Person({
    required this.name,
    required this.age,
    required this.families,
  });
}

void main() {
  testWidgets('Test DeepValueNotifierBuilderExtension',
      (WidgetTester tester) async {
    final count = DeepValueNotifier<List<Person>>([
      Person(name: "paijo", age: 12, families: ['ngatimin', 'suparman']),
      Person(name: "paijo 2", age: 13, families: ['ngatimin', 'suparman 2']),
      Person(name: "paijo 3", age: 14, families: ['ngatimin', 'suparman 3'])
    ]);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: count.listen(
            builder: (context, value, child) {
              return Center(
                child: Text(value[2].families[1]),
              );
            },
          ),
        ),
      ),
    );

    // Verify that the initial value (suparman 3) is displayed correctly
    expect(find.text('suparman 3'), findsOneWidget);

    // Update the DeepValueNotifier value and pump the widget
    count.value[2].families[1] = "anderson";

    expect(count.value[2].families[1], equals("anderson"));
    count.refresh();
    await tester.pump();

    // Verify that the updated value (anderson) is displayed correctly
    expect(find.text("anderson"), findsOneWidget);

    // Dispose of the DeepValueNotifier
    count.dispose();
  });

  testWidgets('Test DeepValueNotifierExtension', (WidgetTester tester) async {
    // Test the extension on different types

    // Test with int
    final intCount = 42.deepNotifier;
    expect(intCount.value, equals(42));

    // Test with String
    final strValue = "Hello".deepNotifier;
    expect(strValue.value, equals("Hello"));

    // Dispose of the DeepValueNotifiers
    intCount.dispose();
    strValue.dispose();
  });
}
